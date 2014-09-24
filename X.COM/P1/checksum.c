#include <stdio.h>
#include <inttypes.h>
#include <stdbool.h>

typedef struct num{
	uint8_t a,b;
} numero;



uint8_t hex_to_byte (numero byte){
	numero num;
	uint8_t a,b;
	a = (byte.a>>4);
	b = byte.b & 0x0F;

	if (a>='0' & a<'10') a-=48;
	else a-=54;
	if (b>='0' & a<'10') b-=48;
	else b-=54;
	return (a|b);

}

numero byte_to_hex (uint8_t hex){
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


numero checksum(char j[]){
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
	num=byte_to_hex(a);
	return num; 

}

bool check_checksum(char j[]){
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
	// Suma normal
	if (a==0xFF) return true;
	else return false;
}


void main (void) {
	numero num;
	char j[64];
	printf("%s\n","Escriu alguna cosa: " );
	scanf("%s",j);
	num = checksum(j);
	// Fer proba del chech_checksum com??? hex_to_byte ; on afegir?
	printf("%c\n", num.a);
	printf("%c\n", num.b);


}

