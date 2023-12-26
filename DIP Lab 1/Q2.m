originalImage = imread('img2.png');
grayImage = rgb2gray(originalImage);
threshold = 128; 
binaryImage = grayImage> threshold; 
subplot(1,2,1);
imshow(originalImage); title('OriginalImage'); 
subplot(1,2,2);
imshow(binaryImage); title('BinaryImage'); 
imwrite(binaryImage,'binary_image.png');