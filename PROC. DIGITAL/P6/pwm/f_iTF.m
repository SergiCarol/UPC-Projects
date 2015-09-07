% calcula la iTF x d'un senyal X
% en el format fftshift i *length(X)
% mostrejat a fs
%
% 17 de desembre de 2012

function [x,t]=f_iTF(X,fs)

% durada del senyal X
N=length(X);

% despla�o i escalo
X=ifftshift(X)*N;
% calculo la iTF
x=real(ifft(X));

% base de temps
t=0*x;
t(1:end)=[0:N-1]/fs;
