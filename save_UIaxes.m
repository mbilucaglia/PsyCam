function [] = save_UIaxes(UIAxes,colorbar_obj,filename)

% Create a temporary figure with axes.
fig = figure;
%fig.Visible = 'off';
figAxes = axes(fig);
colormap(figAxes,"hsv");

% Copy all UIAxes children, take over axes limits and aspect ratio.            
allChildren = UIAxes.Children;
copyobj(allChildren, figAxes);
figAxes.XLim = UIAxes.XLim;
figAxes.YLim = UIAxes.YLim;
figAxes.ZLim = UIAxes.ZLim;
figAxes.DataAspectRatio = UIAxes.DataAspectRatio;
figAxes.CLim=UIAxes.CLim;

cb=colorbar(figAxes);

fig.Children(1).Location=colorbar_obj.Location;
fig.Children(1).FontSize=colorbar_obj.FontSize;
fig.Children(1).Label.String=colorbar_obj.Label.String;
fig.Children(1).Label.FontSize=colorbar_obj.Label.FontSize;
fig.Children(1).Ticks=colorbar_obj.Ticks;
fig.Children(1).TickLabels=colorbar_obj.TickLabels;

% Save as png and fig files.
saveas(fig,filename,'png');

% Delete the temporary figure.
delete(fig);


end

