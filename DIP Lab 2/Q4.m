p4_1 = imread('img3.png');
p4_2 = imread('img4.png');
M = zeros(256,1,'uint8');
hist1 = imhist(p4_1);
hist2 = imhist(p4_2);
cdf1 = cumsum(hist1) / numel(p4_1);
cdf2 = cumsum(hist2) / numel(p4_2);
for idx = 1 : 256
diff = abs (cdf1(idx) - cdf2);
[~,ind] = min(diff);
M(idx) = ind-1;
end
out = M(double(p4_1)+1);
subplot(2,3,1),imshow(p4_1);
title('Tree');
subplot(2,3,2),imshow(p4_1);
title('Tree Reference');
subplot(2,3,3),imshow(out);
title('Hist. matched tree');
subplot(2,3,4),imhist(p4_1);
title('Tree Histogram');
subplot(2,3,5),imhist(p4_2);
title('Ref. Histogram');
subplot(2,3,6),imhist(out);
title('Output Image');
subplot(2,2,7),imhist()