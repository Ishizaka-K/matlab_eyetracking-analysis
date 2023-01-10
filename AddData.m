clear;
for count=1:14
disp(count);
eyedata=readmatrix('E:\Document\Asoturon\EyeSacker\'+string(count)+'EyeSacker.csv');
hdat1=readmatrix('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata.csv');
hdat2=readmatrix('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata2.csv');
hdat3=[hdat1;hdat2];
%eyedata(eyedata(:,1)==0&eyedata(:,2)==0&eyedata(:,3)==0&eyedata(:,4)==0,:)=[];
F=0;%6
M=0;%7
B=0;%8
i=1;
while 1
if F<sum(hdat3(1:i,6))
    depth(i,1)=1;
    F=sum(hdat3(1:i,6));
elseif M<sum(hdat3(1:i,7))
    depth(i,1)=2;
    M=sum(hdat3(1:i,7));
elseif B<sum(hdat3(1:i,8))
    depth(i,1)=3;
    B=sum(hdat3(1:i,8));
else
    disp("erro");
end

if height(hdat3)==i
break;
end

i=i+1;
end

add_data=[eyedata,depth];
clear;
end