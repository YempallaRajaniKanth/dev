function inputImage = histogramequalizerhelper(path)
inputImage=imread(path);
subplot(2,2,1)
imshow(inputImage); title('Image Before Histogram Equalization');
imageHeight=size(inputImage,1);
imageWidth=size(inputImage,2);
new_Image=uint8(zeros(imageHeight,imageWidth));
numberOfPixels=imageHeight*imageWidth;
images_histogram=zeros(1,256);
new_images_histogram=zeros(1,256);

%below for-loop helps in finding the image histogram
% pixel intensity is calculated at each level and then image histogram is
% calculated

for i=1:imageHeight
    for j=1:imageWidth
        pixelintensity=inputImage(i,j);
        images_histogram(pixelintensity+1)=images_histogram(pixelintensity+1)+1;
    end
end

%Below code calculates the cumulative histogram
lengthofhistogram = length(images_histogram);
cumulativeHistogramImage = zeros(1,lengthofhistogram);
cumulativeHistogramImage(1) = images_histogram(1);
for i=2:1:lengthofhistogram
cumulativeHistogramImage(i) = images_histogram(i) + cumulativeHistogramImage(i-1);
end

lengthofcumulativehistogramImage = length(cumulativeHistogramImage);
probablitydensityfun = zeros(1,lengthofcumulativehistogramImage);
for i=1:1:lengthofcumulativehistogramImage
probablitydensityfun(i) = (cumulativeHistogramImage(i))/numberOfPixels;
end

lengthofprobalitydensfunc = length(probablitydensityfun);
outputImage = zeros(1,lengthofprobalitydensfunc);
for i=1:1:lengthofprobalitydensfunc
outputImage(i) = round((probablitydensityfun(i))*255);
end

for i=1:imageHeight
    for j=1:imageWidth
        new_Image(i,j)=outputImage(inputImage(i,j)+1);
    end
end

for i=1:imageHeight
    for j=1:imageWidth
        pixelintensity=new_Image(i,j);
        new_images_histogram(pixelintensity+1)=new_images_histogram(pixelintensity+1)+1;
    end
end

subplot(2,2,2);
imshow(new_Image), title('Image After Histogram Equalization');
subplot(2,2,3);
plot(images_histogram);title('Histogram before Equalization');
subplot(2,2,4);
plot(new_images_histogram);title('Histogram after Equalization')
end