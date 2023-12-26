img1 = imread('img1.png');
img2 = imread('img2.png');

binary_img1 = im2bw(img1);
binary_img2 = im2bw(img2);

result_and = binary_img1 & binary_img2;
result_or = binary_img1 | binary_img2;
result_not_img1 = ~binary_img1;

subplot(2,2,1);
imshow(binary_img1);
title('Binary Image 1');

subplot(2,2,2);
imshow(binary_img2);
title('Binary Image 2');

subplot(2,2,3);
imshow(result_and);
title('AND Result');

subplot(2,2,4);
imshow(result_or);
title('OR Result');

imwrite(result_and, 'result_and.png');
imwrite(result_or, 'result_or.png');
