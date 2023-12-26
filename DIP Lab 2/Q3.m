p3=imread('img2.png');
p3=im2double(p3);
x = p3;
y = p3;
constant=0.5;
gama=0.2;
[r,c]=size(p3);
for i = 1:r
for j = 1:c
x(i,j)=constant*log(1+p3(i,j));
y(i,j)=constant*p3(i,j).^0.2;
end
end
subplot(2,3,1); imshow(p3); title('Original');
subplot(2,3,2); imshow(x); title('Logarithmic Trans.');
subplot(2,3,3); imshow(y); title('Power-Law Trans.');