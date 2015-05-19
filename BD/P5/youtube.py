# -*- encoding: utf-8 -*-
from sqlite3 import*
from Tkinter import*
#---FUNCIONS---
#Funcio agrega a la llista.
def agregar():
    if entradaNom.get()!='' and entradaTel.get()!='':
        lstMaterias.insert(END,entradaNom.get())
        entradaNom.set("")
        entradaTel.set("")
#Funcio eliminar de la llista.
def elimina():
    seleccionat=lstMaterias.curselection()
    lstMaterias.delete(seleccionat)

#---INTERFICIE---
ventana=Tk()
ventana.geometry("525x400+0+0")
ventana.title("Dipse Gestor de Contactes")
#Crear una imatge.
imagenL=PhotoImage(file="dipse.gif")
lblImagen=Label(ventana,image=imagenL).place(x=0,y=0)
#Creem una etiqueta
lblMaterias=Label(ventana,text="Materias:").place(x=40,y=250)
#Creacio de una llista
lstMaterias=Listbox(ventana,width=50,height=6)
lstMaterias.insert(0,"Programacion Basica")
lstMaterias.insert(1,"Programacion de Objetos")
lstMaterias.insert(2,"Ojetos uytre")
lstMaterias.insert(3,"Erfer Ojetos uytre")
#Eliminar element llista
#lstMaterias.delete(2)
lstMaterias.place(x=40,y=270)
#Quadre d'entrada de text
recuadre=LabelFrame(ventana,text="Nou Registre",fg="blue",width=225,height=105).place(x=230,y=70)
lblNom=Label(ventana,text="Nom:",fg="blue").place(x=235,y=90)
lblTel=Label(ventana,text="Telèfon:",fg="blue").place(x=235,y=115)
entradaNom=StringVar()
entradaTel=StringVar()
txtNom=Entry(ventana,textvariable=entradaNom,width=19).place(x=285,y=90)
txtTel=Entry(ventana,textvariable=entradaTel,width=19).place(x=285,y=115)
#Boto AGREGAR
btnAgregar=Button(ventana,text="Afegeix Contacte",fg="blue",width=10,command=agregar).place(x=335,y=140)
#Boto MOSTRAR
btnMostrar=Button(ventana,text="Mostrar Contactes",fg="blue").place(x=0,y=226)
#Boto ELIMINAR
btnEliminar=Button(ventana,text="Eliminar Seleccionat",fg="blue",command=elimina).place(x=0,y=370)
#Boto EDITAR
btnEditar=Button(ventana,text="Modificar Seleccionat",fg="blue").place(x=240,y=370)
#Boto SORTIR
btnSalir=Button(ventana,text="Sortir",fg="blue",command=ventana.quit).place(x=464,y=370)


#Loop per arrencar.
ventana.mainloop()
