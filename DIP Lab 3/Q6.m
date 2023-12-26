% Read the PNG image
pngImg = imread('/MATLAB Drive/Lab 3/image1.png');

% Specify the filename for the TIFF image
tifFilename = 'output_image.tif';

% Convert and save the PNG image as a TIFF image
imwrite(pngImg, tifFilename, 'tif');

% Display the original and converted images
figure;

subplot(1, 2, 1), imshow(pngImg);
title('Original PNG Image');

% Read and display the converted TIFF image
tifImg = imread(tifFilename);
subplot(1, 2, 2), imshow(tifImg);
title('Converted TIFF Image');
