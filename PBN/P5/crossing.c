#include "control.h"
#include "blck_serial.h"
#include "semaph.h"

static semaph_t sem;
static semaph_state_t estat;

int main(void){
  DDRD=0xFF;
  uint8_t a;
  char s[20];
  control_init();
  serial_open();
  while (1){
    a=readline(s,4);
    
    if ((s[0]=='A') && (s[1]=='_') && (s[2]=='o') && (s[3]=='n')){
      estat=control_get_state(StreetB);
      if (estat == SemApproach){
	char j[]="nothing";
	print(j);
      }
      else{
	control_force(StreetA);
	char j[]="encesA";
	print(j);
      }
    }
    else if ((s[0]=='B') && (s[1]=='_') && (s[2]=='o') && (s[3]=='n')){
      estat=control_get_state(StreetA);
      if (estat == SemApproach){
	char j[]="nothing";
	print(j);
      }
      else{
	control_force(StreetA);
	char j[]="encesB";
	print(j);
      }
    }
    
    else if ((s[0]=='o') && (s[1]=='f') && (s[2]=='f')){
      control_off();
      char j[]="apagat";
      print(j);
    }
    
    else if ((s[0]=='o') && (s[1]=='n')){
      control_on();
      char j[]="control_on";
      print(j);
    }
    
    else if ((s[0]=='A') && (s[1]=='v') && (s[2]=='a') && (s[3]=='l')){
      estat=control_get_state(StreetA);
      if (estat==SemOff){
	char j[]="El semafor A esta APAGAT\r\n";
	print(j);				
      }
      else if (estat==SemClear){
	char j[]="El semafor A esta VERD\r\n";
	print(j);				
      }
      else if (estat==SemApproach){
	char j[]="El semafor A esta AMBAR\r\n";
	print(j);				
      }
      else if (estat==SemStop){
	char j[]="El semafor A esta VERMELL\r\n";
	print(j);				
      }
      else {
	char j[]="Error:No s'ha trobat l'estat\r\n";
	print(j);
      }
    }
    
    else if (a=="estatB"){
      estat=control_get_state(StreetB);
      if (estat==SemOff){
	char j[]="El semafor B esta APAGAT\r\n";
	print(j);				
      }
      else if (estat==SemClear){
	char j[]="El semafor B esta VERD\r\n";
	print(j);				
      }
      else if (estat==SemApproach){
	char j[]="El semafor B esta AMBAR\r\n";
	print(j);				
      }
      else if (estat==SemStop){
	char j[]="El semafor B esta VERMELL\r\n";
	print(j);				
      }
      else {
	char j[]="Error:No s'ha trobat l'estat\r\n";
	print(j);
      }
    }
    
    else{
      char j[]="fail";
      print (j);
    }
  }
  serial_close();
  return 0;
}
