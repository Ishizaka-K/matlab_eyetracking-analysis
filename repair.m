clear;
count=8;
%8+9のようにデータが連なってるので、8ではデータ下を消す
%同様に9ではデータ上を消す
for i=0:108
    fl=('E:\Document\MATLAB\'+string(count)+'/EyeTracking2/'+string(i)+'.txt');
    opts=detectImportOptions(fl); % サンプルデータのデータ形式判定
    EyeSpot=readmatrix(fl, opts);% サンプルデータを表として読み込む
    con=2;
    while 1
        if EyeSpot(con-1,5)>EyeSpot(con,5)
            EyeSpot(con:end,:)=[];
            writematrix(EyeSpot,'E:\Document\MATLAB\'+string(count)+'/EyeTracking2/'+string(i)+'.txt');
           break;
        elseif height(EyeSpot)==con+1
           break;
        else
        end
        con=con+1;
    end
    disp(i);   
end