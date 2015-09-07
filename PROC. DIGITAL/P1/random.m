
function random(tf,Fm,n,nr)
	N=tf*Fm;
	% X1
	% Creem Fm numeros aleatoris de -1 a 1
	x1 = randn(N,1);

	%x2
	% Passem els numeros anteriors a 0 i 1
	x2=x1;
	x2=x2>=0;


	%X3
	% Creem un vector de llargada n nomes d'uns
	c=ones(n,1);
	% Numero d'iteracions
	k=N;
	% Creem un vector tot de 0's en el qual hi ficarem els valors
	x3=zeros(k,1);

	if (n==16)
		for i = 1:k
			% Fem les corresponents xors
			d=xor(c(end),c(end-2));
			d=xor(d,c(end-3));
			d=xor(d,c(end-5));
			% El valor resultant el guardem a x3
			x3(i)=d;
			% Creem el nou vector
			c=[d;c(1:end-1)];
		end
	elseif (n==10)
		for i = 1:k
			% En el cas de que n sigui 10 nomes fem la xor per el bit 10 i el 7.
			d=xor(c(end),c(end-3));
			x3(i)=d;
			c=[d;c(1:end-1)];
		end			
	end
	x4=zeros(nr*length(x3),1);
	for i = 1:nr
		x4(i:nr:end)=x3;
	end
		
%[X1,F]=f_TF(x1,Fm);
%[X2,F]=f_TF(x2-mean(x2),Fm);
[X3,F]=f_TF(x3-mean(x3),Fm);
%[X4,F]=f_TF(x4-mean(x4),Fm*nr);

	% Reproduim el sons

	play_so(x3,Fm), pause(1), play_so(x4,Fm*nr)
	%figure(1), plot(F,abs(X1))
	%figure(2), plot(F,abs(X2))
	figure(3), plot(F,abs(x3))
	%figure(4), plot(F,abs(x4))
%Conclusions
% Hem trobat que la Fm que m´es s'aproxima a obtenir soroll blanc es la de 48e3 Hz amb una n de 16, on n es la llargada del vector en bits.
%En el cas de que utilitzem una n de 10 creiem que el valor de Fm que mes s'aproxima al so del soroll blanc es de 24e3.







