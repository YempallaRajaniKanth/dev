function Ddeg = segmentAngles(D)
  [m,n] = size(D);
  for i =1:1:m
    for j =1:1:n
      deg = rad2deg(D(i,j));
      if(deg <= 22.5 && deg >= -22.5)
        Ddeg(i,j) = 0;
      elseif(deg <= 67.5 && deg > 22.5)
        Ddeg(i,j) = 1;
      elseif((deg <= 90 && deg > 67.5) || (deg < -67.5 && deg >= -90))
        Ddeg(i,j) = 2;
      elseif(deg < -22.5 && deg >= -67.5)
        Ddeg(i,j) = 3;
      end
    end
  end      
end
