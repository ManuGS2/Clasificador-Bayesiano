
function [mean, cov] = meanAndCov(masks,n)
col = size(masks,2);
row = size(masks,1);
muestras = col*row*n;
mean = zeros(3,1);
cov = zeros(3);
pixelValue = zeros(3,1);

% mean
for i=1:n % image
    for x=1:row % row
        for y=1:col % col
            if(masks(x,y,i) > 0)
                mean(1) = mean(1) + masks(x,y,i);
                mean(2) = mean(2) + x;
                mean(3) = mean(3) + y;
            end
        end
    end
end
mean = mean/muestras;

% cov
for i=1:n % image
    for x=1:row % row 
        for y=1:col %col
            if(masks(x,y,i) > 0)
                pixelValue(1) = masks(x,y,i);
                pixelValue(2) = x;
                pixelValue(3) = y;
                cov = cov + (pixelValue - mean)*(pixelValue - mean)';
            end
        end
    end
end
cov = cov/muestras;
end