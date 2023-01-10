clear;
for count=1:14
    disp(count);
con=0;
hdat2=xlsread('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata.csv'); % サンプルデータを表として読み込む


%eyedata=["ID" , "x" , "y", "z", "time"];
fl=('E:\Document\MATLAB\'+string(count)+'/EyeTracking/0.txt');
opts=detectImportOptions(fl); % サンプルデータのデータ形式判定
EyeSpot=readmatrix(fl, opts);
eyedata=EyeSpot;
kaisu=0;
%zeroの読み込みa
for i=1:108
    fl=('E:\Document\MATLAB\'+string(count)+'/EyeTracking/'+string(i)+'.txt');
    opts=detectImportOptions(fl); % サンプルデータのデータ形式判定
    EyeSpot=readmatrix(fl, opts);% サンプルデータを表として読み込む
    response=double(eyedata(end,5))+hdat2(i,10);
    eyedata(end,1)=1;
    while 1
        con=con+1;
        EyeSpot(con,1)=1;
        if response<EyeSpot(con,5)
            EyeSpot(con,1)=3;
            kaisu=kaisu+1;
            con=0;
            break;
        end
    end
    eyedata=[eyedata;EyeSpot];
end
[a,b]=findpeaks(eyedata(:,1));
Eyedata=table(eyedata(:,1),eyedata(:,2),eyedata(:,3),eyedata(:,4),eyedata(:,5),...
    'VariableNames',{'ID','x','y','z','time'});
writetable(Eyedata,'E:\Document\Asoturon\EyeMove\'+string(count)+'AllEyeMov1.csv');


con=0;
hdat2=xlsread('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata.csv'); % サンプルデータを表として読み込む
fl=('E:\Document\MATLAB\'+string(count)+'/EyeTracking2/0.txt');
opts=detectImportOptions(fl); % サンプルデータのデータ形式判定
EyeSpot=readmatrix(fl, opts);
eyedata=EyeSpot;
%zeroの読み込みa
for i=1:108
    fl=('E:\Document\MATLAB\'+string(count)+'/EyeTracking2/'+string(i)+'.txt');
    opts=detectImportOptions(fl); % サンプルデータのデータ形式判定
    EyeSpot=readmatrix(fl, opts);% サンプルデータを表として読み込む
    response=double(eyedata(end,5))+hdat2(i,10);
    eyedata(end,1)=1;
    while 1
        con=con+1;
        EyeSpot(con,1)=1;
        if response<EyeSpot(con,5)
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
end
Eyedata=table(eyedata(:,1),eyedata(:,2),eyedata(:,3),eyedata(:,4),eyedata(:,5),...
    'VariableNames',{'ID','x','y','z','time'});
writetable(Eyedata,'E:\Document\Asoturon\EyeMove\'+string(count)+'AllEyeMov2.csv');
clear;
end