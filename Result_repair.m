clear;
%ここを変更---
for count=1:14
fname='ResultData2';
%-----------
disp(count);
con=0;
cou=1;
counter=zeros;
hdat=xlsread('E:\Document\MATLAB\'+string(count)+'/'+fname+'.xls');

hdat_copy=hdat;
for i=1:108
    if i==1
        hdat(i,2)=hdat_copy(end,2);
    else
        hdat(i,2)=hdat_copy(i-1,2); 
    end 
end


  ResultData=array2table(hdat,'VariableNames',{'ID','SetNum','TarPos','SabPos1','SabPos2','Fro','Mid','Bott','c/f','Reaction'});
  writetable(ResultData,'E:\Document\Asoturon\ResultData\'+string(count)+fname+'.csv');
  clear;
end
