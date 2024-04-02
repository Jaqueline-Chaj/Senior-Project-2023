clear; 
close all;

SQR_COORDS = zeros(360,4);
colors = zeros(360,3);

% Generate 2 coords for each square
row = 1;

for height = 0 : 2 : 718
    x1 = 0;
    y1 = height;
    x2 = 1279;
    y2 = height+2;
    coords=[x1 y1 x2 y2];
    SQR_COORDS(row, :) = coords;
    row = row + 1;
end

% % Generate random RGB values for each square
% for row = 1:1:360
%     R = floor(rand() * 255);
%     B = floor(rand() * 255);
%     G = floor(rand() * 255);
%     colors(row, :) = [R B G];
% end

% Set every square to be a specific color
R = 0;
B = 0;
G = 0;

for row = 1:1:360
    if()

    colors(row, :) = [R B G];
end

SQR_PARAMS = [SQR_COORDS, colors];
% plot(SQR_PARAMS(:,1), SQR_PARAMS(:,2), "-x")
% hold on
% plot(SQR_PARAMS(:,3), SQR_PARAMS(:,4), "-x")
% hold off
% grid("on");
% xlim([0 1279]);
% ylim([0 719]);
writematrix(SQR_PARAMS, "SQR_PARAMS2.csv");