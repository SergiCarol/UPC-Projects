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


		
		if ((s[0]=='C') && (s[1]=='_') && (s[2]=='o') && (s[3]=='n')){
			control_on();
			char j[]="control_on";
			print(j);
		}
		else if ((s[0]=='F') && (s[1]=='o') && (s[2]=='r') && (s[3]=='a')){
			control_force(StreetA);
			char j[]="encesA";
			print(j);
		}
		else if ((s[0]=='C') && (s[1]=='_') && (s[2]=='o') && (s[3]=='f')){

			control_off();
			char j[]="apagat";
			print(j);

		}

		else if ((s[0]=='F') && (s[1]=='o') && (s[2]=='r') && (s[3]=='b')){

			control_force(StreetB);
			char j[]="encesB";
			print(j);
		}
		/*else if (a=="estatA"){

			estat=control_get_state(StreetA);
			
			if (estat==SemOff){
				char j[]="apagat-SemOff\r\n";
				print(j);				
			}
			else if (estat==SemClear){
				char j[]="verd-SemoClear\r\n";
				print(j);				
			}
			else if (estat==SemApproach){
				char j[]="ambar-SemoApproach\r\n";
				print(j);				
			}
			else if (estat==SemStop){
				char j[]="verd-SemoStop\r\n";
				print(j);				
			}
			else {
				char j[]="Error:_no_s'ha_trobat_el_estat\r\n";
				print(j);

			}
		}
		else if (a=="estatB"){

			estat=control_get_state(StreetA);
			
			if (estat==SemOff){
				char j[]="apagat-SemOff\r\n";
				print(j);				
			}
			else if (estat==SemClear){
				char j[]="verd-SemoClear\r\n";
				print(j);				
			}
			else if (estat==SemApproach){
				char j[]="ambar-SemoApproach\r\n";
				print(j);				
			}
			else if (estat==SemStop){
				char j[]="verd-SemoStop\r\n";
				print(j);				
			}
			else {
				char j[]="Error:_no_s'ha_trobat_el_estat\r\n";
				print(j);

			}
		}*/
		else{
			char j[]="fail";
			print (j);
		}
	}
	serial_close();
	return 0;
}