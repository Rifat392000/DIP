binaryImage = imread('img1.png'); 
perimeter4 =sum(sum(bwperim(binaryImage, 4))); 
perimeter8 =sum(sum(bwperim(binaryImage, 8))); 
disp(['4-connected Perimeter: ', num2str(perimeter4)]);
disp(['8-connected Perimeter: ', num2str(perimeter8)]);