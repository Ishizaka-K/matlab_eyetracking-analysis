clear;
for count=1:14

fl=('E:\Document\MATLAB\'+string(count)+'/eyeData.txt');
opts2=detectImportOptions(fl,'Encoding','UTF-8','ReadVariableNames',false,'ExtraColumnsRule','wrap');% サンプルデータのデータ形式判定
hdat2=readmatrix(fl, opts2,'Encoding','UTF-8'); % サンプルデータを表として読み込む


%zeroの読み込みa
for i=1:108
    fl=('E:\Document\MATLAB\'+string(count)+'/EyeTracking/'+string(i)+'.txt');
    opts=detectImportOptions(fl); % サンプルデータのデータ形式判定
    EyeSpot=readmatrix(fl, opts);% サンプルデータを表として読み込む
    if hdat2(i,4)~=0
        response=EyeSpot(hdat2(i,4),5)-EyeSpot(1,5);
        hdat2(i,4)=response;
    else 
    end
end
for i=1:108
    fl=('E:\Document\MATLAB\'+string(count)+'/EyeTracking2/'+string(i)+'.txt');
    opts=detectImportOptions(fl); % サンプルデータのデータ形式判定
    EyeSpot=readmatrix(fl, opts);% サンプルデータを表として読み込む
    if hdat2(108+i,4)~=0
        if height(EyeSpot)<hdat2(108+i,4)
            response=0;
        else
            response=EyeSpot(hdat2(108+i,4),5)-EyeSpot(1,5);
        end
        hdat2(108+i,4)=response;
    else 
    end
end
disp(count);
eData=array2table(hdat2,'VariableNames',{'TragetPosition','Xposition','Yposition','timig'});
writetable(eData,'E:\Document\MATLAB\'+string(count)+'/eyeData.txt');
end