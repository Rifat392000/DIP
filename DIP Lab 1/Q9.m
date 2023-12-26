originalImage = imread('img8.png');
numLevels = 8;
quantizedImage = imquantize(originalImage, linspace(0, 255, numLevels));

figure;
subplot(1, 2, 1);
imshow(originalImage);
title('Original Grayscale Image');

subplot(1, 2, 2);
imshow(quantizedImage, []);
title('Quantized Image (8 Levels)');
