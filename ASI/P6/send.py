import subprocess

def enviar():
	mail='mail -s "Formulari" mail1@g2.asi.itic.cat < /home/shared-stuff/data.txt'	
	subprocess.Popen(mail,shell=True)


