% Material per a l'elaboració de la 
% sessió de laboratori PDS_DFT de PDS
% 2a part
%
% 18 de desembre de 2012

clear,clc
%% UNIFORM SAMPLING LEPWM
%% Espectre d'un senyal PWM
tic
% senyal de veu
load ALIMENTACIO.mat, % carrega x_veu i fs=48e3
p=floor(log2(length(x_veu)));x_veu=x_veu(1:2^(p-0));%+0 1.12s, +1 1.45s, +2 1.32s, +3 1.65s,
% base de temps mostreig
N=length(x_veu);t=[0:N-1]'/fs;
% senyal sinusoïdal
A_sin=0.05;f_sin=600;x_sin=A_sin*cos(2*pi*f_sin*t);

% senyal modulador
x=1*x_veu+0*x_sin;

% senyal PWM
fpwm=1*fs; % aconsellable que frequenca mostreig mes gran frequencia PWM
k=64; % mostres per període de PWM, mostres utilitzades per fer ADC
DR=5; % rang dinàmic de 0 a DR

% temps de simulació
t_sim=N/fs;

%% genero senyal x
% condicionament del senyal
x=x-mean(x);%trec la contínua
x=x/max(abs(x));% normalitzo, senyal entre -1 i 1
x=x*DR/2+DR/2;%desplaço, senyal entre 0 i DR

%% genero senyal pwm2 i pwm
% base de temps pwm
tpwm2=[0:1/fpwm:t_sim-1/fpwm]';
% rendiment de cicle del senyal PWM per a cada pwm
xpwm2=0*tpwm2;
if fpwm/fs==round(fpwm/fs)
    e1=round(fpwm/fs);
    for i=0:e1-1
        xpwm2(1+i:e1:end)=x;
    end    
else
    for i=1:N;
        xpwm2(tpwm2>=t(i))=x(i);
    end
end
toc
% base de temps pwm
tpwm=[0:1/fpwm/k:t_sim-1/fpwm/k]';
% valor del senyal PWM, k punts per període
xpwm=0*tpwm;
if fpwm/fs==round(fpwm/fs)
    eo=round(k*xpwm2/DR);
    for i=1:length(tpwm2);
        xpwm((1+(i-1)*k:(i-1)*k+eo(i)))=DR;
    end    
else
    eo=1/fpwm*xpwm2/DR;
    for i=1:length(tpwm2);
        xpwm((tpwm>=tpwm2(i))&(tpwm<tpwm2(i)+eo(i)))=1;
    end
end
toc

%% espectre dels senyals
% % senyal x i xpwm
tic
[X,F]=f_TF(x,fs);
temps_DFT_N=toc
tic
[Xpwm,Fpwm]=f_TF(xpwm,fpwm*k);
temps_DFT_Nxk=toc

%% SIMULACIO D'UN FILTRE PAS-BAIX ANALÒGIC, DFT
n=1;%filtre d'ordre n
fc=600;
wc=2*pi*fc;%wc=1/10e3/12e-9; % a partir R i C si n=1
[b,a]=butter(n,wc,'s');
w=2*pi*Fpwm;s=1i*w;
num=0;for i=1:length(b),num=num+b(i)*s.^(length(b)-i);end
den=0;for i=1:length(a),den=den+a(i)*s.^(length(a)-i);end
Ha=num./den;
%Ha=1./(s/wc+1);%directament si n=1
% filtrem
tic
Ya=Ha.*Xpwm;
% transformada inversa
[y_DFTa,ty]=f_iTF(Ya,fpwm*k);
filtrat_DFTa_Nxk=toc

%% IMPLEMENTACIO D'UN FILTRE PAS-BAIX DIGITAL, DFT
[b,a]=butter(n,fc/(fpwm*k)*2);
W=2*pi*Fpwm/(fpwm*k);z=exp(1i*W);
num=0;for i=1:length(b),num=num+b(i)*z.^-(i-1);end
den=0;for i=1:length(a),den=den+a(i)*z.^-(i-1);end
Hd=num./den;
% filtrem
tic
Y=Hd.*Xpwm;
% transformada inversa
[y_DFT,ty]=f_iTF(Y,fpwm*k);
filtrat_DFT_Nxk=toc

%% IMPLEMENTACIO D'UN FILTRE PAS-BAIX DIGITAL, filter
% filtrem
tic
y_filter=filter(b,a,xpwm);%y_filter(ty<5e-3)=DR/2;
filtrat_filter_Nxk=toc

%% representacions
x0=0;%1284;

% interval de representació
tr=2/f_sin;%2 perìodes del sinus

figure(1),set(gcf,'Position',[x0 502 560 420])
plot(t(t<tr),x(t<tr),'.-',tpwm2(tpwm2<tr),xpwm2(tpwm2<tr),tpwm(tpwm<tr),xpwm(tpwm<tr))
legend('x','xpwm2','xpwm'),grid on, axis([0 tr -.1 DR+.1])

figure(2),set(gcf,'Position',[x0+565 502 560 420])
plot(F,abs(X),Fpwm,abs(Xpwm))
legend('X','Xpwm'),grid on, axis([-f_sin*2 1.1*2*fpwm 0 DR/2])
break
figure(3),set(gcf,'Position',[x0 4 560 420])
plot(Fpwm,abs(Ha),Fpwm,abs(Hd),'--',F,abs(X),Fpwm,abs(Xpwm),Fpwm,abs(Ya),Fpwm,abs(Y),'--')
legend('Ha','Hd','X','Xpwm','Ya','Y'),grid on, axis([-f_sin*2 1.1*2*fpwm 0 DR/2])

figure(4),set(gcf,'Position',[x0+565 4 560 420])
plot(t(t<tr),x(t<tr),ty(ty<tr),y_DFTa(ty<tr),ty(ty<tr),y_DFT(ty<tr),ty(ty<tr),y_filter(ty<tr),'.')
legend('x','yDFTa','yDFT','yfilter'),grid on

%% escolto
x_sc=x-mean(x);
sound(x_sc/max(abs(x_sc))*.99,fs)

ky=fpwm/fs;
y_DFTa_sc=y_DFTa(1:ky*k:end);y_DFTa_sc=y_DFTa_sc-mean(y_DFTa_sc);
norm=max(abs(y_DFTa_sc));
sound(y_DFTa_sc/norm*.99,fpwm/ky)

y_DFT_sc=y_DFT(1:ky*k:end);y_DFT_sc=y_DFT_sc-mean(y_DFT_sc);
sound(y_DFT_sc/norm*.99,fpwm/ky)

y_filter_sc=y_filter(1:ky*k:end);y_filter_sc=y_filter_sc-mean(y_filter_sc);
sound(y_filter_sc/norm*.99,fpwm/ky)

