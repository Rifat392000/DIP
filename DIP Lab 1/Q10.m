I3 = imread('img3.png');
Negative_Image = 255 - I3;

subplot(1, 2, 1);
imshow(I3, 'InitialMagnification', 'fit');
title('Original');

subplot(1, 2, 2);
imshow(Negative_Image, 'InitialMagnification', 'fit');
title('Negative Image');
