function inputImage=MedianFiltering(path)

inputImage = imread(path) ;
figure,imshow(inputImage),title("Image before filter");
inputImage = im2double(inputImage);
[m, n] = size(inputImage);
Median = [];
 
for i=2:m-1
    for j=2:n-1
            Median(1) = inputImage(i-1,j-1);
            Median(2) =inputImage(i-1,j) ;
            Median(3) = inputImage(i-1,j+1);
            Median(4) = inputImage(i,j-1);
            Median(5) = inputImage(i,j+1);
            Median(6) = inputImage(i+1, j-1);
            Median(7) = inputImage(i+1,j);
            Median(8) = inputImage(i+1,j+1);
            inputImage(i,j) = median(Median);
    end
end 
figure , imshow(inputImage), title("Image after Median Filter");