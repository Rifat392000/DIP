binaryImage = imread('binary_image.png');
[labelImage, numObjects] = bwlabel(binaryImage, 8);
figure; imshow(label2rgb(labelImage)); 
title('Labeled Image');
disp(['Number of Objects: ', num2str(numObjects)]);