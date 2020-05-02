function [metrics_out,table_out] = metrics_matrix_dualsubject(mat1_in, mat2_in)

mat1_in=double(mat1_in);
mat2_in=double(mat2_in);

MAE=sum(abs(mat1_in-mat2_in),'all');
MDE=sum((mat1_in-mat2_in),'all');
MSDE=sum((mat1_in.^2-mat2_in.^2),'all');


table_out=table(MAE,MDE,MSDE);
metrics_out=[MAE,MDE,MSDE];



end

