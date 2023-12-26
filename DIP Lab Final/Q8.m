% Load the image
img = imread('/MATLAB Drive/Lab Final/image3.png');

% Convert to grayscale
gray_img = rgb2gray(img);

% Ensure the image dimensions are powers of 2 for quadtree decomposition
minDim = min(size(gray_img));
maxDim = max(size(gray_img));
newSize = 2^nextpow2(maxDim);
gray_img = imresize(gray_img, [newSize, newSize]);

% Quadtree segmentation
max_depth = 4; % Adjust the maximum depth of the quadtree as needed
quadtree = qtdecomp(gray_img, 0.1, max_depth);

% Extract the tumor region
tumor_region = gray_img;
tumor_region(quadtree == 0) = 0;

% Display the results
figure;
subplot(1, 2, 1);
imshow(gray_img);
title('Original Image');

subplot(1, 2, 2);
imshow(tumor_region);
title('Quadtree Segmentation');
