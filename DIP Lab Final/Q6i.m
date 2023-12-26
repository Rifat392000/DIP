% Load the image
originalImage = rgb2gray(im2double(imread("/MATLAB Drive/Lab Final/image3.png")));

% Perform intensity adjustment
adjustedImage = imadjust(originalImage, [], [], 0.5);

% Apply Gaussian filter
smoothedImage = imgaussfilt(adjustedImage);

% Specify seed point manually
seedX = 100;  % Adjust the seed point coordinates as needed
seedY = 150;

% Apply region growing
segmentedImage = regionGrowing(smoothedImage, seedX, seedY, 0.2);

% Display the original image and the region-growing segmentation side by side
figure;

subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(1, 2, 2);
imshow(segmentedImage);
title('Region Growing Segmentation');
