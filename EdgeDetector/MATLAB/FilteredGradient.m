img = imread("Lenna.jpg");
subplot(221);imshow(img);title("Original Image");
g = fspecial('gaussian',3,1);
%g=guassianFilteringRajani("Lenna.jpg");
imgG = conv2(img,g,"same");
imgGx = getGrad(imgG, "X");
subplot(222);imshow(imgGx);title("Gradient x image");
imgGy = getGrad(imgG, "Y");
subplot(223);imshow(imgGy);title("Gradient y image");
F = getFullGrad(imgGx, imgGy);
subplot(224);imshow(F);title("Full Gradient image")
D = getAngles(imgGx, imgGy);

%Ddeg = segmentAngles(D);
%imgMax = nonMaxSuppress(F,Ddeg);
%figure();
%subplot(121);imshow(uint8(imgMax));title("Non Maximum Suppression image");
%subplot(122);imshow(uint8(F));title("Full Gradient image");



%edgeDeg = edgeDirection(Ddeg);
%imgH = hysteresisThreshold(imgMax, edgeDeg, 100, 40);
%figure();
%subplot(121);imshow(uint8(imgH));
%subplot(122);imshow(uint8(imgMax));