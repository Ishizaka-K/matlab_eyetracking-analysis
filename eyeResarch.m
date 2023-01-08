for count=1:14
con=0;
fl=('E:\Document\MATLAB\'+string(count)+'/ResultData.txt');
opts2=detectImportOptions(fl,'Encoding','UTF-8','ReadVariableNames',false,'ExtraColumnsRule','wrap');% サンプルデータのデータ形式判定
hdat2=readmatrix(fl, opts2,'Encoding','UTF-8'); % サンプルデータを表として読み込む
ResultData=array2table(hdat2,'VariableNames',{'ID','SetNum','TarPos','SabPos1','SabPos2','Fro','Mid','Bott','c/f','Reaction'});


%eyedata=["ID" , "x" , "y", "z", "time"];
fl=('E:\Document\MATLAB\'+string(count)+'/EyeTracking/0.txt');
opts=detectImportOptions(fl); % サンプルデータのデータ形式判定
EyeSpot=readmatrix(fl, opts);
eyedata=EyeSpot;
%zeroの読み込みa
for i=1:108
    fl=('E:\Document\MATLAB\'+string(count)+'/EyeTracking/'+string(i)+'.txt');
    opts=detectImportOptions(fl); % サンプルデータのデータ形式判定
    EyeSpot=readmatrix(fl, opts);% サンプルデータを表として読み込む
    response=double(eyedata(end,5))+table2array(ResultData(i,10));
    eyedata(end,1)=2;
    while 1
        con=con+1;
        EyeSpot(con,1)=1;
        if response<EyeSpot(con,5)
            EyeSpot(con,1)=3;
            con=0;
            break;
        end
    end
    eyedata=[eyedata;EyeSpot];
    disp(i);
end
Eyedata=table(eyedata(:,1),eyedata(:,2),eyedata(:,3),eyedata(:,4),eyedata(:,5),...
    'VariableNames',{'ID','x','y','z','time'});
cou=1;
co=1;
c=1;
cn=1;
ti=1;
while 1
    if eyedata(cou,1)==0
        spotdata(co,1)=eyedata(cou,2);
        spotdata(co,2)=eyedata(cou,3);
        spotdata(co,3)=eyedata(cou,4);
        cou=cou+1;
        co=co+1;
    elseif eyedata(cou,1)~=0
        xav=mean(spotdata(:,1));
        yav=mean(spotdata(:,2));
        sacker(c,1)=eyedata(cou,1);
        sacker(c,2)=eyedata(cou,2)-xav;
        sacker(c,3)=eyedata(cou,3)-yav;
        xsacker(cn,ti)=eyedata(cou,2)-xav;
        ysacker(cn,ti)=eyedata(cou,3)-yav;
        cou=cou+1;
        cn=cn+1;
        co=1;
        c=c+1;
        if eyedata(cou,1)==3
            ti=ti+1;
            cn=1;
        end
    end
    if height(eyedata)==cou
        break;
    end
end
hazure=0;
for i=1:108
    [itizi,z]=findpeaks((xsacker(:,i).^2),'MinPeakHeight',0.015,'MinPeakDistance',20,'MaxPeakWidth',1);
    if isempty(itizi)
        x(i,1:2)=0;
        timingdata(i,1)=0;
        hazure=hazure+1;
    else
        x(i,1)=xsacker(z(1),i);
        x(i,2)=ysacker(z(1),i);
        timingdata(i,1)=z(1);
    end
end
for i=1:108
if hdat2(i,3)==0
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(25.57)), -sin(deg2rad(25.57));
        sin(deg2rad(25.57)), cos(deg2rad(25.57))];
    c=b*a;
    Data(i,1)=0;
    Data(i,2)=c(1,1);
    Data(i,3)=c(2,1);
elseif hdat2(i,3)==1
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(90)), -sin(deg2rad(90));
        sin(deg2rad(90)), cos(deg2rad(90))];
    c=b*a;
    Data(i,1)=1;
    Data(i,2)=c(1,1);
    Data(i,3)=c(2,1);
