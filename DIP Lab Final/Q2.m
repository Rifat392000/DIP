% Read the image
img = imread("/MATLAB Drive/Lab Final/image1.png");

% Convert the image to grayscale
img = rgb2gray(img);

% Add Gaussian noise to the image
img_noise = imnoise(img, 'gaussian', 0, 0.01);

% Median filter
med_filt = medfilt2(img_noise, [5, 5]);

% Maximum filter
max_filt = ordfilt2(img_noise, 25, ones(5, 5));

% Minimum filter
min_filt = ordfilt2(img_noise, 1, ones(5, 5));

% Midpoint filter
mid_filt = ordfilt2(img_noise, 13, ones(5, 5));

% Alpha-trimmed filter
alpha_trim_filt = imfilter(img_noise, fspecial('unsharp', 0.2), 'replicate');
alpha_trim_filt = img_noise - alpha_trim_filt;

% Trimmed filter
trimmed_filt = ordfilt2(img_noise, 5, ones(5, 5));

% Display the results
subplot(2, 3, 1), imshow(med_filt), title('Median Filter');
subplot(2, 3, 2), imshow(max_filt), title('Maximum Filter');
subplot(2, 3, 3), imshow(min_filt), title('Minimum Filter');
subplot(2, 3, 4), imshow(mid_filt), title('Midpoint Filter');
subplot(2, 3, 5), imshow(alpha_trim_filt), title('Alpha-Trimmed Filter');
subplot(2, 3, 6), imshow(trimmed_filt), title('Trimmed Filter');
