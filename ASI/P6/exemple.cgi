#!/usr/bin/python
# -*- encoding:utf-8 -*-

import cgi
import cgitb
import send

cgitb.enable()
form = cgi.FieldStorage()
#Agafem les variables de entorn
env = send.envoriment_var()
#Obrim un fitxer en mode escriptura
f = open("/home/shared-stuff/data.txt",'w')
s = open("/home/shared-stuff/dades.dat",'a')
#Escribim les dades
f.write("Client " + str(env[0]))
f.write("\n")
f.write("IP " + str(env[1]))
f.write("\n")
#Aquest try's estan aqui per tal de evitar que el servidor peti si entrem la URL directament
try:
	usr = form["Nom d’usuari"].value
except:
	usr = " "
f.write("Usuari: " + usr)
f.write("\n")
try:
	pss = form["password"].value
except:
	pss = " "
f.write("Contrasenya: " + pss)
f.write("\n")
try:
	m = form["correu"].value
except:
	m = " "
f.write("Correu: " + m)
f.write("\n")

try:
	a = form["comentari"].value
except:
	a = " "
	
f.write("Comentari: " + a)
f.close()
#Si no hi ha usuari (hem entrar la url directament) no enviem un correu
if usr != " ":
	send.enviar()

s.write("Client " + str(env[0]))
s.write("\n")
s.write("IP " + str(env[1]))
s.write("\n")
s.write("Usuari: " + usr)
s.write("\n")
s.write("Contrasenya: " + pss)
s.write("\n")
s.write("Correu: " + m)
s.write("\n")
s.write("Comentari: " + a)
s.write("\n")
s.close()

#Codi HTML
print "Content-Type:text/html" #Diem que lo que ve es html
print "Content-Language:ca"
print  #Final dels headers

print '<html>'
print '<head>'
print '<meta charset="utf-8"/>'
print '<meta http-equiv="refresh" content="5;url=http://form.g2.asi.itic.cat/" />'
print '<title> Resposta formulari </title>'
print '</head>'
print '<body>'
print '<h>DADES</h>'
print '<p>Has completat el formulari correctament</p>'
print '<b>Correu: </b>' + m + "<br>"
print '<b>Nom: </b>' + usr + "<br>"
if a!=" ":
       print '<b>Comentari: </b>' + a + "<br>"
print '<i> Despres de 5 seg. tornara a la pàgina dinici </i>'
print '</body>'
print '</html>'


