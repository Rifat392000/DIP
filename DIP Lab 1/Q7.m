originalImage = imread('img6.png');
adjustedImage = imadjust(originalImage, [0.2 0.9]);
figure; subplot(1,2,1); imshow(originalImage);
title('Original Image'); subplot(1,2,2);
imshow(adjustedImage);
title('Adjusted Image');