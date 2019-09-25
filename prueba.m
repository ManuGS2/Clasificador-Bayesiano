% Obtenemos las imágenes de entrenamiento
entre1 = mat2gray(imread("prueba1.png"));
entre2 = mat2gray(imread("prueba2.png"));
entre3 = mat2gray(imread("prueba3.png"));

% Calculamos las probabilidades de cada clase
% a partir de la máscara obtenida de cada entrenamiento
Halo1 = getMask(entre1);
Halo2 = getMask(entre2);
Halo3 = getMask(entre3);
probHalo = classProb(Halo1,Halo2,Halo3);

Pros1 = getMask(entre1);
Pros2 = getMask(entre2);
Pros3 = getMask(entre3);
probaPros = classProb(Pros1,Pros2,Pros3);

Fondo1 = getMask(entre1);
Fondo2 = getMask(entre2);
Fondo3 = getMask(entre3);
probaFondo = classProb(Fondo1,Fondo2,Fondo3);

% Obtenemos la matriz de covarianzas y el vector de 
% medias de cada clase, concatenando cada máscara
matrixHalo = cat(1, immultiply(entre1,double(Halo1)),...
                    immultiply(entre1,double(Pros1)),...
                    immultiply(entre1,double(Fondo1)));

[covHalo, meanHalo] = meanAndCov(matrixHalo);


%mask = immultiply(imagen, double(mask));