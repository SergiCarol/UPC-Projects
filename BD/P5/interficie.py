from Tkinter import*

win=Tk()
win.title('Gestio de contactes')
#Barre inserir contacte.
Label(win, text="NOM:").grid(row=0, column=0, sticky='e')
Entry(win, width=20).grid(row=0, column=1, padx=2, pady=2, sticky='we', columnspan=9)

Label(win, text="TELEFON:").grid(row=1, column=0, sticky='e')
Entry(win, width=20).grid(row=1, column=1, padx=2, pady=2, sticky='we', columnspan=9)
#Creacio de un frame.
myframe1 = Frame(win, bd=20, relief=SUNKEN)
myframe1.grid(row=2, column=0)
Label(myframe1, text='I am a Label widget').pack()
#Afegir 
mytext=Text(myframe1, height=10, width =40)
fhandle = open('contactes.sql')
lines = fhandle.read()
fhandle.close()
mytext.insert(END, lines)
#mytext.grid(row=3, column=0)

#Foto agenda.
#photo = PhotoImage(file='agenda.png')
#label = Label(win, image=photo)
#label.image = photo # keep a reference!
#label.pack()

win.mainloop()
