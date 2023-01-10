clear;
for count=1:14
disp(count);
eyedata=xlsread('E:\Document\Asoturon\EyeMove\'+string(count)+'AllEyeMov1.csv');
hdat2=xlsread('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata.csv');

cou=1;
co=1;
c=1;
cn=1;
ti=1;
while 1
    if eyedata(cou,1)==0
        spotdata(co,1)=eyedata(cou,2);
        spotdata(co,2)=eyedata(cou,3);
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
    [itizi,z]=findpeaks(abs(xsacker(:,i).*100),'MinPeakDistance',10,'MinPeakHeight',1);
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
%     Data(108+i,2)=x(i,1);
%     Data(108+i,3)=x(i,2);
    a=[x(i,1);x(i,2);];
    b=[2/sqrt(5), -1/sqrt(5);
        1/sqrt(5), 2/sqrt(5)];
    c=b*a;
    Data(i,1)=0;
    Data(i,2)=c(1,1);
    Data(i,3)=c(2,1);
elseif hdat2(i,3)==1
%     Data(108+i,2)=x(i,1);
%     Data(108+i,3)=x(i,2);
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(90)), -sin(deg2rad(90));
        sin(deg2rad(90)), cos(deg2rad(90))];
    c=b*a;
    Data(i,1)=1;
    Data(i,2)=c(1,1);
    Data(i,3)=c(2,1);
elseif hdat2(i,3)==2
%     Data(108+i,2)=x(i,1);
%     Data(108+i,3)=x(i,2);
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(90+63.434948822922)), -sin(deg2rad(90+63.434948822922));
        sin(deg2rad(90+63.434948822922)), cos(deg2rad(90+63.434948822922))];
    c=b*a;
    Data(i,1)=2;
    Data(i,2)=c(1,1);
    Data(i,3)=c(2,1);
elseif hdat2(i,3)==3
%     Data(108+i,2)=x(i,1);
%     Data(108+i,3)=x(i,2);
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(-(90+63.434948822922))), -sin(deg2rad(-(90+63.434948822922)));
        sin(deg2rad(-(90+63.434948822922))), cos(deg2rad(-(90+63.434948822922)))];
    c=b*a;
    Data(i,1)=3;
    Data(i,2)=c(1,1);
    Data(i,3)=c(2,1);
elseif hdat2(i,3)==4
%     Data(108+i,2)=x(i,1);
%     Data(108+i,3)=x(i,2);
    a=[x(i,1);x(i,2);];
    b=[cos(deg2rad(-90)), -sin(deg2rad(-90));
        sin(deg2rad(-90)), cos(deg2rad(-90))];
    c=b*a;
    Data(i,1)=4;
    Data(i,2)=c(1,1);
    Data(i,3)=c(2,1);
elseif hdat2(i,3)==5
%     Data(108+i,2)=x(i,1);
%     Data(108+i,3)=x(i,2);
    a=[x(i,1);x(i,2);];
    b=[2/sqrt(5), 1/sqrt(5);
       -1/sqrt(5), 2/sqrt(5)];
    c=b*a;
    Data(i,1)=5;
    Data(i,2)=c(1,1);
    Data(i,3)=c(2,1);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
eyedata=xlsread('E:\Document\Asoturon\EyeMove\'+string(count)+'AllEyeMov2.csv');
hdat2=xlsread('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata2.csv');

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
    [itizi,z]=findpeaks(abs(xsacker(:,i).*100),'MinPeakDistance',10,'MinPeakHeight',1);
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

Data=[Data,timingdata];
%Data(end+1,1)=hazure;
disp(height(Data));
writematrix(Data,'E:\Document\Asoturon\EyeSacker\'+string(count)+'EyeSacker.csv');

clear;
end