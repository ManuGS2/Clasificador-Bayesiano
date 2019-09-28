
function [covar,media,proba] = training(imagenes,n)
    % Calculamos las probabilidades de cada clase
    % a partir de la máscara obtenida de cada entrenamiento
    masks = zeros(size(imagenes));

    for i = 1:n
        masks(:,:,i) = getMask(imagenes(:,:,i));
    end
    proba = classProb(masks,n);

    for i = 1:n
        masks(:,:,i) = immultiply(imagenes(:,:,i),double(masks(:,:,i)));
    end
    [media,covar] = meanAndCov(masks,n);
end
