function image = sharpenImage(img)

 s = [0,-1,0; -1,4,-1;0,-1,0];
  display(s);
  sharp = conv2(img,s,"same");
  image = uint8(img)+uint8(sharp);

end