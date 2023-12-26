img = imread("/MATLAB Drive/Lab Final/image1.png");
img=rgb2gray(img);
GI=imnoise(img,'gaussian');
Gg=im2double(GI);
Kr=3;
Kc=3;
Ord = 2;
%Geometric Mean filter
GM=exp(imfilter(log(Gg),ones(Kr,Kc),'replicate')).^(1/(Kr*Kc));
%Harmonic Mean filter
HM=(Kr*Kc)./imfilter(1./(Gg+eps),ones(Kr,Kc),'replicate');
%Contra-harmonic Mean filter
CM = imfilter(Gg.^(Ord + 1), ones(Kr, Kc), 'replicate') ./ (imfilter(Gg.^Ord, ones(Kr, Kc), 'replicate') + eps);
%Display
subplot(2,3,1), imshow(img); title('Input Orginal');
subplot(2,3,2), imshow(GI); title('Gaussian noise');
subplot(2,3,4), imshow(GM);title('Geometric Mean filter')
subplot(2,3,5), imshow(HM);title('Harmonic Mean Filter')
subplot(2,3,6), imshow(CM); title('Contraharmonic mean filter');