function D = getAngles(imgGx, imgGy)
    [m,n] = size(imgGx);    
    D = zeros(m,n);
    for i =1:1:m
      for j =1:1:n
        if(imgGx(i,j) == 0)
          D(i,j) = atan(Inf);
        else
         D(i,j) =  atan(imgGy(i,j)/imgGx(i,j));
        end  
      end
    end   
end
