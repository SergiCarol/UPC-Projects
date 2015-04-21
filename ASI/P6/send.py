import subprocess
import os

def enviar():
	mail='mail -s "Formulari" mail1@g2.asi.itic.cat < /home/shared-stuff/data.txt'	
	subprocess.Popen(mail,shell=True)


def envoriment_var():
        navegador = os.environ["HTTP_USER_AGENT"]
        ip = os.environ["REMOTE_ADDR"]
        return [navegador,ip]
