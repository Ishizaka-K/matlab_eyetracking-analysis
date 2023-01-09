clear;
svdata=[0,0,0,0];
for count=1:14

fl=('E:\Document\MATLAB\'+string(count)+'/eyeData.txt');
opts2=detectImportOptions(fl,'Encoding','UTF-8','ReadVariableNames',false,'ExtraColumnsRule','wrap');% サンプルデータのデータ形式判定
hdat2=readmatrix(fl, opts2,'Encoding','UTF-8'); % サンプルデータを表として読み込む
zerdata=find(hdat2(:,4)==0);
hdat2(zerdata,:)=[];
data=hdat2;
svdata=[svdata;data];
avdata(count,1)=mean(data(:,2));
avdata(count,2)=mean(data(:,3));
end
svdata(1,:)=[];
svdata(end+1,1)=mean(svdata(:,4));
figure
scatter(avdata(:,1),avdata(:,2))
xlim([-0.1 0.1])
ylim([-0.1 0.1]);

avsa=array2table(avdata,'VariableNames',{'Xposition','Yposition'});
writetable(avsa,'E:\Document\MATLAB\AverageEyeData.xls');

figure
scatter(svdata(1:(end-1),2),svdata(1:(end-1),3))
xlim([-0.5 0.5])
ylim([-0.5 0.5]);

eData=array2table(svdata,'VariableNames',{'TragetPosition','Xposition','Yposition','time'});
writetable(eData,'E:\Document\MATLAB\AllEyeData.xls');

svdata(:,4)=[];
data0=[0,0,0];
data1=[0,0,0];
data2=[0,0,0];
data3=[0,0,0];
data4=[0,0,0];
data5=[0,0,0];
for j=1:height(svdata)
    if svdata(j,1)==0
    data0=[data0;svdata(j,:)];
    elseif svdata(j,1)==1
    data1=[data1;svdata(j,:)];
    elseif svdata(j,1)==2
    data2=[data2;svdata(j,:)];
    elseif svdata(j,1)==3
    data3=[data3;svdata(j,:)];
    elseif svdata(j,1)==4
    data4=[data4;svdata(j,:)];
    elseif svdata(j,1)==5
    data5=[data5;svdata(j,:)];
    end
end
figure
scatter(data0(:,2),data0(:,3))
xlim([-0.5 0.5])
ylim([-0.5 0.5]);

figure
scatter(data1(:,2),data1(:,3))
xlim([-0.5 0.5])
ylim([-0.5 0.5]);


figure
scatter(data2(:,2),data2(:,3))
xlim([-0.5 0.5])
ylim([-0.5 0.5]);

figure
scatter(data3(:,2),data3(:,3))
xlim([-0.5 0.5])
ylim([-0.5 0.5]);

figure
scatter(data4(:,2),data4(:,3))
xlim([-0.5 0.5])
ylim([-0.5 0.5]);

figure
scatter(data5(:,2),data5(:,3))
xlim([-0.5 0.5])
ylim([-0.5 0.5]);