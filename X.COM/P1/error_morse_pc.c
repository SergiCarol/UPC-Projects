#include "error_morse_pc.h"



static uint8_t hex_to_byte (numero byte){
  // FUNCIONA
  numero num;
  uint8_t a,b;
  if (byte.a>='0' & byte.a<='9') byte.a-=48;
  else byte.a-=55;
  if (byte.b>='0' & byte.b<='9') byte.b-=48;
  else byte.b-=55;
  a = (byte.a<<4); // 0xB0
  b = byte.b & 0x0F; // 0x09
  a&=0xF0;
  printf("Part alta %d\n",a );
  printf("Part baixa %d\n",b );
  return (a|b);
}

static numero byte_to_hex (uint8_t hex){
  numero num;
  uint8_t a = (hex>>4);
  uint8_t b = hex & 0x0F;
  if (a>9 & a<=0x0F) a+=55;
  else a+=48;
  if (b>9 & b<=0x0F) b+=55;
  else b+=48;
  num.a=a;
  num.b=b;
  return num;
  
}


numero checksum(uint8_t j[]){
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
  printf("VALOR CHECHSUM: %d\n",a );
  a=~a;		
  num=byte_to_hex(a);
  return num; 
  
}

bool check_checksum(uint8_t j[]){
   numero num;
  //en la 'a' guardarem la suma
  // en la b i ficarem el carry
  uint8_t a,b,i = 0x00;
  while (j[i] != '\0'){
    i++; 
  }
  num.a=j[--i];
  num.b=j[--i];  
  a=hex_to_byte(num);
  j[i++]=a;
  j[i]='\0';
  i=0;
  num=checksum(j);
  b=hex_to_byte(num);

  if (b==0x00) return true;
  else return false;
}
/*
numero crc_morse(char j[]){
	uint8_t crc,i = 0;
	for(i=0;i!='\0';i++){
		crc=_crc_ibutton_update(crc,j[i]);
	}
	return byte_to_hex(crc);
}
*/
uint8_t main (void) {
  numero num;
  uint8_t i=0,a;
  bool state;
  char j[64];
  printf("%s\n","Escriu alguna cosa: " );
  scanf("%s",j);
  num = checksum(j);
  printf("Caracter checksum: %c\n", num.a);
  printf("Caracter checksum: %c\n", num.b);
  while(j[i]!='\0'){
    i++;
  }
  j[i++] = num.b;
  j[i++] = num.a;
  j[i++] = '\0';
  //-----------------------------------
  state = check_checksum(j);
  if (state == true)
    {
      printf("%s\n","Cert" );	
    }
  else printf("%s\n","Fals" );
  return 1; 
  
}

