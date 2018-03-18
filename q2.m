%1.1
I_left = im2single(rgb2gray(imread('square.jpg')));
I_right = im2single(rgb2gray(imread('square2.jpg')));

%1.2
[fa, da] = vl_sift(I_left) ;
[fb, db] = vl_sift(I_right) ;

dist = dist2(double(da)',double(db)');

[min, min_index] = min(dist);

%the number of pairs of points that we want to use
number_of_pairs = 10;
for i 

%imshow(I_left);
hold on;
%plot(fa(1,sel), fa(2,sel), 'r*', 'LineWidth', 2, 'MarkerSize', 1);

 