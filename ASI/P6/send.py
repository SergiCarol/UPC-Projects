import subprocess
import os

def enviar():
        #Creem la estructura del mail
	mail='mail -s "Formulari" mail1@g2.asi.itic.cat < /home/shared-stuff/data.txt'	
        # Enviem el mail
	subprocess.Popen(mail,shell=True)


def envoriment_var():
        # Agafem el navegador i el OS
        navegador = os.environ["HTTP_USER_AGENT"]
        #Agafem la IP
        ip = os.environ["REMOTE_ADDR"]
        return [navegador,ip]
