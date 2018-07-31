% CALCULA A APROXIMAÇÃO VIA CAOS POLINOMIAL PARA UMA O VARIAS
% VARIÁVEIS

% Supondo que as variáveis seguem uma distribuição Log-Normal(0,1)

clear
clc

load('modelo.mat');
k=1;
for i=2:size(modelo,1)
    if modelo{i,2} == 1
        variaveisAtivas(k,1) = modelo(i,1); 
        k =k+1;
    end
end

% Parâmetros
numVar = size(variaveisAtivas,1);
% Gauss e Smolyak
grau = 2;
nodos = 6; %k: Número de raices para utilizar na Q.Univariada Gauss-Hermite
% Smolyak
ordem = 13; %k: Máximo ordem nas quadraturas univariadas para Smolyak


if  numVar== 1
    PCEQuadratureGaussHermGeral(nodos, grau, modelo, numVar)
else
    PCEQuadratureSmolyak_GH(nodos, ordem, grau, modelo, numVar)
end