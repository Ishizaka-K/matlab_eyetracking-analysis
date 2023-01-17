 clear;
a=[0;1;];
% b=[2/sqrt(5), -1/sqrt(5);
%         1/sqrt(5), 2/sqrt(5)];
% c=b*a;

%     b=[cos(deg2rad(90)), -sin(deg2rad(90));
%         sin(deg2rad(90)), cos(deg2rad(90))];
%     c=b*a;

%     b=[cos(deg2rad(90+63.434948822922)), -sin(deg2rad(90+63.434948822922));
%         sin(deg2rad(90+63.434948822922)), cos(deg2rad(90+63.434948822922))];
%     c=b*a;

%     b=[cos(deg2rad(-(90+63.434948822922))), -sin(deg2rad(-(90+63.434948822922)));
%         sin(deg2rad(-(90+63.434948822922))), cos(deg2rad(-(90+63.434948822922)))];
%     c=b*a;

    b=[cos(deg2rad(-90)), -sin(deg2rad(-90));
        sin(deg2rad(-90)), cos(deg2rad(-90))];
    c=b*a;

%     b=[2/sqrt(5), 1/sqrt(5);
%        -1/sqrt(5), 2/sqrt(5)];
%     c=b*a;

figure('Name','前')
scatter(c(1,1),c(2,1))
xlim([-1 1])
ylim([-1 1]);