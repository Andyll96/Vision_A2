%1.1
I_left = im2single(rgb2gray(imread('parliament-left.jpg')));
I_right = im2single(rgb2gray(imread('parliament-right.jpg')));

figure('Name', 'Feature Detection', 'NumberTitle', 'off');

%1.2
edgeThresh = 2; %must limit num of features to practically computate Euclidean distances

[fa, da] = vl_sift(I_left, 'edgethresh', edgeThresh) ;
[fb, db] = vl_sift(I_right, 'edgethresh', edgeThresh); 

%SHOW ORIGINAL IMAGES
subplot(2,2,1, 'align')
imshow(I_left, []);
title('Original: Left')

subplot(2,2,3, 'align')
imshow(I_right, []);
title('Original: Right')

%SHOW FEATURED IMAGES
subplot(2,2,2,'align')
imshow(I_left,[]);
title('Features: Left')

faFeats = vl_plotframe(fa);
set(faFeats, 'Color', 'green', 'linewidth', 1);

subplot(2,2,4, 'align')
imshow(I_right, []);
title('Features: Right')

fbFeats = vl_plotframe(fb);
set(fbFeats, 'Color', 'green', 'linewidth', 1);

%2.3
%we transpose the descriptors to be used in dist2
da = da';
db = db';

%creates an array with the Euclidean distances  between all features in da
%and db
euclideanDists = dist2(double(da), double(db));

%finds minimum Euclidean distances between da and db
[M, I] = min(euclideanDists, [], 2);

%a matrix giving the minimum Euclidean values for all features in da
%[da feature#, db feature# w/ smallest Euclidean distance, Euclidean distance]
minDists = [(1:size(I,1))',I , M];

%2.4
%sort based on Euclidean distancein 3rd column
minDists = sortrows(minDists, 3);

%threshold for how many pairs we'll use
numPairs = 100;

selectedMinDists = minDists(1:numPairs,:,:);

%2.5