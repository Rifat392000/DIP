img = imread("/MATLAB Drive/Lab Final/image1.png");
gray_img = rgb2gray(img);

% Apply Gaussian filter
filtered_img = imgaussfilt(gray_img, 3);

% Perform local thresholding using Otsu's method 
thresh = graythresh(filtered_img);
bw_img_LT = imbinarize(filtered_img, thresh);

% Perform global thresholding using a fixed threshold value 
thresh = 0.6;
bw_img_GT = imbinarize(filtered_img, thresh);

% Perform variable thresholding using adaptive thresholding 
bw_img_VT = adaptthresh(filtered_img, .1);

% Perform dynamic/adaptive thresholding
bw_img_AT = imbinarize(filtered_img, 'adaptive', 'Sensitivity', 0.5);

% Perform edge detection using the Sobel operator 
sobel_img = edge(filtered_img, 'sobel');

% Display the results with newline characters in titles
subplot(2, 3, 1), imshow(img); title('Unsharp Masking');
subplot(2, 3, 2), imshow(bw_img_LT); title('Local / Regional');
subplot(2, 3, 3), imshow(bw_img_GT); title('Global');
subplot(2, 3, 4), imshow(bw_img_VT); title('Variable');
subplot(2, 3, 5), imshow(bw_img_AT); title('Dynamic / Adaptive');
subplot(2, 3, 6), imshow(sobel_img); title('Edge Detection (Sobel)');
