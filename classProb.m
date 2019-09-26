
function y = classProb(masks,n)
    imageSize = size(masks,1) * size(masks,2);
    % Auxiliar para sumar todos los pixeles de la clase
    aux = zeros(size(masks,1),size(masks,2));
    for i = 1:n
        aux = aux + masks(:,:,i);
    end
    y = sum(aux(:))/(n*imageSize);
end