Fs=48e3;
x=rec_so(Fs,Fs);
plot(x)
[X,F]=f_TF(x,Fs); figure(2),plot(F,abs(X)), grid on



