# -*- encoding: utf-8 -*-
from sqlite3 import*
from Tkinter import*
import tkMessageBox

win=Tk()
win.title('Gestio de contactes')

#Barre inserir contacte.
nom_t=Label(win, text="Nom:").grid(row=0, column=10, sticky='e')
nom_r=Entry(win, width=20).grid(row=0, column=11)

telf_t=Label(win, text="Teléfon:").grid(row=1, column=10, sticky='e')
telf_r=Entry(win, width=20).grid(row=1, column=11)


#Funcio demana si vols continuar amb l'operacio.
def pregunta(n):
    if n==0:
        tkMessageBox.showinfo( "Pregunta", "Estas segur que vols afegir el contacte?")
    if n==1:
        tkMessageBox.showinfo( "Pregunta", "Estas segur que vols eliminar el contacte?")
    if n==2:
        tkMessageBox.showinfo( "Pregunta", "Estas segur que vols sortir?")
        sortir=Button(win, text="jesus", command=win.destroy).grid(row=10, column=8)
   
    
#Botons
afegir=Button(win, text="Afegir Contacte", activeforeground="blue", command=pregunta(0)).grid(row=6, column=15)
mostrar=Button(win, text="Mostrar Contactes", activeforeground="blue", command=pregunta(0)).grid(row=8, column=1)
eliminar=Button(win, text="Eliminar seleccionat", command=pregunta(1)).grid(row=10, column=1)
editar=Button(win, text="Modificar seleccionat").grid(row=10, column=4)
sortir=Button(win, text="Sortir", command=win.destroy).grid(row=10, column=8)

#Quadre contactes



#Creacio de un frame.
#myframe1 = Frame(win, bd=20, relief=SUNKEN)
#myframe1.grid(row=2, column=0)
#Label(myframe1, text='I am a Label widget').pack()
#Afegir 
#mytext=Text(myframe1, height=10, width =40)
#fhandle = open('contactes.sql')
#lines = fhandle.read()
#fhandle.close()
#mytext.insert(END, lines)
#mytext.grid(row=3, column=0)



win.mainloop()
