% Material per a l'elaboració de la 
% sessió de laboratori PDS_DFT de PDS
% 1a part
%
% 18 de desembre de 2012


%% Espectre d'un senyal de veu
% senyal de veu
load ALIMENTACIO.mat, % carrega x_veu i fs=48e3
% p=floor(log2(length(x_veu)));x_veu=x_veu(1:2^p);
% base de temps mostreig
N=length(x_veu);
t=[0:N-1]'/fs;
% senyal sinusoidal
A_sin=0.05;
f_sin=600;
x_sin=A_sin*cos(2*pi*f_sin*t);
% suma
x=x_veu+x_sin;

% calcul de l'espectre
[X,F]=f_TF(x,fs); %funcio implementada

% representacio de l'espectre
%figure,set(gcf,'Position',[0 0 [1300 450]/2.2])
plot(F,abs(X))
% stem(F,abs(X)) 

grid on, legend('Coeficients SF')
title(['\itf_{sin}\rm=',num2str(f_sin),'; \itA_{sin}\rm=',num2str(A_sin)])
ylabel('|\itX(F)/N|')
xlabel('\itf  \rm(Hz)')
% save2pdf(['/home/bonet/Documents/Zbomber DADES/aaaDOCENT/itic-pds/PDS-DFT/Images/fig1.pdf'],gcf,600)
% axis([1e3*[0 1] 0 0.03]),save2pdf(['/home/bonet/Documents/Zbomber DADES/aaaDOCENT/itic-pds/PDS-DFT/Images/fig1b.pdf'],gcf,600)
