img = imread('/MATLAB Drive/Lab 3/image3.jpg');
noisyImage = imnoise(img, "salt & pepper", 0.02);
minImage = ordfilt2(noisyImage, 1, ones(3));
maxImage = ordfilt2(noisyImage, 9, ones(3));
figure;
subplot(2, 2, 1), imshow(img);
title("Original");
subplot(2, 2, 2), imshow(noisyImage);
title("Noisy");
subplot(2, 2, 3), imshow(minImage);
title("Min");
subplot(2, 2, 4), imshow(maxImage);
title("Max")