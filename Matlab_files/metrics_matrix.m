function [metrics_out,table_out] = metrics_matrix(mat_in)

mat_in=double(reshape(mat_in,1,[]));
Mean=nanmean(mat_in);
Std=nanstd(mat_in,0);
Max=nanmax(mat_in);
Min=nanmin(mat_in);
Sum=nansum(mat_in);


table_out=table(Sum,Max,Min,Mean,Std);
metrics_out=[Sum,Max,Min,Mean,Std];

end

