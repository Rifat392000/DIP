function segmentedImage = regionGrowing(originalImage, seedX, seedY, reg_maxdist)
    if nargin < 4
        reg_maxdist = 0.2;
    end
    if nargin < 3
        figure, imshow(originalImage, []); 
        [seedY, seedX] = getpts; 
        seedY = round(seedY(1)); 
        seedX = round(seedX(1));
    end

    segmentedImage = zeros(size(originalImage));
    imageSize = size(originalImage);
    reg_mean = originalImage(seedX, seedY);
    reg_size = 1;
    neg_free = 10000; 
    neg_pos = 0;
    neg_list = zeros(neg_free, 3);
    pixdist = 0;
    neigb = [-1 0; 1 0; 0 -1; 0 1];
    
    while pixdist < reg_maxdist && reg_size < numel(originalImage)
        num1 = reg_size;  % Fix: numel(reg_size) is incorrect; num1 should be reg_size
        
        % Add new neighbors pixels
        for j = 1:4
            % Calculate the neighbor coordinate
            xn = seedX + neigb(j, 1); 
            yn = seedY + neigb(j, 2);
            
            % Check if neighbor is inside or outside the image
            ins = (xn >= 1) && (yn >= 1) && (xn <= imageSize(1)) && (yn <= imageSize(2));
            
            % Add neighbor if inside and not already part of the segmented area 
            if ins && (segmentedImage(xn, yn) == 0)
                neg_pos = neg_pos + 1;
                neg_list(neg_pos, :) = [xn, yn, originalImage(xn, yn)]; 
                segmentedImage(xn, yn) = 1; 
            end 
        end
        
        if neg_pos + 10 > neg_free
            neg_free = neg_free + 10000;
            neg_list((neg_pos + 1):neg_free, :) = 0;
        end
        
        dist = abs(neg_list(1:neg_pos, 3) - reg_mean);
        [pixdist, index] = min(dist);
        segmentedImage(seedX, seedY) = 2; 
        reg_size = reg_size + 1;
        reg_mean = (reg_mean * reg_size + neg_list(index, 3)) / (reg_size + 1);
        seedX = neg_list(index, 1); 
        seedY = neg_list(index, 2);
        neg_list(index, :) = neg_list(neg_pos, :); 
        neg_pos = neg_pos - 1;
        num2 = reg_size;  % Fix: numel(reg_size) is incorrect; num2 should be reg_size
        diff = num2 - num1;
    end
end

