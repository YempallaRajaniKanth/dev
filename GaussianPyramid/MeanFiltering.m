function inputImage=MeanFiltering(path)

inputImage = imread(path);
h = ones(5,5) / 25;
I2 = imfilter(inputImage,h);
imshow(inputImage), title('Original Image');
figure, imshow(I2), title('Filtered Image')

end