elseif hdat2(i,3)==2
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(154.43)), -sin(deg2rad(154.43));
        sin(deg2rad(154.43)), cos(deg2rad(154.43))];
    c=b*a;
    Data(i,1)=2;
    Data(i,2)=c(1,1);
    Data(i,3)=c(2,1);
elseif hdat2(i,3)==3
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(-154.43)), -sin(deg2rad(-154.43));
        sin(deg2rad(-154.43)), cos(deg2rad(-154.43))];
    c=b*a;
    Data(i,1)=3;
    Data(i,2)=c(1,1);
    Data(i,3)=c(2,1);
elseif hdat2(i,3)==4
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(-90)), -sin(deg2rad(-90));
        sin(deg2rad(-90)), cos(deg2rad(-90))];
    c=b*a;
    Data(i,1)=4;
    Data(i,2)=c(1,1);
    Data(i,3)=c(2,1);
elseif hdat2(i,3)==5
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(-25.57)), -sin(deg2rad(-25.57));
        sin(deg2rad(-25.57)), cos(deg2rad(-25.57))];
    c=b*a;
    Data(i,1)=5;
    Data(i,2)=c(1,1);
    Data(i,3)=c(2,1);
end
end




con=0;
fl=('E:\Document\MATLAB\'+string(count)+'/ResultData2.txt');
opts2=detectImportOptions(fl,'Encoding','UTF-8','ReadVariableNames',false,'ExtraColumnsRule','wrap');% サンプルデータのデータ形式判定
hdat2=readmatrix(fl, opts2,'Encoding','UTF-8'); % サンプルデータを表として読み込む
ResultData=array2table(hdat2,'VariableNames',{'ID','SetNum','TarPos','SabPos1','SabPos2','Fro','Mid','Bott','c/f','Reaction'});


%eyedata=["ID" , "x" , "y", "z", "time"];
fl=('E:\Document\MATLAB\'+string(count)+'/EyeTracking2/0.txt');
opts=detectImportOptions(fl); % サンプルデータのデータ形式判定
EyeSpot=readmatrix(fl, opts);
eyedata=EyeSpot;
%zeroの読み込みa
for i=1:108
    fl=('E:\Document\MATLAB\'+string(count)+'/EyeTracking2/'+string(i)+'.txt');
    opts=detectImportOptions(fl); % サンプルデータのデータ形式判定
    EyeSpot=readmatrix(fl, opts);% サンプルデータを表として読み込む
    response=double(eyedata(end,5))+table2array(ResultData(i,10));
    eyedata(end,1)=2;
    while 1
        con=con+1;
        EyeSpot(con,1)=1;
        if response<=EyeSpot(con,5)
            EyeSpot(con,1)=3;
            con=0;
            break;
        elseif height(EyeSpot)==con
            EyeSpot(con,1)=3;
            con=0;
            break;
        end
    end
    eyedata=[eyedata;EyeSpot];
    disp(i);
end
Eyedata=table(eyedata(:,1),eyedata(:,2),eyedata(:,3),eyedata(:,4),eyedata(:,5),...
    'VariableNames',{'ID','x','y','z','time'});
cou=1;
co=1;
c=1;
cn=1;
ti=1;
while 1
    if eyedata(cou,1)==0
        spotdata(co,1)=eyedata(cou,2);
        spotdata(co,2)=eyedata(cou,3);
        spotdata(co,3)=eyedata(cou,4);
        co=co+1;
    elseif eyedata(cou,1)~=0
        xav=mean(spotdata(:,1));
        yav=mean(spotdata(:,2));
        sacker(c,1)=eyedata(cou,1);
        sacker(c,2)=eyedata(cou,2)-xav;
        sacker(c,3)=eyedata(cou,3)-yav;
        xsacker(cn,ti)=eyedata(cou,2)-xav;
        ysacker(cn,ti)=eyedata(cou,3)-yav;
        cn=cn+1;
        co=1;
        c=c+1;
        if eyedata(cou,1)==3
            ti=ti+1;
            cn=1;
        end
    end
    if height(eyedata)==cou
        break;
    end
    cou=cou+1;
end
for i=1:108
    [itizi,z]=findpeaks((xsacker(:,i).^2),'MinPeakHeight',0.015,'MinPeakDistance',20,'MaxPeakWidth',1);
    if isempty(itizi)
        timingdata(108+i,1)=0;
        x(i,1:2)=0;
        hazure=hazure+1;
    else
        x(i,1)=xsacker(z(1),i);
        x(i,2)=ysacker(z(1),i);
        timingdata(108+i,1)=z(1);
    end
end

for i=1:108
if hdat2(i,3)==0
%     Data(108+i,2)=x(i,1);
%     Data(108+i,3)=x(i,2);
    a=[x(i,1);x(i,2);];
    b=[2/sqrt(5), -1/sqrt(5);
        1/sqrt(5), 2/sqrt(5)];
    c=b*a;
    Data(108+i,1)=0;
    Data(108+i,2)=c(1,1);
    Data(108+i,3)=c(2,1);
elseif hdat2(i,3)==1
%     Data(108+i,2)=x(i,1);
%     Data(108+i,3)=x(i,2);
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(90)), -sin(deg2rad(90));
        sin(deg2rad(90)), cos(deg2rad(90))];
    c=b*a;
    Data(108+i,1)=1;
    Data(108+i,2)=c(1,1);
    Data(108+i,3)=c(2,1);
elseif hdat2(i,3)==2
%     Data(108+i,2)=x(i,1);
%     Data(108+i,3)=x(i,2);
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(90+63.434948822922)), -sin(deg2rad(90+63.434948822922));
        sin(deg2rad(90+63.434948822922)), cos(deg2rad(90+63.434948822922))];
    c=b*a;
    Data(108+i,1)=2;
    Data(108+i,2)=c(1,1);
    Data(108+i,3)=c(2,1);
