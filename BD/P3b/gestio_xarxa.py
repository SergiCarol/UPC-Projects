import sqlite3


def create_db():
    try:
        db = sqlite3.connect('xarxa_social.db')
        cursor = db.cursor()
        cursor.execute(''' CREATE TABLE IF NOT EXISTS usuaris (email TEXT PRIMARY KEY, nom TEXT, cognom TEXT, poblacio TEXT, dataNaixement DATA, pwd TEXT)''')
        db.commit()
        cursor.execute(''' CREATE TABLE IF NOT EXISTS amistats (email1 TEXT, email2 TEXT, estat TEXT, PRIMARY KEY (email1,email2))''')
        db.commit()
        
    except EXCEPTION as e:
        db.rollback()
        raise e
    finally:
        db.close()


def insert_values_usuaris(email,nom,cognom,poblacio,dataNaixement):
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    # Aixo de aqui es te que canviar perque no faci echo
    pwd = raw_input('Introdueix la contrasenya')
    cursor.execute(''' INSERT INTO usuaris (email,nom,cognom,poblacio,DataNaixement,pwd) VALUES(?,?,?,?,?,?) ''', (email,nom,cognom,poblacio,dataNaixement,pwd))
    print "S'ha inserit correctament l'usuari"
    db.commit()
    db.close()
      
def insert_values_amistats(email1,email2,estat):
    db = sqlite3.connect('xarxa_social.db')
    cursor = db.cursor()
    cursor.execute(''' INSERT INTO amistats (email1,email2,estat) VALUES(?,?,?) ''',(email1,email2,estat))
    print "S'ha inserit l'usuari correctament"
    db.commit()
    db.close()

create_db()

