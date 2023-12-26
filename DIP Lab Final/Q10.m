% Read the image
img = imread('/MATLAB Drive/Lab Final/image3.png');
grayImg = rgb2gray(img);
edgeImg = edge(grayImg, 'Canny');

% Apply Hough transform
[H, theta, rho] = hough(edgeImg, 'Theta', -90:0.5:89.5);
peaks = houghpeaks(H, 10, 'Threshold', 0.3 * max(H(:)));
lines = houghlines(edgeImg, theta, rho, peaks, 'FillGap', 10, 'MinLength', 20);

% Display the original image
imshow(img);
hold on;

% Draw the detected lines on the original image
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:, 1), xy(:, 2), 'LineWidth', 2, 'Color', 'green');
end
hold off;
