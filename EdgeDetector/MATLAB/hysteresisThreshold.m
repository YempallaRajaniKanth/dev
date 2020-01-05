function imgH = hysteresisThreshold(img, edgeDeg, Tmax, Tmin)
  [m,n] = size(img);
  isVisited = zeros(m,n);
  img1 = zeros(m,n);
  
  for i =1:1:m
    for j=1:1:n
      if(img(i,j) <= Tmin)
        isVisited(i,j) = 1;
      elseif(img(i,j) >= Tmax && (isVisited(i,j) == 0))
        img1(i,j) = img(i,j);
        isVisited(i,j) = 1; 
        [img1, isVisited] = stretchContour(img1, img, i, j, edgeDeg, isVisited, Tmin);
      end
    end
  end
  
  imgH = img1;
end
