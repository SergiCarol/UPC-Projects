# -*- encoding: utf-8 -*-
from sqlite3 import*
from Tkinter import*
import ttk
import gestio

#---FUNCIONS---
#Funcio actualitza taula.
def actualitza():
    iids=llista.get_children()
    for i in iids:
        llista.delete(i)
    l=gestio.all_contacts()
    for row in l:
        llista.insert('','end',values=(row[0],row[1]))

#Funcio ordena la llista.
def ordena():
    iids=llista.get_children()
    for i in iids:
        llista.delete(i)
    l=gestio.ordena()
    for row in l:
        llista.insert('','end',values=(row[0],row[1]))

#Funcio de busqueda.
def busca():
    ordena()
    b=entradaBus.get()
    iids=llista.get_children()
    for i in iids:
        item=llista.item(i)
        nom= item['values'][0]
        tel= item['values'][1]
        if nom==b or str(tel)==b:
            for x in iids:
                llista.delete(x)
            llista.insert('','end',values=(nom,tel))
            #llista.selection_add(i)
            msg["text"]="S'ha trobat el contacte"
            break
    else:
        msg["text"]="Aquest contacte no existeix"
#Funcio agrega a la llista.
def agregar():
    if entradaNom.get()!='' and entradaTel.get()!='':
        gestio.insert_values(entradaNom.get(),entradaTel.get())
        ordena()
        msg["text"]="Afegit contacte %s" %entradaNom.get()
        entradaNom.set("")
        entradaTel.set("")
    else:
        msg["text"]="Afegeixi un contacte nou"

#Funcio modificar valor.
def modifica(t,i):
    if t!="":
        item=llista.item(i)
        nom= item['values'][0]
        tel= item['values'][1]
        gestio.modificar_values(nom,tel,t)
        ordena()
        msg["text"]="Contacte %s modificat" %nom
        ventana_edit.destroy()
    else:
        msg["text"]="Afegeixi un telefon nou"   

#Funcio eliminar de la llista.
def elimina():
    iid=llista.focus()
    if iid!="":
        item=llista.item(iid)
        nom= item['values'][0]
        tel= item['values'][1]
        gestio.delete_value(nom,tel)
        ordena()
        msg["text"]="Contacte %s eliminat" %nom
    else:
        msg["text"]="Seleccioni un contacte"

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
#Quadre d'entrada de text
recuadre=LabelFrame(ventana,text="Nou Registre",fg="blue",width=225,height=105).place(x=230,y=70)
lblNom=Label(ventana,text="Nom:",fg="blue").place(x=235,y=90)
lblTel=Label(ventana,text="Telèfon:",fg="blue").place(x=235,y=115)
#lblBus=Label(ventana,text="Buscar:",fg="blue").place(x=0,y=226)
entradaNom=StringVar()
entradaTel=StringVar()
entradaBus=StringVar()
txtNom=Entry(ventana,textvariable=entradaNom,width=19).place(x=285,y=90)
txtTel=Entry(ventana,textvariable=entradaTel,width=19).place(x=285,y=115)
txtBus=Entry(ventana,textvariable=entradaBus,width=17).place(x=300,y=202)
#Boto AGREGAR
btnAgregar=Button(ventana,text="Afegeix Contacte",fg="blue",width=10,command=agregar).place(x=335,y=140)
#Boto MOSTRA
btnMostrar=Button(ventana,text="Mostrar",fg="blue",comman=ordena).place(x=0,y=226)
#Boto BUSCAR
btnBuscar=Button(ventana,text="Buscar",fg="blue",comman=busca).place(x=230,y=198)
#Boto ELIMINAR
btnEliminar=Button(ventana,text="Eliminar Seleccionat",fg="blue",command=elimina).place(x=0,y=375)
#Boto EDITAR
btnEditar=Button(ventana,text="Modificar Seleccionat",fg="blue",command=edita).place(x=240,y=375)
#Boto SORTIR
btnSalir=Button(ventana,text="Sortir",fg="blue",command=ventana.quit).place(x=464,y=375)

#Omplim la llista
ordena()

#Loop per arrencar.
ventana.mainloop()
