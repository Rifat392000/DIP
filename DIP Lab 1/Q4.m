image= imread('img2.png'); 
point1= [2,4]; 
point2= [8, 14]; 
euclidean_distance =sqrt(sum((point1 - point2).^2)); 
imshow(image); 
plot(point1(1),point1(2), 'ro', 'MarkerSize',10);
plot(point2(1),point2(2), 'bo', 'MarkerSize',10); 
text(point1(1),point1(2) + 20, ['Distance: '
num2str(euclidean_distance)],'Color', 'g','FontSize', 12);