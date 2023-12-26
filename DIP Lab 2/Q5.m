p5 = imread("img5.png");
figure;
subplot(1,2,1),imshow(p5);
subplot(1,2,2),imshow(p5);

image = imadjust(p5,[0.3,0.6],[0.0,1.0]);

image1 = histeq(p5);
figure;
subplot(2,2,1),imshow(image);title('Stretched');
subplot(2,2,2),imshow(image);
subplot(2,2,2),imhist(image);
subplot(2,2,1);imshow(p5);
subplot(2,2,2);imhist(p5);
subplot(2,2,3);imshow(p5);
subplot(2,2,3);imshow(image1);title('Histogram. Equ.');
subplot(2,2,4);imhist(image1);
