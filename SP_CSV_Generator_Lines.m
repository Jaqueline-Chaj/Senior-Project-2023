clear; 
close all;

LINE_COORDS = zeros(360,4);
colors = zeros(360,3);
% centers = zeros(360,2);
r = 300;
CIRCLE_C_X = 840;
CIRCLE_C_Y = 360;
% SQR_WIDTH = 32;
% Generate 2 coords for each square
row = 1;
for theta = 0 : (2*pi)/360 : 2*pi - (2*pi)/360
    line_x1 = round((r*cos(theta))) + CIRCLE_C_X;
    line_y1 = round((r*sin(theta))) + CIRCLE_C_Y;
    line_x2 = round((r*cos(theta + 180))) + CIRCLE_C_X;  
    line_y2 = round((r*sin(theta + 180))) + CIRCLE_C_Y;
    % center_x=((r*cos(theta)));
    % center_y=((r*sin(theta)));
    % centers(row,  :) = [center_x center_y];
    % x1=round(center_x - SQR_WIDTH/2 + CIRCLE_C_X);
    % y1=round(center_y - SQR_WIDTH/2 + CIRCLE_C_Y);
    % x2=round(center_x + SQR_WIDTH/2 + CIRCLE_C_X);
    % y2=round(center_y + SQR_WIDTH/2 + CIRCLE_C_Y);
    coords=[line_x1 line_y1 line_x2 line_y2];
    LINE_COORDS(row, :) = coords;
    row = row + 1;
end

% % Generate random RGB values for each square
% for row = 1:1:360
% 
%     R = floor(rand() * 255);
%     B = floor(rand() * 255);
%     G = floor(rand() * 255);
%     colors(row, :) = [R B G];
% end

% Set every square to be a specific color
red = 31;
blue = 15;
green = 255;

for row = 1:1:360
    R = red;
    B = blue;
    G = green;
    colors(row, :) = [R B G];
end

LINE_PARAMS = [LINE_COORDS, colors];
% plot(SQR_PARAMS(:,1), SQR_PARAMS(:,2), "-x")
% hold on
% plot(SQR_PARAMS(:,3), SQR_PARAMS(:,4), "-x")
% hold off
% grid("on");
% xlim([0 1279]);
% ylim([0 719]);
writematrix(LINE_PARAMS, "LINE_PARAMS.csv");