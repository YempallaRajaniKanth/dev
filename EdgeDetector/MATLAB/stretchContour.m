function [img1, isVisited] = stretchContour(img1, img, i, j, edgeDeg, isVisited, Tmin)
  
  [mO,nO] = size(img);
    val = edgeDeg(i,j);
   if(val == 0)
    m1 = i;
    n1 = j+1;
    m2 = i;
    n2 = j-1;
  elseif(val == 1)
    m1 = i-1;
    n1 = j+1;
    m2 = i+1;
    n2 = j-1;
  elseif(val == 2)
    m1 = i-1; 
    n1 = j;
    m2 = i+1;
    n2 = j;
  elseif(val == 3)
    m1 = i+1;
    n1 = j+1;
    m2 = i-1;
    n2 = j-1;
   end
  
  if( m1>0 && m1 <= mO && n1 >0 && n1 <= nO && isVisited(m1,n1)==0 && img(m1,n1) > Tmin)
    img1(m1,n1) = img(m1,n1);
    isVisited(m1,n1)=1;
    [img1, isVisited] = stretchContour(img1, img, m1, n1, edgeDeg, isVisited, Tmin);
  end

  if(m2>0 && m2 <= mO && n2 >0 && n2 <= nO && isVisited(m2,n2)==0 && img(m2,n2) > Tmin)
    img1(m2,n2) = img(m2,n2);
    isVisited(m2,n2)=1;
    [img1, isVisited] = stretchContour(img1, img, m2, n2, edgeDeg, isVisited, Tmin);
  end
  
end