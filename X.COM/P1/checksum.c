#include <stdio.h>
#include <inttypes.h>


typedef struct num{
	uint8_t a,b; // numero
} numero;



uint8_t check_morse(char j[]){

	uint8_t i;
	//en la 'a' guardarem la suma
	uint16_t a = 0x00;
	// en la b i ficarem el carry
	uint8_t b = 0x00;
	while (j[i] != '\0'){
		a+=j[i];
		i++; 
	}

	while (a>0xFF){
		b = (a >> 8);
		a&=0xFF;
		a+=b;
	}
	printf("%c\n",a );
	a=~a;		
	return a; 

}

numero hex_to_num (uint8_t hex){
	numero num;
	num.a = (hex>>4);
	num.b = hex & 0x0F;
	return num;
}

void main (void) {
	uint8_t a;
	numero num;

	char j[] = "AAAAA";
	
	a = check_morse(j);
	printf("%c\n",a);
	num = hex_to_num(a);
	printf("%d\n", num.a);
	printf("%d\n", num.b);


}