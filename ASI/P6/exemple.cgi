#!/usr/bin/python
# -*- encoding:utf-8 -*-

import cgi
import cgitb
import send

cgitb.enable()
form = cgi.FieldStorage()

f = open("/home/shared-stuff/data.txt",'w')
f.write("Usuari: " + form["Nom d’usuari"].value)
f.write("\n")
f.write("Contrasenya: " + form["password"].value)
f.write("\n")
f.write("Correu: " + form["correu"].value)
f.write("\n")
try:
	a = form["comentari"].value
except:
	a = " "
	
f.write("Comentari: " + a)
f.close()

send.enviar()

print "Content-Type:text/html" #Diem que lo que ve es html
print "Content-Language:ca"
print  #Final dels headers

print '<html>'
print '<head>'
print '<meta charset="utf-8"/>'
print '<title> Proba exemple </title>'
print '</head>'
print '<body>'
print '<p>Hola això és una proba</p>'
print '<b>Password:</b>' + form["password"].value + "<br>"
print '<b>Correu: </b>' + form["correu"].value + "<br>"
print '<b>Nom: </b>' + form["Nom d’usuari"].value + "<br>"
print '</body>'
print '</html>'


