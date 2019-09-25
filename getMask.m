
function mask = getMask(imagen)
    % Obtenemos las m�scaras para cada clase
    figure();
    imshow(imagen,[]); 
    d = imfreehand; wait(d);
    mask  = createMask(d);
    imshow(mask,[]);
end
