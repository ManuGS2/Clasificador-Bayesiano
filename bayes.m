% Clasificador bayesiano
%
%
%
%
%
%
%
%

entre1 = im2double(imread("./img-training/prueba4.png"));
entre2 = im2double(imread("./img-training/prueba5.png"));
entre3 = im2double(imread("./img-training/prueba6.png"));
entre1 = entre1(110:200,85:175);
entre2 = entre2(110:200,85:175);
entre3 = entre3(110:200,85:175);

imagen = im2double(imread("./img-training/prueba4.png")); % IMAGEN DE PRUEBA
imagen = imagen(110:200,85:175);

[covHalo, meanHalo, probaHalo, covPros, meanPros, probaPros,covFondo, meanFondo, probaFondo] = training(entre1, entre2, entre3);

col = size(imagen,2);
row = size(imagen,1);

for x=1:row
    for y=1:col
        pixel_vect = [imagen(x,y);x;y];
        difPros = pixel_vect - meanPros;
        difHalo = pixel_vect - meanHalo;
        difFondo = pixel_vect - meanFondo;

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