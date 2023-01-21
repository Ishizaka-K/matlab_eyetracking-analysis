clear;
hdat4(1,1:10)=0;
for count=1:14
disp(count);
hdat1=readmatrix('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata.csv');
hdat2=readmatrix('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata2.csv');
hdat3=[hdat1;hdat2];
hdat4=[hdat4;hdat3;];
end
hdat4(hdat4(:,10)>5,:)=[];
hdat4(hdat4(:,9)==0,:)=[];
hdat4(hdat4(:,1)==0,:)=[];

Spotdata(1,:)=mean(hdat4(hdat4(:,2)==0|hdat4(:,2)==1,10));
Spotdata(2,:)=mean(hdat4(hdat4(:,2)==7|hdat4(:,2)==8,10));
Spotdata(3,:)=mean(hdat4(hdat4(:,2)==14|hdat4(:,2)==15,10));

figure;
plot(Spotdata(:,1));

Spotdata1=mean(hdat4(hdat4(:,7)==6,10));
Spotdata2=mean(hdat4(hdat4(:,7)==9,10));
Spotdata3=mean(hdat4(hdat4(:,7)==12,10));
Spotdata4=mean(hdat4(hdat4(:,7)==13,10));
result=[Spotdata1,Spotdata2;Spotdata3,Spotdata4];
