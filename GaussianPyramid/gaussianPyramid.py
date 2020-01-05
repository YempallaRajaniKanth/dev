import cv2
import numpy as np
import matplotlib.pyplot as plt

from PIL import Image
from skimage import io
from skimage import data
from skimage.color import rgb2gray
from skimage.transform import pyramid_gaussian

image = io.imread('Lenna_(test_image).png')
rows, cols, dim = image.shape
pyramid = tuple(pyramid_gaussian(image, downscale=2, multichannel=True))
composite_image = np.zeros((rows, cols + cols // 2, 3), dtype=np.double)
composite_image[:rows, :cols, :] = pyramid[0]

W = 1000
resizedImagetrain=[]
resizedImagetraingray=[]
height, width, depth = image.shape
imgScale = W/width
newX,newY = image.shape[1]*imgScale, image.shape[0]*imgScale
downscale=cv2.pyrDown(image)
newImage=[]

for y in range(7):
    newImage.append(downscale)
    downscale=cv2.pyrDown(downscale)

resizedImagetrain.append(cv2.resize(image,(int(newX-350), int(newY-350))))
for z in range(7):
    resizedImagetrain.append(cv2.resize(newImage[z], (int(newX-350), int(newY-350))))
    cv2.imshow("PyrDownImage", cv2.cvtColor(resizedImagetrain[z],cv2.COLOR_BGR2GRAY))
    cv2.waitKey(0)

i_row = 0
for p in pyramid[1:]:
    n_rows, n_cols = p.shape[:2]
    print "Shape ",p.shape[:2]
    print "Pyramid Size ",pyramid[1:].__len__()
    composite_image[i_row:i_row + n_rows, cols:cols + n_cols] = p
    print "I-Row",i_row
    print "N-Row",n_rows
    print "Column",cols
    print "NColumns",n_cols
    i_row += n_rows

fig, ax = plt.subplots()
ax.imshow(rgb2gray(composite_image),cmap=plt.cm.gray)
plt.show()
