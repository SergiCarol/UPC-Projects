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
        print "Error al modificar l'usuari"
        db.rollback()
        db.close()
        return 1
    finally:
        db.close()

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

def delete_value(nom):
    db = sqlite3.connect('contacte.db')
    cursor = db.cursor()
    try:
        cursor.execute(''' DELETE from contacte WHERE nom = ?''',(nom,))
        print "S'ha eliminat l'usuari correctament"
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

#-----------------------------------
#           PROVES AQUI
#-----------------------------------

if __name__=="__main__":
    insert_values('Dani',123456789)
    all_row = show_number('Dani')
    # Com mirar el return de show_number
    #-----------------------------
    #for i in all_row:
    #    print i[0]
    #-----------------------------
    insert_values('Sergi',123456789)
    modificar_values('Sergi',123456789,609391233)
    print 'Sergi'
    telf = show_number('Sergi')
    for i in telf:
        print i[0]
    modificar_values('Dani',123456789,609391233)
    telf = show_number('Dani')
    print 'Dani:'
    for i in telf:
        print i[0]    
