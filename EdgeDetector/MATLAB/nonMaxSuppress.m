function img = nonMaxSuppress(F,Ddeg)
  [m,n] = size(F);
  for i =2:1:m-1
    for j =2:1:n-1
      if(Ddeg(i,j)==0)
          if(F(i,j) >= F(i,j-1) && F(i,j) >= F(i,j+1))
           img(i,j) = F(i,j);
          else
           img(i,j) = 0;
          end       
      elseif(Ddeg(i,j)==1)
          if(F(i,j) >= F(i-1,j+1) && F(i,j) >= F(i+1,j-1))
           img(i,j) = F(i,j);
          else
           img(i,j) = 0;
          end
      elseif(Ddeg(i,j)==2)
          if(F(i,j) >= F(i-1,j) && F(i,j) >= F(i+1,j))
            img(i,j) = F(i,j);
          else
            img(i,j) = 0;
          end          
      elseif(Ddeg(i,j)==3)
          if(F(i,j) >= F(i-1,j-1) && F(i,j) >= F(i+1,j+1))
            img(i,j) = F(i,j);
          else
            img(i,j) = 0;
          end
          end      
    end
    end  
  end
