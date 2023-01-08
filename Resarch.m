clear;
for i=1:14
    fl=('E:\Document\MATLAB\'+string(i)+'/eyeData.txt');
    opts2=detectImportOptions(fl,'Encoding','UTF-8','ReadVariableNames',false,'ExtraColumnsRule','wrap');% サンプルデータのデータ形式判定
    hdat2=readmatrix(fl, opts2,'Encoding','UTF-8');
end