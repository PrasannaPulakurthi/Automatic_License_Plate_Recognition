function [Igray1,loc]=filter_edge(I)
%% To find the vertical edge
I=I';
Igray = double (I); 
Itemp = Igray;
[rows cols] = size(Igray);

A_horz = zeros(rows-2,cols-2);
%% high pass filtering 
B_horz =[-2 -2 -2;0 0 0;2 2 2];

A_1 = abs(conv2(Igray,B_horz,'valid'));
%% high pass filtering2
Image_1=I;
B_horz = .5*[-1 0 1;-1 0 1;-1 0 1];
A_2 = abs(conv2(Igray,B_horz,'valid'));

A = (A_1+A_2)/2;

%figure,imshow(uint8(A'));
%% generating a histogram 
A_horz = A_horz + (A>30);
A_horz = A_horz.*A;
%figure,imshow(uint8(A_horz'));

hoz = sum(A_horz);
hoz(1) = 0; hoz(2) = 0; hoz(end) = 0; hoz(end- 1) = 0;
hoz_ave = sum(hoz)/size(hoz,2);

figure,
subplot(3,1,1);
plot (hoz);
title('Edge Processing Histogram');

%% lowpass filtering the histogram
O=(1/40)*ones(1,40);
hoz_filter = conv(O,hoz);
[~,hoz_max] = max(hoz_filter);

subplot(3,1,2);
plot (hoz_filter);
title('Histogram after passing through Low Pass Filter');

%% thresholding 
horz_size = size(hoz_filter);
horz = zeros(horz_size);
horz = horz+(hoz_filter>hoz_ave);
horz1 = horz(1:horz_size(2)-37);

subplot(3,1,3);
plot (horz);
title('Histogram after Filtering');

%% finding the region of the number plate
k=1;
for i= 1:(size(horz,2)-1)
    if horz(i)~=horz(i+1)
        column(k) = i;k=k+1;
    end
end

horz2 = zeros(rows,cols);
for i= 1:rows
    horz2(i,:)=horz1;
end
dil=logical(horz2);
lowp_horz2=imdilate(dil,strel('line',10,0));

Igray = double(Igray).*lowp_horz2;

%% croping the desired area 
 for j = 1:2:size(column,2)
    if(hoz_max >= column(j) && hoz_max <= column(j+1))
        Igray1 = Itemp(:,column(j)-20:column(j+1));
        loc = [column(j)-24,column(j+1)-4];
    end
 end

Igray1 = Igray1';

% figure,imshow(uint8(Igray1));