img = imread('Lenna.jpg');
X =double(img);
%Bx = [-1,0,1;-2,0,2;-1,0,1]; % Sobel Gx kernel
Bx = [-1,0,1;-1,0,1;-1,0,1]; 
By = Bx'; % gradient Gy
Yx = filter2(Bx,X); % convolve in 2d
Yy = filter2(By,X);
G = sqrt(Yy.^2 + Yx.^2); % Find magnitude
%Gmin = min(min(G)); dx = max(max(G)) - Gmin; % find range
%G = floor((G-Gmin)/dx*255); % normalise from 0 to 255
Gx=uint8(Yx); figure; imshow(abs(Yx),[]);
Gy=uint8(Yy); figure; imshow(abs(Yy),[]);
G=uint8(G); figure; imshow(abs(G),[]);

G=double(G);
Ddeg = segmentAngles(G);
imgMax = nonMaxSuppress(F,Ddeg);
figure();
subplot(121);imshow(uint8(imgMax));title("Non Maximum Suppression image");
subplot(122);imshow(uint8(F));title("Full Gradient image");



%edgeDeg = edgeDirection(Ddeg);
%imgH = hysteresisThreshold(imgMax, edgeDeg, 100, 40);
%figure();
%subplot(121);imshow(uint8(imgH));
%subplot(122);imshow(uint8(imgMax));