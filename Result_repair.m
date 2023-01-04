clear;
%ここを変更---
count=1;
fname='ResultData';
%-----------
disp(count);
con=0;
cou=1;
counter=zeros;
fl=('E:\Document\MATLAB\'+string(count)+'/'+fname+'.txt');
opts2=detectImportOptions(fl,'Encoding','UTF-8','ReadVariableNames',false,'ExtraColumnsRule','wrap');% サンプルデータのデータ形式判定
hdat2=readmatrix(fl, opts2,'Encoding','UTF-8'); % サンプルデータを表として読み込む
ResultData=array2table(hdat2,'VariableNames',{'ID','SetNum','TarPos','SabPos1','SabPos2','Fro','Mid','Bott','c/f','Reaction'});
while 1
    if isequal(table2array(ResultData(cou,2)),0)
        counter(cou,1)=1;
    elseif isequal(table2array(ResultData(cou,2)),1)
        counter(cou,2)=1;
    elseif isequal(table2array(ResultData(cou,2)),2)
        counter(cou,3)=1;
    elseif isequal(table2array(ResultData(cou,2)),3)
        counter(cou,4)=1;
    elseif isequal(table2array(ResultData(cou,2)),4)
        counter(cou,5)=1;
    elseif isequal(table2array(ResultData(cou,2)),5)
        counter(cou,6)=1;
    elseif isequal(table2array(ResultData(cou,2)),6)
        counter(cou,7)=1;
    elseif isequal(table2array(ResultData(cou,2)),7)
        counter(cou,8)=1;
    elseif isequal(table2array(ResultData(cou,2)),8)
        counter(cou,9)=1;
    elseif isequal(table2array(ResultData(cou,2)),9)
        counter(cou,10)=1;
    elseif isequal(table2array(ResultData(cou,2)),10)
        counter(cou,11)=1;
    elseif isequal(table2array(ResultData(cou,2)),11)
        counter(cou,12)=1;
    elseif isequal(table2array(ResultData(cou,2)),12)
        counter(cou,13)=1;
    elseif isequal(table2array(ResultData(cou,2)),13)
        counter(cou,14)=1;
    elseif isequal(table2array(ResultData(cou,2)),14)
        counter(cou,15)=1;
    elseif isequal(table2array(ResultData(cou,2)),15)
        counter(cou,16)=1;
    elseif isequal(table2array(ResultData(cou,2)),16)
        counter(cou,17)=1;
    elseif isequal(table2array(ResultData(cou,2)),17)
        counter(cou,18)=1;
    end
    
    cou=cou+1;
    if isequal(height(ResultData)+1,cou)
        for i=1:18
            counter(cou,i)=sum(counter(:,i));
        end
        break;
    end
end
if counter(end,1)==5
        hdat2(end,2)=0;
elseif counter(end,2)==5
        hdat2(end,2)=1;
elseif counter(end,3)==5
        hdat2(end,2)=2;
elseif counter(end,4)==5
        hdat2(end,2)=3;
elseif counter(end,5)==5
        hdat2(end,2)=4;
elseif counter(end,6)==5
        hdat2(end,2)=5;
elseif counter(end,7)==5
        hdat2(end,2)=6;
elseif counter(end,8)==5
        hdat2(end,2)=7;
elseif counter(end,9)==5
        hdat2(end,2)=8;
elseif counter(end,10)==5
        hdat2(end,2)=9;
elseif counter(end,11)==5
        hdat2(end,2)=10;
elseif counter(end,12)==5
        hdat2(end,2)=11;
elseif counter(end,13)==5
        hdat2(end,2)=12;
elseif counter(end,14)==5
        hdat2(end,2)=13;
elseif counter(end,15)==5
        hdat2(end,2)=14;
elseif counter(end,16)==5
        hdat2(end,2)=15;
elseif counter(end,17)==5
        hdat2(end,2)=16;
elseif counter(end,18)==5
        hdat2(end,2)=17;
else
    disp('異常なし');
end
ResultData=array2table(hdat2,'VariableNames',{'ID','SetNum','TarPos','SabPos1','SabPos2','Fro','Mid','Bott','c/f','Reaction'});
writetable(ResultData,'E:\Document\MATLAB\'+string(count)+'/'+fname+'.txt');