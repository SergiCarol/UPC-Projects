# -*- encoding: utf-8 -*-
import sqlite3


def create_db():
    """
    Crea una bases de dades, aquesta base de dades gestiona els nom i el numero de telefon de cada usuari
    """
    #canviar xarxa_social.db per el nomes que vulguis que tingui la db
    db = sqlite3.connect('contacte.db')
    cursor = db.cursor()
    #Ficar la Base de Dades aqui
    
    cursor.execute(''' CREATE TABLE IF NOT EXISTS contacte (nom TEXT PRIMARY KEY,fix INT (9))''')
    db.commit()

    #AQUI FICAR ELS TRIGGERS

    cursor.execute(''' 
    create trigger R1 BEFORE INSERT on contacte
    FOR EACH ROW
    WHEN (fix = New.fix)
    begin
    DELETE from contacte WHERE Old.fix = fix; 
    end 
    ''')
    db.commit()
    db.close()


def insert_values(nom,numero):
    """ 
    Insereix valors a la base de dades.
    """
    db = sqlite3.connect('contacte.db')
    cursor = db.cursor()
    try:
        cursor.execute(''' INSERT INTO contacte (nom,fix) VALUES(?,?) ''', (nom,numero,))
        print "S'ha inserit correctament l'usuari"
        db.commit()
    except sqlite3.IntegrityError:
        #print Aqui ficar un print de error si hi ha un ususari repetit
        db.rollback()
    finally:
        db.close()

def modificar_values(nom,numero):
    db = sqlite3.connect('contacte.db')
    cursor = db.cursor()
    try:
        cursor.execute(''' UPDATE contatce SET fix = ? WHERE nom = ?''',(numero,nom))
        print "S'ha actualitzat l'usuari correctament"
        db.commit()
    except :
        #print Aqui ficar un print de error si hi ha un ususari repetit
        db.rollback()
    finally:
        db.close()

def delete_value(nom):
    db = sqlite3.connect('contacte.db')
    cursor = db.cursor()
    try:
        cursor.execute(''' DELETE from contacte WHERE nom = ?''',(nom,))
        print "S'ha eliminat l'usuari correctament"
        db.commit()
    except :
        #print Aqui ficar un print de error si hi ha un ususari repetit
        db.rollback()
    finally:
        db.close()


def show_number(nom):
    
    db = sqlite3.connect('contacte.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT fix FROM contacte WHERE nom = ?''',(nom,))
    tlf = cursor.fetchone()
    db.commit()
    db.close()
    return tlf[0]
