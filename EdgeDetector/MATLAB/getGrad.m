function imgG = getGrad(img, dir)
  if(dir == "X")
    Gx = [-1 0 1; -2 0 2; -1 0 1];
    imgG = filter2(Gx, img);
  elseif(dir == "Y")
    Gy = [-1 -2 -1; 0 0 0; 1 2 1];
    imgG = filter2(Gy, img);
  end
  
end
