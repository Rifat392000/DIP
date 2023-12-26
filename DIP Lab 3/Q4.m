img = imread('/MATLAB Drive/Lab 3/image7.jpg');
figure;
imshow(img);
title("Original Image");

disp('Matrix form of the image:');
pixelValue = img(10, 78);
disp(['Pixel value at (10, 78): ' num2str(pixelValue)]);

imageSize = size(img);
disp(['Size of the image: ' num2str(imageSize(1)) ' x ' num2str(imageSize(2))]);

imageInfo = imfinfo('/MATLAB Drive/Lab 3/image7.jpg');
disp('Information of the image:');
disp(imageInfo);
