# -*- encoding: utf-8 -*-
import sqlite3
import getpass
from PIL import Image
def create_db():
    """
    Crea dues bases de dades, una gestiona els usuaris i una altre gestiona les amistats entre aquets usuaris
    """
    #Nomes te que se cridada un cop
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    cursor.execute(''' CREATE TABLE IF NOT EXISTS usuaris (email TEXT PRIMARY KEY, nom TEXT, cognom TEXT, poblacio TEXT, dataNaixement DATA, imatge BLOB, pwd TEXT)''')
    db.commit()
    cursor.execute(''' CREATE TABLE IF NOT EXISTS amistats (email1 TEXT, email2 TEXT, estat TEXT, PRIMARY KEY (email1,email2))''')
    db.commit()
    db.close()


def insert_values_usuaris(email,nom,cognom,poblacio,dataNaixement,path,pwd):
    """ 
    Insereix valors a la base de dades dels usuaris, com per exemple el email,nom,congom,poblacio
    data de Naixement i una foto de la qual se li te que ficar el path. A més a més demana 
    una contrasenya a cada usuari.
    """
    
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    #Els try son perque no peti si li afageixes un email que aj existeix (peta pero diu que no es pot inserir)
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
    #Nomes tindria que ser cridada per el send_friend_request que ja fica el estat a pendent
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    try:
        cursor.execute(''' INSERT INTO amistats (email1,email2,estat) VALUES (?,?,?) ''',(email1,email2,estat,))
        #cursor.execute(''' INSERT INTO amistats (email1,email2,estat) VALUES(?,?,?) ''',(email1,email2,estat))
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
    """    
    cursor.execute("SELECT imatge FROM usuaris LIMIT 1")
    data = cursor.fetchone()[0]
    writeImage(data)
    """
    #Lo de sobre esta tret perque crec que nomes en mostra una , ho podria arreglar, pero fa falta? 10 ususaris = 10 fotos
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
    """
    Mostra la informacio de un usuari en concret
    """

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
    #Demanar password o algu??? nose

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
        print ('{0} {1} '.format(row[0],row[1]))
    db.commit()
    db.close()

def send_friend_request(email1,email2):
    """
    Envia una peticio de amistat de l'usuari amb email1 a l'usuari amb email2
    """
    # Fa falta o es fa directament desde el main????
    #Trobo tonto cridar nomes una funcio....
    #COMPROVAR QUE EL MAIL EXISTEIXI A USUARIS
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT nom FROM usuaris WHERE email = ? ''',(email1,))
    b = cursor.fetchone()
    cursor.execute(''' SELECT nom FROM usuaris WHERE email = ? ''',(email2,))
    a = cursor.fetchone()
    db.commit()
    db.close()
    if a != None and b != None:
        insert_values_amistats(email1,email2,'Pendent')
        insert_values_amistats(email2,email1,'Pendent')
    else:
        print 'Un de aquest correus no existeig'


def check_friend_request(email):
    """
    Comprova si hi ha alguna peticio d'amistat per resoldre i 
    en cas de que n'hi hagi, les resol
    """
    
    i = 0
    saps_llegir=False

    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()		
    cursor.execute(''' SELECT email1 FROM amistats WHERE email2 = ? AND estat = 'Pendent' ''',(email,))
    all_row = cursor.fetchall()

    # Comprovem si hi han soliciutds pendents    
    if len(all_row) > 0:
        for row in all_row:	
            print ('{0}' .format(all_row[i][0]))
            #Si el tiu no saps llegir es repeteix
            while (saps_llegir==False):
                ans = raw_input('Vols acceptar aquesta soliciut? (s/n)')
                # Lo que hi ha aqui sota es pot optimitzar crec
                if ans == 's':
                    cursor.execute(''' UPDATE amistats SET estat = 'Acceptada' WHERE email1 = ? AND email2 = ? ''',(all_row[i][0],email,))
                    
                    saps_llegir = True
                elif ans == 'n':
                    cursor.execute(''' UPDATE amistats SET estat = 'Rebutjada' WHERE email1 = ? AND email2 = ? ''',(all_row[i][0],email,))
                    
                    saps_llegir = True
                else:
                    print 'Tens que escriure s o n'
            i+=1
            saps_llegir=False
    else:
        print 'No tens solicituds pendents'
    db.commit()
    db.close()

def block_friend(email1,email2):
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT nom FROM usuaris WHERE email = ? ''',(email1,))
    b = cursor.fetchone()
    cursor.execute(''' SELECT nom FROM usuaris WHERE email = ? ''',(email2,))
    a = cursor.fetchone()
    if  a != None and b != None:
        #insert_values_amistats(email1,email2,'Rebutjada')
        cursor.execute(''' UPDATE amistats SET estat = 'Rebutjada' WHERE email1 = ? AND email2 = ? ''',(email1,email2,))
    else:
        print 'Aquest correus no existeigen'
    
    db.commit()
    db.close()


def unblock_friend(email1,email2):
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    cursor.execute(''' SELECT nom FROM usuaris WHERE email = ? ''',(email1,))
    b = cursor.fetchone()
    cursor.execute(''' SELECT nom FROM usuaris WHERE email = ? ''',(email2,))
    a = cursor.fetchone()
    if  a != None and b != None:
        cursor.execute(''' UPDATE amistats SET estat = 'Acceptada' WHERE email1 = ? AND email2 = ? ''',(email1,email2,))
    else:
        print 'Aquest correus no existeigen'
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
        #sys.exit(1)
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


#-----------------------
#*    Probes Aqui      *
#-----------------------

#create_db()
#insert_values_usuaris('sergicarol35@gmail.com','Sergi','Carol Bosch','Sant Frutios de Bages',1994,'computer.png')
#insert_values_usuaris('enriclenard@gmail.com','Enric','Lenard Uro','Manresa',1994,'enric.jpg')
#insert_values_usuaris('moni_33_33@gmail.com','Monica','Carol Bosch','Sant Frutios de Bages',1992,'computer.png')
#show_all_usuaris()
#show_user_info('Enric','Lenard Uro')
#send_friend_request('moni_33_33@gmail.com','enriclenard@gmail.com')
#send_friend_request('sergicarol35@gmail.com','enriclenard@gmail.com')
#send_friend_request('sergicarol35@gmail.com','moni_33_33@gmail.com')
#send_friend_request('moni_33_33@gmail.com','sergicarol35@gmail.com')
#send_friend_request('moni_3dsdffad_33@gmail.com','serfsafdsfd5@gmail.com')
#check_friend_request('sergicarol35@gmail.com')
#send_friend_request('sergicarol35@gmail.com','moni_33_33@gmail.com')
#show_all_amistats()
#select_email('Sergi','Carol Bosch')
#show_friends_from('Sergi','Carol Bosch')
#show_friends_from('Enric','Lenard Uro')
#block_friend('enriclenard@gmail.com','sergicarol35@gmail.com')
#unblock_friend('enriclenard@gmail.com','sergicarol35@gmail.com')
#show_all_amistats()
