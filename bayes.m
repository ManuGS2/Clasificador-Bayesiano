% Clasificador bayesiano

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      ENTRENAMIENTO           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
n = 3; % Numero de imagenes de prueba
k = 3; % Numero de clases

% IMAGEN DE PRUEBA
imagen = im2double(imread("./img-training/prueba4.png"));
imagen = imagen(110:200,85:175);

imagenes = zeros(size(imagen,1), size(imagen,2), n);
covas = zeros(k,k,k);
medias = zeros(3,1,k);
probas = zeros(1,k);

entre1 = im2double(imread("./img-training/prueba1.png"));
entre2 = im2double(imread("./img-training/prueba2.png"));
entre3 = im2double(imread("./img-training/prueba3.png"));
imagenes(:,:,1) = entre1(110:200,85:175);
imagenes(:,:,2) = entre2(110:200,85:175);
imagenes(:,:,3) = entre3(110:200,85:175);

for i = 1:k
    % El entrenamiento se realiza para cada clase
    [covas(:,:,i), medias(:,:,i), probas(1,i)] = training(imagenes,n);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            PRUEBA            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

col = size(imagen,2);
row = size(imagen,1);
probClase = 0;
maxProb = 0;
clase = 0;

for x=1:row
    for y=1:col
        pixel_vect = [imagen(x,y);x;y];
        
        % Hacemos el calulo de la probabilidad para cada clase
        for i = 1:k
            dif_vec = pixel_vect - medias(:,:,i);
            probClase = -(1/2) * dif_vec' * inv(covas(:,:,i)) * dif_vec ...
                        -(1/2) * log(det(covas(:,:,i))) + log(probas(i));
            if probClase > maxProb
                maxProb = probClase;
                clase = i;
            end
        end
        
        if clase == 1  % es halo
        	imagen(x,y) = 256;
        end
        
        if clase == 2 % es prostata
        	imagen(x,y) = 126;
        end
        
        if clase == 3 % es fondo
            imagen(x,y) = 0;
        end
    end
end


imshow(imagen, [])