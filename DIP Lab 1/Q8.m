originalImage = imread('img7.jpg'); brightnessFactor = 3.5;
brightenedImage = imadjust(originalImage, [], [], brightnessFactor);
figure; 
subplot(1,2,1); 
imshow(originalImage); 
title('OriginalI mage');
subplot(1,2,2);
imshow(brightenedImage); t
itle('Brightened Image');