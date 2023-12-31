img = imread('/MATLAB Drive/Lab 3/image3.jpg');
noisyImage = imnoise(img, "gaussian", 0.08);
gaussianImage = imgaussfilt(noisyImage, 1.5);
figure;
subplot(1, 3, 1), imshow(img);
title("Original");
subplot(1, 3, 2), imshow(noisyImage);
title("Noisy");
subplot(1, 3, 3), imshow(gaussianImage);
title("Gaussian");