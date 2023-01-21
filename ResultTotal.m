clear;

for count=1:14
disp(count);
hdat1=readmatrix('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata.csv');
hdat2=readmatrix('E:\Document\Asoturon\ResultData\'+string(count)+'Resultdata2.csv');
hdat3=[hdat1;hdat2];
data0=zeros(1,10);
data1=zeros(1,10);
data2=zeros(1,10);
disp(hdat3(hdat3(:,10)>5,:));
hdat3(hdat3(:,10)>5,:)=[];
<<<<<<< Updated upstream
=======
% hdat3((hdat3(:,9)==0),:)=[];
hdat3((hdat3(:,1)==0),:)=[];


>>>>>>> Stashed changes
for j=1:height(hdat3)
    if hdat3(j,2)==0|hdat3(j,2)==1|hdat3(j,2)==2|hdat3(j,2)==3|hdat3(j,2)==4|hdat3(j,2)==5
    data0=[data0;hdat3(j,:)];
    elseif hdat3(j,2)==6|hdat3(j,2)==7|hdat3(j,2)==8|hdat3(j,2)==9|hdat3(j,2)==10|hdat3(j,2)==11
    data1=[data1;hdat3(j,:)];
    elseif hdat3(j,2)==12|hdat3(j,2)==17|hdat3(j,2)==13|hdat3(j,2)==14|hdat3(j,2)==15|hdat3(j,2)==16
    data2=[data2;hdat3(j,:)];
    end
end

data0(data0(:,1)==0,:)=[];
data1(data1(:,1)==0,:)=[];
data2(data2(:,1)==0,:)=[];


%F_icchi
icchi(count,1)=mean(data0(data0(:,2)==0|data0(:,2)==1,9));
%F_hui
hui(count,1)=mean(data0(data0(:,2)==2|data0(:,2)==3,9));
%F_no
no(count,1)=mean(data0(data0(:,2)==4|data0(:,2)==5,9));

%M_icchi
icchi(count,2)=mean(data1(data1(:,2)==7|data1(:,2)==8,9));
%M_hui
hui(count,2)=mean(data1(data1(:,2)==6|data1(:,2)==9,9));
%M_no
no(count,2)=mean(data1(data1(:,2)==10|data1(:,2)==11,9));

%B_icchi
icchi(count,3)=mean(data2(data2(:,2)==14|data2(:,2)==15,9));
%B_hui
hui(count,3)=mean(data2(data2(:,2)==12|data2(:,2)==13,9));
%B_no
no(count,3)=mean(data2(data2(:,2)==16|data2(:,2)==17,9));

clear hdat3 data0 data1 data2;
end
total=[icchi,hui,no];
TotalR=array2table(total,'VariableNames',{'F_icchi','M_icchi','B_icchi','F_hui','M_hui','B_hui', ...
    'F_no','M_no','B_no'});
<<<<<<< Updated upstream
writetable(TotalR,'E:\Document\Asoturon\TotalVariable.csv');
=======
writetable(TotalR,'E:\Document\Asoturon\TotalCorrect2.csv');
>>>>>>> Stashed changes



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
