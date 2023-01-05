clear;
%ここを変更---
for count=1:14
%-----------
F_icchi=zeros;
F_huicchi=zeros;
F_no=zeros;

M_icchi=zeros;
M_huicchi=zeros;
M_no=zeros;

B_icchi=zeros;
B_huicchi=zeros;
B_no=zeros;

for i=1:2
    
    if i==1
        fname='ResultData';
    elseif i==2
        fname='ResultData2';
    end
cou=1;
fl=('E:\Document\MATLAB\'+string(count)+'/'+fname+'.txt');
opts2=detectImportOptions(fl,'Encoding','UTF-8','ReadVariableNames',false,'ExtraColumnsRule','wrap');% サンプルデータのデータ形式判定
hdat2=readmatrix(fl, opts2,'Encoding','UTF-8'); % サンプルデータを表として読み込む
ResultData=array2table(hdat2,'VariableNames',{'ID','SetNum','TarPos','SabPos1','SabPos2','Fro','Mid','Bott','c/f','Reaction'});
while 1
    if isequal(table2array(ResultData(cou,2)),0)
        hei=height(F_icchi)+1;
        F_icchi(hei,1)=hei-1;
        F_icchi(hei,2)=table2array(ResultData(cou,9));
        F_icchi(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),1)
        hei=height(F_icchi)+1;
        F_icchi(hei,1)=hei-1;
        F_icchi(hei,2)=table2array(ResultData(cou,9));
        F_icchi(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),2)
        hei=height(F_huicchi)+1;
        F_huicchi(hei,1)=hei-1;
        F_huicchi(hei,2)=table2array(ResultData(cou,9));
        F_huicchi(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),3)
        hei=height(F_huicchi)+1;
        F_huicchi(hei,1)=hei-1;
        F_huicchi(hei,2)=table2array(ResultData(cou,9));
        F_huicchi(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),4)
        hei=height(F_no)+1;
        F_no(hei,1)=hei-1;
        F_no(hei,2)=table2array(ResultData(cou,9));
        F_no(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),5)
        hei=height(F_no)+1;
        F_no(hei,1)=hei-1;
        F_no(hei,2)=table2array(ResultData(cou,9));
        F_no(hei,3)=table2array(ResultData(cou,10));
        
        %%-----------------------------------%%
    elseif isequal(table2array(ResultData(cou,2)),6)
        hei=height(M_icchi)+1;
        M_icchi(hei,1)=hei-1;
        M_icchi(hei,2)=table2array(ResultData(cou,9));
        M_icchi(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),7)
        hei=height(M_icchi)+1;
        M_icchi(hei,1)=hei-1;
        M_icchi(hei,2)=table2array(ResultData(cou,9));
        M_icchi(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),8)
        hei=height(M_huicchi)+1;
        M_huicchi(hei,1)=hei-1;
        M_huicchi(hei,2)=table2array(ResultData(cou,9));
        M_huicchi(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),9)
        hei=height(M_huicchi)+1;
        M_huicchi(hei,1)=hei-1;
        M_huicchi(hei,2)=table2array(ResultData(cou,9));
        M_huicchi(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),10)
        hei=height(M_no)+1;
        M_no(hei,1)=hei-1;
        M_no(hei,2)=table2array(ResultData(cou,9));
        M_no(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),11)
        hei=height(M_no)+1;
        M_no(hei,1)=hei-1;
        M_no(hei,2)=table2array(ResultData(cou,9));
        M_no(hei,3)=table2array(ResultData(cou,10));
        
        %%-------------------------------------%%
    elseif isequal(table2array(ResultData(cou,2)),12)
        hei=height(B_icchi)+1;
        B_icchi(hei,1)=hei-1;
        B_icchi(hei,2)=table2array(ResultData(cou,9));
        B_icchi(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),13)
        hei=height(B_icchi)+1;
        B_icchi(hei,1)=hei-1;
        B_icchi(hei,2)=table2array(ResultData(cou,9));
        B_icchi(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),14)
        hei=height(B_huicchi)+1;
        B_huicchi(hei,1)=hei-1;
        B_huicchi(hei,2)=table2array(ResultData(cou,9));
        B_huicchi(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),15)
        hei=height(B_huicchi)+1;
        B_huicchi(hei,1)=hei-1;
        B_huicchi(hei,2)=table2array(ResultData(cou,9));
        B_huicchi(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),16)
        hei=height(B_no)+1;
        B_no(hei,1)=hei-1;
        B_no(hei,2)=table2array(ResultData(cou,9));
        B_no(hei,3)=table2array(ResultData(cou,10));
    elseif isequal(table2array(ResultData(cou,2)),17)
        hei=height(B_no)+1;
        B_no(hei,1)=hei-1;
        B_no(hei,2)=table2array(ResultData(cou,9));
        B_no(hei,3)=table2array(ResultData(cou,10));
        
        
    end
    cou=cou+1;
    if isequal(height(ResultData)+1,cou)
        break;
    end
