% CALCULA A APROXIMA��O VIA CAOS POLINOMIAL PARA UMA O VARIAS
% VARI�VEIS

% Supondo que as vari�veis seguem uma distribui��o Log-Normal(0,1)

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

% Par�metros
numVar = size(variaveisAtivas,1);
% Gauss e Smolyak
grau = 2;
nodos = 6; %k: N�mero de raices para utilizar na Q.Univariada Gauss-Hermite
% Smolyak
ordem = 13; %k: M�ximo ordem nas quadraturas univariadas para Smolyak


if  numVar== 1
    PCEQuadratureGaussHermGeral(nodos, grau, modelo, numVar)
else
    PCEQuadratureSmolyak_GH(nodos, ordem, grau, modelo, numVar)
end