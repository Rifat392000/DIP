
% Read the images
rgbImg = imread('/MATLAB Drive/Lab 3/image6.png');
grayImg = imread('/MATLAB Drive/Lab 3/image2.jpg');
[indexedImg, map] = imread('/MATLAB Drive/Lab 3/image1.png');
% Display the original images
figure;
subplot(2, 3, 1), imshow(rgbImg);
title("RGB");
subplot(2, 3, 2), imshow(grayImg);
title("Gray");
subplot(2, 3, 3), imshow(indexedImg);
title("Indexed");

% Convert images to different color spaces
rgbToGray = rgb2gray(rgbImg);
indexedToGray = ind2gray(indexedImg, map);
indexedToRgb = ind2rgb(indexedImg, map);

% Display the converted images
subplot(2, 3, 4), imshow(rgbToGray);
title("RGB to Gray");
subplot(2, 3, 5), imshow(indexedToGray);
title("Indexed to Gray");
subplot(2, 3, 6), imshow(indexedToRgb);
title("Indexed to RGB");

% Convert gray image to binary
grayToBinary = imbinarize(grayImg);

% Display the binary image
figure;
image(grayToBinary);
colormap("gray");
axis image;
title("Gray to Binary");

% Display gray image and histogram
figure;
subplot(1, 2, 1), imshow(grayImg);
title("Gray Image");
subplot(1, 2, 2), imhist(grayImg);
title("Histogram");

% Invert and blur the RGB image
invertedImg = imcomplement(rgbImg);
window = ones(9) / 9^2;  % Corrected normalization factor
blured = imfilter(rgbImg, window);

% Display the original, inverted, and blurred images
figure;
subplot(1, 3, 1), imshow(rgbImg);
title("Original");
subplot(1, 3, 2), imshow(invertedImg);
title("Inverted");
subplot(1, 3, 3), imshow(blured);
title("Blurred Image");  % Typo corrected
