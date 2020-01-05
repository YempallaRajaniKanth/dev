function imgF = getFullGrad(imgGx, imgGy)
  [m, n] = size(imgGx);
    for i=1:1:m
    for j =1:1:n
      imgF(i,j) = sqrt((imgGx(i,j)).^2 + (imgGy(i,j)).^2);
    end
  end
end