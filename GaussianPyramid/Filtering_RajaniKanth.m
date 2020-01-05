MeanFiltering("Fig0335(a)(ckt_board_saltpep_prob_pt05).tif");
guassianFilteringRajani("Fig0335(a)(ckt_board_saltpep_prob_pt05).tif");
MedianFiltering("Fig0335(a)(ckt_board_saltpep_prob_pt05).tif");
img=imread("Fig0338(a)(blurry_moon).tif");
figure
imshow(img),title('Original Image')
figure
imshow(sharpenImage(img)),title('Sharpened image')