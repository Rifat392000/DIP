img = imread('/MATLAB Drive/Lab 3/image4.jpg');
noisyImage = imnoise(img, "salt & pepper", 0.02);
grayNoisy = rgb2gray(noisyImage);
boxImage = imboxfilt(noisyImage, 3);
avgImage = imfilter(noisyImage, ones(3)/9);
medImage = medfilt2(grayNoisy, [3, 3]);

figure()
subplot(1, 4, 1), imshow(img);
title("Original");
subplot(1, 4, 2), imshow(boxImage);
title("Box Filtered");
subplot(1, 4, 3), imshow(avgImage);
title("Average Filtered");
subplot(1, 4, 4), imshow(medImage);
title("Median Filtered");
