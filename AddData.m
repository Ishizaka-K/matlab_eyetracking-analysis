clear;
for count=1:14
disp(count);
eyedata=readmatrix('E:\Document\Asoturon\EyeSacker\'+string(count)+'EyeSacker.csv');
hdat1=readmatrix('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata.csv');
hdat2=readmatrix('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata2.csv');
hdat3=[hdat1;hdat2];
%eyedata(eyedata(:,1)==0&eyedata(:,2)==0&eyedata(:,3)==0&eyedata(:,4)==0,:)=[];
no=[0,0,0,0,0,0,0,0,0,0];
hdat3=[no;hdat3];
F=0;%6
M=0;%7
B=0;%8
i=2;
while 1
if hdat3(i-1,6)~=hdat3(i,6)
    depth(i,1)=1;
elseif hdat3(i-1,7)~=hdat3(i,7)
    depth(i,1)=2;
elseif hdat3(i-1,8)~=hdat3(i,8)
    depth(i,1)=3;
else
    disp("erro");
end

if height(hdat3)==i
break;
end

i=i+1;
end
depth(depth==0)=[];
add_data=[eyedata,depth];
eData=array2table(add_data,'VariableNames',{'Traget','Xposition','Yposition','timig','depth'});
writetable(eData,'E:\Document\Asoturon\EyeSacker\'+string(count)+'EyeSacker.csv');
clear;
end