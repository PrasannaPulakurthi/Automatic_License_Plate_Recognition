clear all;close all;clc;

%% read the image 
I_org = imread ('ka2.jpg');
figure,imshow(I_org);
title('Original Image', 'FontSize', 20);
set(gca, 'Position', [0.05 0.05 0.9 0.85]);
saveas(gcf, 'Results/Original_Image.png');

%% adding border to the image 
I = rgb2gray(I_org);
I = medfilt2(I,[3 3]);
[M,N] = size(I);
I_bord = zeros([M,N]+4);
I_bord(3:M+2,3:N+2) = I;
I = I_bord;

%% to find the number plate
[I_v,loc1] = filter_edge(I);
[I_h,loc2] = filter_edge(I_v');
I = I_h';

%%
figure,imshow(I_org);
title('License Plate Found', 'FontSize', 20);
set(gca, 'Position', [0.05 0.05 0.9 0.85]);
rectangle('Position', [loc2(1),loc1(1)-10,loc2(2)-loc2(1),loc1(2)-loc1(1)], 'EdgeColor', 'g', 'LineWidth', 2);

% Save the resulting image (if needed)
saveas(gcf, 'Results/Image_with_BoundingBox.png');


%% aspect ration of the number plate greater than 3
%% to resize the number plate
I=imresize(I,[400 NaN]);
figure,imshow(uint8(I)); 
title('Processed License Plate', 'FontSize', 20);
set(gca, 'Position', [0.05 0.05 0.9 0.85]);
saveas(gcf, 'Results/Cropped_License_Plate.png');

%% median filter 
I = medfilt2(I,[3 3]);
I = uint8(I);

%% Thresholding to binarize the image (adaptive thresholding)
threshold = graythresh(I) * 255; % Adaptive thresholding
B = 255 - ((I > threshold) * 255);
B_bin = logical(B);

out1=bwareaopen(B_bin,400,4);
out2=bwareaopen(B_bin,32000,4);
out3 = logical(out1 - out2);

figure,imshow(B_bin); title('Binary Image (Adaptive thresholding)', 'FontSize', 20);
set(gca, 'Position', [0.05 0.05 0.9 0.85]);
saveas(gcf, 'Results/Binary_Image_Post_Processing.png');
figure,imshow(out1); title('Small Objects Removed', 'FontSize', 20);
set(gca, 'Position', [0.05 0.05 0.9 0.85]);
saveas(gcf, 'Results/Small_Objects_Removed.png');
figure,imshow(out3); title('Large Objects Removed', 'FontSize', 20);
set(gca, 'Position', [0.05 0.05 0.9 0.85]);
saveas(gcf, 'Results/Large_Objects_Removed.png');
figure,imshow(out3); title('Final Image with Number Plate', 'FontSize', 20);
set(gca, 'Position', [0.05 0.05 0.9 0.85]);

%% to find the number and letters 
Iprops=regionprops(out3,'BoundingBox','Image');
NR=cat(1,Iprops.BoundingBox);  
[r1,bbox]=separate_box(NR);

m=size(bbox,1);
bbox=floor(bbox);
if(m~=0)
    hold on    
    I_re_full=[];
    for(i=1:m)
            I = out3(bbox(i,2):bbox(i,2)+bbox(i,4),bbox(i,1):bbox(i,1)+bbox(i,3));
            rectangle('Position',bbox(i,:),'EdgeColor','g','LineWidth',2);
            I_re=imresize(I,[42,24]);
            Output(i)=recognize_char(I_re);
            I_re_full = [I_re_full,I_re];
    end
    saveas(gcf,'Results/Number_Plate.png');
    hold off
    title(['License Plate Number: ',strjoin(Output, '')], 'FontSize', 20);
    saveas(gcf,'Results/Final_Number_Plate.png');
else
    fprintf('not found');
end
