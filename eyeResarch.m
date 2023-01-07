clear;
con=0;
count=7;
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
        x(:,i)=0;
        hazure=hazure+1;
    else
    x(:,i)=itizi(1,1);
    end
end
                                            
                                            
                                            


figure
plot(Eyedata.x,Eyedata.y)
        xlim([-1 1])
        ylim([-1 1]);
number=1;
while 1
    con=con+1;
    if Eyedata.ID(con)==2||Eyedata.ID(con)==1
        Tracking(number,1:2)=Eyedata(con,2:3);
        number=number+1;
    elseif Eyedata.ID(con)==3
        [pks,locs] = findpeaks(Tracking.x);
        figure
        plot(rotate([Tracking.x,Tracking.y],45,[0 0]))
        xlim([-1 1])
        ylim([-1 1]);
        clear Tracking;
    end
    
    if height(Eyedata)*(1/18)<=con
        break;
    end
end

