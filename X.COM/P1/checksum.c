#include <stdio.h>
#include <inttypes.h>


typedef struct num{
	uint8_t a,b;
} numero;




numero hex_to_num (uint8_t hex){
	numero num;
	uint8_t a = (hex>>4);
	uint8_t b = hex & 0x0F;

	if (a>9 & a<=0x0F) a+=54;
	else a+=48;
	if (b>9 & 0x0F) b+=54;
	else b+=48;
	num.a=a;
	num.b=b;
	return num;

}


numero check_morse(char j[]){
	numero num;

	//en la 'a' guardarem la suma
	uint16_t a = 0x00;
	// en la b i ficarem el carry
	uint8_t b,i = 0x00;
	while (j[i] != '\0'){
		a+=j[i];
		i++; 
	}
	while (a>0xFF){
		b = (a >> 8);
		a&=0xFF;
		a+=b;
	}
	a=~a;		
	num=hex_to_num(a);
	return num; 

}

void main (void) {
	numero num;

	char j[] = "AAAAA";
	
	num = check_morse(j);
	printf("%c\n", num.a);
	printf("%c\n", num.b);


}

