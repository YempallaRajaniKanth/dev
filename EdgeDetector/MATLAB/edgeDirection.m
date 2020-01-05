function edgeDeg = edgeDirection(Ddeg)
  [m,n] = size(Ddeg);
  for i =1:1:m
    for j =1:1:n
      if(Ddeg(i,j) == 0)
        edgeDeg(i,j) = 2;
      elseif(Ddeg(i,j) == 1)
        edgeDeg(i,j) = 3;
      elseif(Ddeg(i,j) == 2)
        edgeDeg(i,j) = 0;
      elseif(Ddeg(i,j) == 3)
        edgeDeg(i,j) = 1;
      end      
    end
  end
  
end
