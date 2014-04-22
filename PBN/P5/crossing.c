#include "control.h"
#include "blck_serial.h"
#include "semaph.h"
//Creem variables unicament per aquest modul.
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
    //Comprovem l'ordre de forceA. 
    if ((s[0]=='A') && (s[1]=='_') && (s[2]=='o') && (s[3]=='n')){
      estat=control_get_state(StreetB);
      //Si el semafor B esta en ambar l'A ja es posa verd sol.
      if (estat == SemApproach){
	char j[]="nothing";
	print(j);
      }
      else{
	//Forcem semafor A a CLEAR.
	control_force(StreetA);
	char j[]="encesA";
	print(j);
      }
    }
    //Comprovem l'ordre de forceB.
    else if ((s[0]=='B') && (s[1]=='_') && (s[2]=='o') && (s[3]=='n')){
      estat=control_get_state(StreetA);
      //Si el semafor B esta en ambar l'A ja es posa verd sol.
      if (estat == SemApproach){
	char j[]="nothing";
	print(j);
      }
      else{
	//Forcem semafor B a CLEAR.
	control_force(StreetB);
	char j[]="encesB";
	print(j);
      }
    }
    
    else if ((s[0]=='S') && (s[1]=='o') && (s[2]=='f') && (s[3]=='f')){
      control_off();
      char j[]="apagat";
      print(j);
    }
    
    else if ((s[0]=='S') && (s[1]=='_') && (s[2]=='o') && (s[3]=='n')){
      control_on();
      char j[]="control_on";
      print(j);
    }
    
    else if ((s[0]=='A') && (s[1]=='v') && (s[2]=='a') && (s[3]=='l')){
      estat=control_get_state(StreetA);
      if (estat==SemOff){
	char j[]="El semafor A esta APAGAT";
	print(j);				
      }
      else if (estat==SemClear){
	char j[]="El semafor A esta VERD";
	print(j);				
      }
      else if (estat==SemApproach){
	char j[]="El semafor A esta AMBAR";
	print(j);				
      }
      else if (estat==SemStop){
	char j[]="El semafor A esta VERMELL";
	print(j);				
      }
      else {
	char j[]="Error:No s'ha trobat l'estat";
	print(j);
      }
    }
    
    else if ((s[0]=='B') && (s[1]=='v') && (s[2]=='a') && (s[3]=='l')){
      estat=control_get_state(StreetB);
      if (estat==SemOff){
	char j[]="El semafor B esta APAGAT";
	print(j);				
      }
      else if (estat==SemClear){
	char j[]="El semafor B esta VERD";
	print(j);				
      }
      else if (estat==SemApproach){
	char j[]="El semafor B esta AMBAR";
	print(j);				
      }
      else if (estat==SemStop){
	char j[]="El semafor B esta VERMELL";
	print(j);				
      }
      else {
	char j[]="Error:No s'ha trobat l'estat";
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
