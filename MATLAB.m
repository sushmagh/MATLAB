k=imread('test.jpg');
p=imread('ref.jpg');
[x,y,z] = size(k);
if(z==1)
    ;
else
    kg = rgb2gray(k);
end
[x,y,z] = size(p);
if(z==1)
    ;
else
 pg = rgb2gray(p);
end
figure(1);
k1=imcrop(kg,[270 130 150 200]);
k1= imadjust(k1,[],[],2);
k1=imfill(k1);
edge_det_k = edge(k1,'canny');
se = strel('line',1,90);
edge_det_k=imdilate(edge_det_k,se);
imshow(kg);

figure(2);
p1=imcrop(pg,[270 130 150 200]);
p1=imadjust(p1,[],[],2);
p1=imfill(p1);
edge_det_p = edge(p1,'canny');
se = strel('line',1,90);
edge_det_p=imdilate(edge_det_p,se);
imshow(pg);

OUTPUT_MESSAGE = ' RED for 90 seconds ';
OUTPUT_MESSAGE2 = ' GREEN for 20 seconds ';
OUTPUT_MESSAGE3 = ' GREEN for 30 seconds ';
OUTPUT_MESSAGE4 = ' GREEN for 60 seconds ';
OUTPUT_MESSAGE5 = ' GREEN for 90 seconds ';

matched_data = 0;
white_points = 0;
black_points = 0;
x=0;
y=0;
l=0;
m=0;

for a = 1:1:201
 for b = 1:1:151
 if(edge_det_k(a,b)==1)
 white_points = white_points+1;
 else
 black_points = black_points+1;
 end
 end
end

for i = 1:1:201
 for j = 1:1:151
 if(edge_det_k(i,j)==1)&&(edge_det_p(i,j)==1)
 matched_data = matched_data+1;
 else
     ;
 end
 end
end

total_data = white_points;
total_matched_percentage = (matched_data/total_data)*100;

if total_matched_percentage > 90 
 display(OUTPUT_MESSAGE);
elseif total_matched_percentage <= 90 && total_matched_percentage > 70
 display(OUTPUT_MESSAGE2);
elseif total_matched_percentage <= 70 && total_matched_percentage > 50
 display(OUTPUT_MESSAGE3);
elseif total_matched_percentage <= 50 && total_matched_percentage > 10
 display(OUTPUT_MESSAGE4);
else
 display(OUTPUT_MESSAGE5);
end
