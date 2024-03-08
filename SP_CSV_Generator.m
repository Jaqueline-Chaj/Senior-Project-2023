clear; 
close all;

SQR_COORDS = zeros(360,4);
colors = zeros(360,3);
centers = zeros(360,2);
r = 300;
CIRCLE_C_X = 640;
CIRCLE_C_Y = 360;
SQR_WIDTH = 32;
% Generate 2 coords for each square
row = 1;
for theta = 0 : (2*pi)/360 : 2*pi - (2*pi)/360
    center_x=((r*cos(theta)));
    center_y=((r*sin(theta)));
    centers(row,  :) = [center_x center_y];
    x1=round(center_x - SQR_WIDTH/2 + CIRCLE_C_X);
    y1=round(center_y + SQR_WIDTH/2 + CIRCLE_C_Y);
    x2=round(center_x + SQR_WIDTH/2 + CIRCLE_C_X);
    y2=round(center_y - SQR_WIDTH/2 + CIRCLE_C_Y);
    coords=[x1 y1 x2 y2];
    SQR_COORDS(row, :) = coords;
    row = row + 1;
end

% Generate random RGB values for each square
for row = 1:1:360
    R = floor(rand() * 255);
    B = floor(rand() * 255);
    G = floor(rand() * 255);
    colors(row, :) = [R B G];
end

SQR_PARAMS = [SQR_COORDS, colors];
plot(SQR_PARAMS(:,1), SQR_PARAMS(:,2), "-x")
hold on
plot(SQR_PARAMS(:,3), SQR_PARAMS(:,4), "-x")
hold off
grid("on");
xlim([0 1279]);
ylim([0 719]);
writematrix(SQR_PARAMS, "SQR_PARAMS.csv");