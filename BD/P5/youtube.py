# -*- encoding: utf-8 -*-
from sqlite3 import*
from Tkinter import*
import ttk
#---FUNCIONS---
#Funcio agrega a la llista.
def agregar():
    msg["text"]=""
    if entradaNom.get()!='' and entradaTel.get()!='':
        llista.insert('','end',values=(entradaNom.get(),entradaTel.get()))
        msg["text"]="Afegit contacte %s" %entradaNom.get()
        entradaNom.set("")
        entradaTel.set("")

#Funcio modificar valor.
def modifica(t,i):
    if t!="":
        llista.set(i,column="Telefons",value=t)
        item=llista.item(i)
        msg["text"]="Contacte %s modificat" %item['values'][0]
        ventana_edit.destroy()
    else:
        msg["text"]="Afegeixi un telefon nou"   
#Funcio eliminar de la llista.
def elimina():
    msg["text"]=""
    iid=llista.focus()
    item=llista.item(iid)
    msg["text"]="Contacte %s eliminat" %item['values'][0]
    llista.delete(iid)
    #gestio.delete_value(selecccionat)

#Funcio que modifica un contacte.
def edita():
    global ventana_edit
    iid=llista.focus()
    item=llista.item(iid)
    if iid!="":
        ventana_edit=Tk()
        Label(ventana_edit, text="Name:",fg="blue").grid(row=0, sticky=W)
        Label(ventana_edit, text="Telèfon antic:",fg="blue").grid(row=1, sticky=W)
        Label(ventana_edit, text="Nou telèfon:",fg="blue").grid(row=2, sticky=W)
        nom=Entry(ventana_edit)
        nom.insert(0,item["values"][0])
        nom.config(state='readonly')
        nom.grid(row=0, column=1, sticky=E)
        tel=Entry(ventana_edit)
        tel.insert(0,item["values"][1])
        tel.config(state='readonly')
        tel.grid(row=1, column=1, sticky=E)
        nouTel=StringVar()
        nou=Entry(ventana_edit,textvariable=nouTel)
        nou.grid(row=2, column=1, sticky=E)
        Button(ventana_edit, text="Modificar contacte",fg="blue",comman=lambda:modifica(nou.get(),iid)).grid(row=3, column=1, sticky=E)
        
    else:
        msg["text"]="Seleccioni un contacte"
#---INTERFICIE---
ventana=Tk()
ventana.geometry("525x405+0+0")
ventana.title("Dipse Gestor de Contactes")
#Crear una imatge.
imagenL=PhotoImage(file="dipse.gif")
lblImagen=Label(ventana,image=imagenL).place(x=0,y=0)
#Llista doble
llista=ttk.Treeview(ventana,selectmode="browse",height=5)
llista["columns"]=("Nom","Telefons")
llista.column("Nom",width=200)
llista.column("Telefons",width=200)
llista.column('#0',stretch=NO,minwidth=0,width=0)
llista.heading("Nom",text="Nom")
llista.heading("Telefons",text="Telefons")
llista.insert('','end',values=("Enric Lenard","111111111"))
llista.place(x=40,y=255)
#Creem el missatge
msg=Label(ventana,text='',fg='red')
msg.place(x=230,y=230)
#Creacio de una llista
#lstMaterias=Listbox(ventana,width=50,height=6)
#lstMaterias.insert(0,"Programacion Basica")
#lstMaterias.insert(1,"Programacion de Objetos")
#lstMaterias.insert(2,"Ojetos uytre")
#lstMaterias.insert(3,"Erfer Ojetos uytre")
#Eliminar element llista
#lstMaterias.delete(2)
#lstMaterias.place(x=40,y=270)
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
btnEliminar=Button(ventana,text="Eliminar Seleccionat",fg="blue",command=elimina).place(x=0,y=375)
#Boto EDITAR
btnEditar=Button(ventana,text="Modificar Seleccionat",fg="blue",command=edita).place(x=240,y=375)
#Boto SORTIR
btnSalir=Button(ventana,text="Sortir",fg="blue",command=ventana.quit).place(x=464,y=375)


#Loop per arrencar.
ventana.mainloop()
