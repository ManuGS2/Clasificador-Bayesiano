
function [mean, cov] = meanAndCov(imageMatrix)
col = size(imageMatrix,2);
row = size(imageMatrix,1)/3; % There 3 images in a column
muestras = col*row*3;
mean = zeros(3,1);
cov = zeros(3);
pixelValue = zeros(3,1);

% mean
for i=1:3 % image
    for x=1:row % row
        for y=1:col % col
            if(imageMatrix(row*(i-1)+x, y) > 0)
                mean(1) = mean(1) + imageMatrix(row*(i-1)+x, y);
                mean(2) = mean(2) + x;
                mean(3) = mean(3) + y;
            end
        end
    end
end
mean = mean/muestras;

% cov
for i=1:3 % image
    for x=1:row % row 
        for y=1:col %col
            if(imageMatrix(row*(i-1)+x, y) ~= 0)
                pixelValue(1) = imageMatrix(row*(i-1)+x, y);
                pixelValue(2) = x;
                pixelValue(3) = y;
                cov = cov + (pixelValue - mean)*(pixelValue - mean)';
            end
        end
    end
end
cov = cov/muestras;
end