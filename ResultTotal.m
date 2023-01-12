clear;
data0=zeros(1,10);
data1=zeros(1,10);
data2=zeros(1,10);

for count=1:14
disp(count);
hdat1=readmatrix('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata.csv');
hdat2=readmatrix('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata2.csv');
hdat3=[hdat1;hdat2];
data0=zeros(1,10);
data1=zeros(1,10);
data2=zeros(1,10);
hdat3=[0,0,0,0,0,0,0,0,0,0;hdat3];

for j=1:height(hdat3)
    if hdat3(j,5)==1
    data0=[data0;hdat3(j,:)];
    elseif hdat3(j,5)==2
    data1=[data1;hdat3(j,:)];
    elseif hdat3(j,5)==3
    data2=[data2;hdat3(j,:)];
    end
end

%F_icchi
icchi(count,1)=mean(data0(data0(:,2)==0|data0(:,2)==1));
%F_hui
hui(count,1)=mean(data0(data0(:,2)==2|data0(:,2)==3));
%F_no
no(count,1)=mean(data0(data0(:,2)==4|data0(:,2)==5));

%M_icchi
icchi(count,2)=mean(data1(data1(:,2)==7|data1(:,2)==8));
%M_hui
hui(count,2)=mean(data1(data1(:,2)==6|data1(:,2)==9));
%M_no
no(count,2)=mean(data1(data1(:,2)==10|data1(:,2)==11));

%B_icchi
icchi(count,3)=mean(data2(data2(:,2)==14|data2(:,2)==15));
%B_hui
hui(count,3)=mean(data2(data2(:,2)==12|data2(:,2)==13));
%B_no
no(count,3)=mean(data2(data2(:,2)==16|data2(:,2)==17));

clear hdat3 data0 data1 data2;
end
total=[icchi,hui,no];
TotalR=array2table(total,'VariableNames',{'F_icchi','M_icchi','B_icchi','F_hui','M_hui','B_hui', ...
    'F_no','M_no','B_no'});
writetable(TotalR,'E:\Document\Asoturon\TotalVariable.csv');



% data0(1:10,:)=[];
% avcorrect(1,:)=mean(data0(:,9));
% Front=array2table(data0,'VariableNames',{'ID','SetNum','Target','Sabo1','Sabo2', ...
%     'F','M','B','C/F','Time'});
% data1(1:10,:)=[];
% avcorrect(2,:)=mean(data1(:,9));
% Middle=array2table(data1,'VariableNames',{'ID','SetNum','Target','Sabo1','Sabo2', ...
%     'F','M','B','C/F','Time'});
% data2(1:10,:)=[];
% avcorrect(3,:)=mean(data2(:,9));
% Bottom=array2table(data2,'VariableNames',{'ID','SetNum','Target','Sabo1','Sabo2', ...
%     'F','M','B','C/F','Time'});
% 
% f=1;
% b=1;
% m=1;
% 
% if data0(:,2)==0||data0(:,2)==1
% elseif data0(:,2)==2||data0(:,2)==3
% elseif data0(:,2)==4||data0(:,2)==5
% 
% elseif data0(:,2)==6||data0(:,2)==9   
% elseif data0(:,2)==7||data0(:,2)==8
% elseif data0(:,2)==10||data0(:,2)==11
%     
% elseif data0(:,2)==12||data0(:,2)==13
% elseif data0(:,2)==14||data0(:,2)==15
% elseif data0(:,2)==16||data0(:,2)==17
% end
% 
