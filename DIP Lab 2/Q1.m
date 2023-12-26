Img=imread('img1.png');
Img_Stect=imadjust(Img, stretchlim (Img, [0.05,0.95]), []); 
subplot(2,2,1), 
imshow(Img); 
title('Original'); 
subplot(2,2,2), 
imshow(Img_Stect); title('Stretched');
subplot(2,2,3),
imhist(Img); 
title('Original'); 
subplot(2,2,4), 
imhist(Img_Stect); 
title('Stretched');