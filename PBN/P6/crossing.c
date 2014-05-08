#include "control.h"
#include "blck_serial.h"
#include "semaph.h"
#include "ether"
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
    a=readline(s,2);
    //Comprovem l'ordre forceA. 
    if ((s[0]=='F') && (s[1]=='A')){
      estat=control_get_state(StreetB);
      //Si el semafor B esta en ambar l'A ja es posa verd sol.
      if (estat == SemApproach){
	char j[]="COMERR";
	print(j);
      }
      else if (estat == SemOff){
        char j[]="Off";
        print (j);
      }
      else{
	//Forcem semafor A a CLEAR.
	control_force(StreetA);
	ether_put('F');
	ether_put('A');
	char j[]="OK";
	print(j);
      }
    }
    //Comprovem l'ordre forceB.
    else if ((s[0]=='F') && (s[1]=='B')){
      estat=control_get_state(StreetA);
      //Si el semafor B esta en ambar l'A ja es posa verd sol.
      if (estat == SemApproach){
	char j[]="COMERR";
	print(j);
      }
      else if (estat == SemOff){
        char j[]="Off";
        print (j);
      }
      else{
	//Forcem semafor B a CLEAR.
	control_force(StreetB);
	ether_put('F');
	ether_put('B');
	char j[]="OK";
	print(j);
      }
    }
    //Comprovem l'ordre stop.
    else if (s[0]=='H'){
      //Apagem el semafor.
      control_off();
      ether_put('H');
      char j[]="apagat";
      print(j);
    }
    //Comprovem l'ordre start.
    else if (s[0]=='R'){
      //Engegem semafor.
      control_on();
      ether_put('R');
      char j[]="control_on";
      print(j);
    }
    //Comprovem l'ordre stateA.
    else if ((s[0]=='?') && (s[1]=='A')){
      estat=control_get_state(StreetA);
      //Resposta per a cada estat.
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
    //Comprovem l'ordre stateB
    else if ((s[0]=='?') && (s[1]=='B')){
      estat=control_get_state(StreetB);
      //Resposta per a cada estat.
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
  }
  serial_close();
  return 0;
}
