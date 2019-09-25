
function y = classProb(image1, image2, image3)
imageSize = size(image1,1) * size(image1,2);
y = sum( image1(:) + image2(:) + image3(:) )/(3*imageSize);
end