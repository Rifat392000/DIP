function Q6ii
    % Load the image
    originalImage = imread('/MATLAB Drive/Lab Final/image3.png');

    % Convert to grayscale if necessary
    grayImage = rgb2gray(originalImage);

    % Set the threshold for splitting and merging
    threshold = 20;

    % Apply Region Splitting and Merging
    segmentedImage = regionSplitMerge(grayImage, threshold);

    % Display the original and segmented images
    figure;
    subplot(1, 2, 1);
    imshow(grayImage);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(segmentedImage, []);
    title('Segmented Image');
end

function segmented_image = regionSplitMerge(image, threshold)
    % Initial call to recursive splitting and merging
    segmented_image = splitMerge(image, threshold);
    
    function result = splitMerge(region, threshold)
        % Display some information for debugging
        disp(['Threshold: ', num2str(threshold), ', Region Std: ', num2str(std2(region))]);

        % Check if the region needs to be split or merged
        if std2(region) > threshold
            % Split the region into four quadrants
            [height, width] = size(region);
            half_height = floor(height / 2);
            half_width = floor(width / 2);
            
            quadrant1 = region(1:half_height, 1:half_width);
            quadrant2 = region(1:half_height, half_width+1:end);
            quadrant3 = region(half_height+1:end, 1:half_width);
            quadrant4 = region(half_height+1:end, half_width+1:end);
            
            % Recursively call splitMerge on each quadrant
            result1 = splitMerge(quadrant1, threshold);
            result2 = splitMerge(quadrant2, threshold);
            result3 = splitMerge(quadrant3, threshold);
            result4 = splitMerge(quadrant4, threshold);
            
            % Combine the results to get the segmented region
            result = [result1, result2; result3, result4];
        else
            % Merge the region by setting all pixels to the mean value
            result = ones(size(region)) * mean(region(:));
        end
    end
end