end
end
mkdir('E:/Data/'+string(count))
F_icchi(1,:)=[];
F_icchi(25,2)=mean(F_icchi(:,2));
FRdata(count,1)=mean(F_icchi(:,2));
F_icchi(25,3)=mean(F_icchi(:,3));
FRcorrect(count,1)=mean(F_icchi(:,3));

F_huicchi(1,:)=[];
F_huicchi(25,2)=mean(F_huicchi(:,2));
FRdata(count,2)=mean(F_huicchi(:,2));
F_huicchi(25,3)=mean(F_huicchi(:,3));
FRcorrect(count,2)=mean(F_huicchi(:,3));

F_no(1,:)=[];
F_no(25,2)=mean(F_no(:,2));
FRdata(count,3)=mean(F_no(:,2));
F_no(25,3)=mean(F_no(:,3));
FRcorrect(count,3)=mean(F_no(:,3));

FrontMat=horzcat(F_icchi,F_huicchi,F_no);
FrontResult=array2table(FrontMat,'VariableNames',{'ID_Icchi','1c/f','1time','ID_Huicchi','2c/f','2time','ID_Nothinga','3c/f','3time'});
writetable(FrontResult,'E:\Data\'+string(count)+'/Front.xls');

M_icchi(1,:)=[];
M_icchi(25,2)=mean(M_icchi(:,2));
MRdata(count,1)=mean(M_icchi(:,2));
M_icchi(25,3)=mean(M_icchi(:,3));
MRcorrect(count,1)=mean(M_icchi(:,3));

M_huicchi(1,:)=[];
M_huicchi(25,2)=mean(M_huicchi(:,2));
MRdata(count,2)=mean(M_huicchi(:,2));
M_huicchi(25,3)=mean(M_huicchi(:,3));
MRcorrect(count,2)=mean(M_huicchi(:,3));

M_no(1,:)=[];
M_no(25,2)=mean(M_no(:,2));
MRdata(count,3)=mean(M_no(:,2));
M_no(25,3)=mean(M_no(:,3));
MRcorrect(count,3)=mean(M_no(:,3));

MiddleMat=horzcat(M_icchi,M_huicchi,M_no);
MiddleResult=array2table(MiddleMat,'VariableNames',{'ID_Icchi','1c/f','1time','ID_Huicchi','2c/f','2time','ID_Nothinga','3c/f','3time'});
writetable(MiddleResult,'E:\Data\'+string(count)+'/Middle.xls');

B_icchi(1,:)=[];
B_icchi(25,2)=mean(B_icchi(:,2));
BRdata(count,1)=mean(B_icchi(:,2));
B_icchi(25,3)=mean(B_icchi(:,3));
BRcorrect(count,1)=mean(B_icchi(:,3));

B_huicchi(1,:)=[];
B_huicchi(25,2)=mean(B_huicchi(:,2));
BRdata(count,2)=mean(B_huicchi(:,2));
B_huicchi(25,3)=mean(B_huicchi(:,3));
BRcorrect(count,2)=mean(B_huicchi(:,3));

B_no(1,:)=[];
B_no(25,2)=mean(B_no(:,2));
BRdata(count,3)=mean(B_no(:,2));
B_no(25,3)=mean(B_no(:,3));
BRcorrect(count,3)=mean(B_no(:,3));

BottomMat=horzcat(B_icchi,B_huicchi,B_no);
BottomResult=array2table(BottomMat,'VariableNames',{'ID_Icchi','1c/f','1time','ID_Huicchi','2c/f','2time','ID_Nothinga','3c/f','3time'});
writetable(BottomResult,'E:\Data\'+string(count)+'/Bottom.xls');


end
FRd=array2table(FRdata,'VariableNames',{'Icchi','Huicchi','No'});
writetable(FRd,'E:\Data\FrontCorrect.xls');
FRc=array2table(FRcorrect,'VariableNames',{'Icchi','Huicchi','No'});
writetable(FRc,'E:\Data\FrontTime.xls');

MRd=array2table(MRdata,'VariableNames',{'Icchi','Huicchi','No'});
writetable(MRd,'E:\Data\MiddleCorrect.xls');
MRc=array2table(MRcorrect,'VariableNames',{'Icchi','Huicchi','No'});
writetable(MRc,'E:\Data\MiddleTime.xls');

BRd=array2table(BRdata,'VariableNames',{'Icchi','Huicchi','No'});
writetable(BRd,'E:\Data\BttomCorrect.xls');
BRc=array2table(BRcorrect,'VariableNames',{'Icchi','Huicchi','No'});
writetable(BRc,'E:\Data\BttomTime.xls');