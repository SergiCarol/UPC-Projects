% calcula la TF X d'un senyal x
% mostrejat a fs
%
% 26 de març de 2012

function [X,F]=f_TF(x,fs)

% durada del senyal x
N=length(x);

% calculo la TF
X1=fft(x);
%despla�o
X2=fftshift(X1);
% escalo
X=X2/N;

% freqüència corresponent a de cada coeficient
F=0*X;
F(1:end)=[-ceil((N-1)/2):floor((N-1)/2)]*fs/N;

