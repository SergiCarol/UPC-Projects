# -*- encoding: utf-8 -*-
import sqlite3


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
        print "Error al inserir l'usuari"
        db.rollback()
        db.close()
        return 1
    finally:
        db.close()
        return 0

def modificar_values(nom,numero_old,numero_new):
    db = sqlite3.connect('contacte.db')
    cursor = db.cursor()
    try:
        cursor.execute(''' UPDATE contacte SET fix = ? ,nom = ?  WHERE nom = ? AND fix = ?''',(numero_new,nom,nom,numero_old))
        print "S'ha actualitzat l'usuari correctament"
        db.commit()
    except :
        #print Aqui ficar un print de error si hi ha un ususari repetit
        print "Error al modificar l'usuari"
        db.rollback()
        db.close()
        return 1
        
    finally:
        db.close()
        return 0

def delete_value(nom,numero):
    db = sqlite3.connect('contacte.db')
    cursor = db.cursor()
    try:
        cursor.execute(''' DELETE from contacte WHERE nom = ? AND fix = ?''',(nom,numero,))
        print "S'ha eliminat l'usuari correctament"
        db.commit()
    except :
        #print Aqui ficar un print de error si hi ha un ususari repetit
        print "Error al eliminar l'usuari"
        db.rollback()
        db.close()
        return 1
    finally:
        db.close()
        return 0


def show_number(nom):
    """
    Aquesta funciona busca els numeros del usuari 'nom', retorna una tupla amb tots el numeros de
    telefon que té l'usuari registrats, la forma de visualitzar els numeros es tlf[i][0]
    """
    
    db = sqlite3.connect('contacte.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT fix FROM contacte WHERE nom = ?''',(nom,))
    tlf = cursor.fetchall()
    db.commit()
    db.close()
    return tlf

def ordena():
    db = sqlite3.connect('contacte.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT * FROM contacte ORDER BY nom ''')
    llistat = cursor.fetchall()
    db.commit()
    db.close()
    return llistat

def all_contacts():
    db = sqlite3.connect('contacte.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT * FROM contacte ''')
    llistat = cursor.fetchall()
    db.commit()
    db.close()
    return llistat
#-----------------------------------
#           PROVES AQUI
#-----------------------------------

if __name__=="__main__":
     # Funcio all contatcs, com agafar valors
    contacts = all_contacts()
    for row in contacts:
        print row[0], row[1]
    insert_values('qwer',123456789)
