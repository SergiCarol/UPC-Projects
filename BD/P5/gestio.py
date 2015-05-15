# -*- encoding: utf-8 -*-
import sqlite3


def create_db():
    """
    Crea una bases de dades, aquesta base de dades gestiona els nom i el numero de telefon de cada usuari
    """
    #canviar xarxa_social.db per el nomes que vulguis que tingui la db
    #db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    #Ficar la Base de Dades aqui
	#cursor.execute(''' CREATE TABLE IF NOT EXISTS usuaris (email TEXT PRIMARY KEY, nom TEXT, cognom TEXT, poblacio TEXT, dataNaixement DATA, imatge BLOB, pwd TEXT)''')
    db.commit()

    #AQUI FICAR ELS TRIGGERS

    cursor.execute(''' create trigger R1 BEFORE INSERT 
    				on BASE DE DADES AQUI
    				for each row
    				BEGIN
    					AQUI FICAR QUERY QUE MIRI SI EL TELEFON QUE S'HA FICATR JA EXISTEIX
    				END ''')

    db.close()


def insert_values(nom,numero):
    """ 
    Insereix valors a la base de dades.
    """
    #Aqui tambe tens que canviar el nom de la base de dades per el nom que has ficat a dalt
    #db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    #Els try son perque no peti si li afageixes un email que aj existeix (peta pero diu que no es pot inserir)
    try:
    	#Ficar els inserts aqui
        #cursor.execute(''' INSERT INTO usuaris (email,nom,cognom,poblacio,DataNaixement,imatge,pwd) VALUES(?,?,?,?,?,?,?) ''', (email,nom,cognom,poblacio,dataNaixement,sqlite3.Binary(readImage(path)),pwd))
        print "S'ha inserit correctament l'usuari"
        db.commit()
    except sqlite3.IntegrityError:
        #print Aqui ficar un print de error si hi ha un ususari repetit
        db.rollback()
    finally:
        db.close()

def modificar_values(nom,numero):
	#db = sqlite3.connect('xarxa_social.db')
	cursor = db.cursor()
	try:
		#cursor.execute()
		print "S'ha actualitzat l'usuari correctament"
		db.commit()
    except :
        #print Aqui ficar un print de error si hi ha un ususari repetit
        db.rollback()
    finally:
        db.close()

def delete_value(nom,numero):
	#db = sqlite3.connect('xarxa_social.db')
	cursor = db.cursor()
	try:
		#cursor.execute()
		print "S'ha eliminat l'usuari correctament"
		db.commit()
    except :
        #print Aqui ficar un print de error si hi ha un ususari repetit
        db.rollback()
    finally:
        db.close()