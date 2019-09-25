
function [covHalo, meanHalo, probaHalo,...
       covPros, meanPros, probaPros,...
       covFondo, meanFondo, probaFondo] = training(entre1, entre2, entre3)

% Calculamos las probabilidades de cada clase
% a partir de la máscara obtenida de cada entrenamiento
Halo1 = getMask(entre1);
Halo2 = getMask(entre2);
Halo3 = getMask(entre3);
probaHalo = classProb(Halo1,Halo2,Halo3);


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
                    immultiply(entre2,double(Halo2)),...
                    immultiply(entre3,double(Halo3)));
[meanHalo, covHalo] = meanAndCov(matrixHalo);

matrixPros = cat(1, immultiply(entre1,double(Pros1)),...
                    immultiply(entre2,double(Pros2)),...
                    immultiply(entre3,double(Pros3)));
[meanPros, covPros] = meanAndCov(matrixPros);

matrixFondo = cat(1, immultiply(entre1,double(Fondo1)),...
                    immultiply(entre2,double(Fondo2)),...
                    immultiply(entre3,double(Fondo3)));
[meanFondo, covFondo] = meanAndCov(matrixFondo);
end