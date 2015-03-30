# -*- encoding: utf-8 -*-
import sqlite3
import getpass
from PIL import Image
def create_db():
    """
    Crea dues bases de dades, una gestiona els usuaris i una altre gestiona les amistats entre aquets usuaris
    """
    try:
        db = sqlite3.connect('xarxa_social.db')
        cursor = db.cursor()
        cursor.execute(''' CREATE TABLE IF NOT EXISTS usuaris (email TEXT PRIMARY KEY, nom TEXT, cognom TEXT, poblacio TEXT, dataNaixement DATA, imatge BLOB, pwd TEXT)''')
        db.commit()
        cursor.execute(''' CREATE TABLE IF NOT EXISTS amistats (email1 TEXT, email2 TEXT, estat TEXT, PRIMARY KEY (email1,email2))''')
        db.commit()
        
    except EXCEPTION as e:
        print "La base de dades ja existeix"
        db.rollback()
        raise e
    finally:
        db.close()


def insert_values_usuaris(email,nom,cognom,poblacio,dataNaixement,path):
    """ 
    Insereix valors a la base de dades dels usuaris, com per exemple el email,nom,congom,poblacio
    data de Naixement i una foto de la qual se li te que ficar el path. A més a més demana 
    una contrasenya a cada usuari.
    """
    
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    
    pwd = getpass.getpass()
    try:
        cursor.execute(''' INSERT INTO usuaris (email,nom,cognom,poblacio,DataNaixement,imatge,pwd) VALUES(?,?,?,?,?,?,?) ''', (email,nom,cognom,poblacio,dataNaixement,sqlite3.Binary(readImage(path)),pwd))
        print "S'ha inserit correctament l'usuari"
        db.commit()
    except sqlite3.IntegrityError:
        print "Ja existeix aquest email"
        db.rollback()
    finally:
        db.close()
      
def insert_values_amistats(email1,email2,estat):
    """
    Fa el matex que la funcio anterior però per la base de dades de amistats
    """

    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    try:
        cursor.execute(''' INSERT INTO amistats (email1,email2,estat) VALUES(?,?,?) ''',(email1,email2,estat))
        print "S'ha inserit l'usuari correctament"
        db.commit()
    except sqlite3.IntegrityError:
        print "Aquesta amistat ja existeix"
        db.rollback()
    finally:
        db.close()

def show_all_usuaris():
    """
    Mostra per pantalla la informacio de tots els usuaris , a excepcio de la contrasenya
    """
    
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT email,nom,cognom,poblacio,dataNaixement FROM usuaris''')
    all_row = cursor.fetchall()
    for row in all_row:
        print ('{0} : {1} : {2} : {3} :  {4}'.format(row[0],row[1],row[2],row[3],row[4]))
    cursor.execute("SELECT imatge FROM usuaris LIMIT 1")
    data = cursor.fetchone()[0]
    writeImage(data)
    db.commit()
    db.close()

def show_all_amistats():
    """
    Mostra les amistats de tots els usuaris
    """
    
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT email1,email2,estat FROM amistats''')
    all_row = cursor.fetchall()
    for row in all_row:
        print ('{0} : {1} : {2}'.format(row[0],row[1],row[2]))
    db.commit()
    db.close()

def show_user_info(nom,cognom):
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT email,nom,cognom,poblacio,dataNaixement FROM usuaris WHERE nom = ? AND cognom = ?''',(nom,cognom,))
    all_row = cursor.fetchall()
    for row in all_row:
        print ('{0} : {1} : {2} : {3} :  {4}'.format(row[0],row[1],row[2],row[3],row[4]))
    cursor.execute("SELECT imatge FROM usuaris WHERE nom = ? AND cognom = ? LIMIT 1",(nom,cognom,))
    data = cursor.fetchone()[0]
    writeImage(data)
    db.commit()
    db.close()
        
def show_password(nom,cognom):
    """
    Mostra la contrasenya de un usuari especific
    """
    
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT pwd FROM usuaris WHERE nom = ? AND cognom = ?''',(nom,cognom))
    pwd = cursor.fetchone()
    print pwd[0]
    db.commit()
    db.close()

def select_email(nom,cognom):
    """
    Mostra el email de un usuari especific
    """
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT email FROM usuaris WHERE nom = ? AND cognom = ? ''',(nom,cognom,))
    email = cursor.fetchone()
    print email[0]
    db.commit()
    db.close()

def show_friends_from(nom,cognom):
    """
    Mostra els amics del usuari X
    """
    
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT nom,cognom FROM usuaris WHERE email IN (SELECT email2 FROM amistats WHERE email1 IN (SELECT email FROM usuaris WHERE nom = ? AND cognom = ?) AND estat = 'Acceptada') OR email IN (SELECT email1 FROM amistats WHERE email2 IN (SELECT email FROM usuaris WHERE nom = ? AND cognom = ?) AND estat = 'Acceptada')''',(nom,cognom,nom,cognom,)) 
    all_row = cursor.fetchall()
    for row in all_row:
        print ('{0} : {1} '.format(row[0],row[1]))
    db.commit()
    db.close()

def readImage(path):
    """
    Funcio de lectura de una imatge per tal de ficar-la amb un usuari
    """

    try:
        fin = open(path, "rb")
        img = fin.read()
        return img

    except IOError, e:
        print "Error %d: %s" % (e.args[0],e.args[1])
        sys.exit(1)

    finally:        
        if fin:
            fin.close()

def writeImage(data):
    """
    Funcio de escriptura de una imatge per tal de mostrarla a un usuari
    """

    try:
        fout = open('imatge.png','wb')
        fout.write(data)
        fout.close()
        im = Image.open('imatge.png')
        im.show()
    except IOError, e:    
        print "Error %d: %s" % (e.args[0], e.args[1])
        sys.exit(1)






#create_db()
#insert_values_usuaris('sergicarol35@gmail.com','Sergi','Carol Bosch','Sant Frutios de Bages',1994,'computer.png')
#insert_values_usuaris('enriclenard@gmail.com','Enric','Lenard Uro','Manresa',1994,'enric.jpg')
#show_all_usuaris()
#show_user_info('Enric','Lenard Uro')
#insert_values_amistats('sergicarol35@gmail.com','enriclenard@gmail.com','Acceptada')
#show_all_amistats()
#select_email('Sergi','Carol Bosch')
#show_friends_from('Sergi','Carol Bosch')
