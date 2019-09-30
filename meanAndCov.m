
function [media, cova] = meanAndCov(masks,n)
col = size(masks,2);
row = size(masks,1);
muestras = 0;

media = zeros(3,1);
cova = zeros(3);
pixelValue = zeros(3,1);

for i=1:n % image
    for x=1:row % row
        for y=1:col % col
            if(masks(x,y,i) > 0)
                % Media
                muestras = muestras + 1;
                media(1,1) = media(1) + masks(x,y,i);
                media(2,1) = media(2) + x;
                media(3,1) = media(3) + y;
            end
        end
    end
end
media = media/muestras;

%  Covarianza
for i=1:n % image
    for x=1:row % row 
        for y=1:col %col
            if(masks(x,y,i) > 0)
                pixelValue(1,1) = masks(x,y,i);
                pixelValue(2,1) = x;
                pixelValue(3,1) = y;
                cova = cova + (pixelValue - media)*(pixelValue - media)';
            end
        end
    end
end
cova = cova/muestras;
end