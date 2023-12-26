img = imread("/MATLAB Drive/Lab Final/image3.png");

% Convert to grayscale
gray_img = rgb2gray(img);

% Threshold the image to get a binary mask
thresh = graythresh(gray_img);
binary_mask = imbinarize(gray_img, thresh);

% Perform morphological operations to enhance the mask
se = strel('disk', 5);
eroded_mask = imerode(binary_mask, se);
dilated_mask = imdilate(eroded_mask, se);

% Compute the distance transform of the mask
distance_transform = -bwdist(~dilated_mask);

% Apply the watershed algorithm
watershed_lines = watershed(distance_transform);

% Identify the markers within the watershed lines
markers = imregionalmin(distance_transform);

% Apply the markers to the watershed lines
marked_watershed = watershed(imimposemin(distance_transform, markers));

% Overlay the segmented tumor on the original image
tumor_region = gray_img;
tumor_region(marked_watershed == 0) = 0;
tumor_segmented = label2rgb(marked_watershed, 'jet', 'w');

% Display the results
figure;
subplot(1, 2, 1), imshow(img), title('Original Image');
subplot(1, 2, 2), imshow(tumor_segmented), title('Segmented Tumor');
