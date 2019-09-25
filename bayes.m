% Clasificador bayesiano
%
%
%
%
%
%
%
%

entre1 = mat2gray(imread("./img-training/prueba1.png"));
entre2 = mat2gray(imread("./img-training/prueba2.png"));
entre3 = mat2gray(imread("./img-training/prueba3.png"));

imagen = mat2gray(imread("./img-training/prueba1.png")); % IMAGEN DE PRUEBA

covHalo, meanHalo, probaHalo, covPros, meanPros, probaPros,covFondo, meanFondo, probaFondo = training(entre1, entre2, entre3);

col = size(imagen,2);
row = size(imagen,1);

for x=1:row
    for y=1:col
        difPros = imagen(x,y) - meanPros;
        difHalo = imagen(x,y) - meanHalo;
        difFondo = imagen(x,y) - meanFondo;

        provClase(1) = -(1/2) * difPros' * inv(covPros) * difPros - (1/2) * log(det(covPros)) + log(probaPros);
        provClase(2) = -(1/2) * difHalo' * inv(covHalo) * difHalo - (1/2) * log(det(covHalo)) + log(probaHalo);
        provClase(3) = -(1/2) * difFondo' * inv(covFondo) * difFondo - (1/2) * log(det(covFondo)) + log(probaFondo);

        if provClase(1) > provClase(2) && provClase(1) > provClase(3) % es prostata
        	imagen(x,y) = 256;
        end
        
        if provClase(2) > provClase(1) && provClase(2) > provClase(3) % es halo
        	imagen(x,y) = 126;
        end
        
        if provClase(3) > provClase(1) && provClase(3) > provClase(2) % es fondo
            imagen(x,y) = 0;
        end
    end
end


imshow(imagen, [])