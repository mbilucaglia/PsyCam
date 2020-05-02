function [mat_out] = binning_matrix(mat_in,bin_ratio)

if size(mat_in,3)>1
    mat_in=mean(mat_in,3);
end

[r,c]=size(mat_in);

n=sqrt(bin_ratio);
mat_out=zeros(n,n);

%excess rounding (not simple "round");
step_raw=ceil(r/n);
step_col=ceil(c/n);

k_raw=0;

for i=1:step_raw:r
    
    k_col=0;
    k_raw=k_raw+1;
    
    for j=1:step_col:c
        
        k_col=k_col+1;
        
        i_low=i;
        i_high=min(i+step_raw-1,r);
        j_low=j;
        j_high=min(j+step_col-1,c);
        
        mat_temp=mat_in(i_low:i_high,j_low:j_high);
        
        mat_out(k_raw,k_col)=nanmean(mean(mat_temp));
    end
end





end