elseif hdat2(i,3)==3
%     Data(108+i,2)=x(i,1);
%     Data(108+i,3)=x(i,2);
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(-(90+63.434948822922))), -sin(deg2rad(-(90+63.434948822922)));
        sin(deg2rad(-(90+63.434948822922))), cos(deg2rad(-(90+63.434948822922)))];
    c=b*a;
    Data(108+i,1)=3;
    Data(108+i,2)=c(1,1);
    Data(108+i,3)=c(2,1);
elseif hdat2(i,3)==4
%     Data(108+i,2)=x(i,1);
%     Data(108+i,3)=x(i,2);
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(-90)), -sin(deg2rad(-90));
        sin(deg2rad(-90)), cos(deg2rad(-90))];
    c=b*a;
    Data(108+i,1)=4;
    Data(108+i,2)=c(1,1);
    Data(108+i,3)=c(2,1);
elseif hdat2(i,3)==5
%     Data(108+i,2)=x(i,1);
%     Data(108+i,3)=x(i,2);
    a=[x(i,1);x(i,2);];
    b=[2/sqrt(5), 1/sqrt(5);
       -1/sqrt(5), 2/sqrt(5)];
    c=b*a;
    Data(108+i,1)=5;
    Data(108+i,2)=c(1,1);
    Data(108+i,3)=c(2,1);
end
end
Data=horzcat(Data,timingdata);
Data(height(Data)+1,1)=hazure;


figure
scatter(Data(:,2),Data(:,3))
xlim([-1 1])
ylim([-1 1]);

eData=array2table(Data,'VariableNames',{'TragetPosition','Xposition','Yposition','timig'});
writetable(eData,'E:\Document\MATLAB\'+string(count)+'/eyeData.txt');
clear;
end
