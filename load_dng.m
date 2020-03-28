function [data_struct,cfa,filename] = load_dng(filename)

%suppress anoying warning
warning('off','imageio:tifftagsread:zeroComponentCount');

if nargin<1
    [file, path]=uigetfile({'*.DNG','*.dng'});
    filename=sprintf('%s\\%s',path,file);
end

t = Tiff(filename,'r');
offsets = getTag(t,'SubIFD');
setSubDirectory(t,offsets(1));
cfa = read(t);
range=[intmin(class(cfa)), intmax(class(cfa))];

info=imfinfo(filename);
info=info.SubIFDs{1};

if isfield(info,'LinearizationTable')
    lin_table=info.LinearizationTable;
end

[path,file]=fileparts(filename);

data_struct=struct;
data_struct.path=string(path);
data_struct.name=string(file);
data_struct.cfa=cfa;
data_struct.range=range;

end

