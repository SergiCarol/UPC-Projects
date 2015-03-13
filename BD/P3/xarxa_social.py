import sqlite3

db = sqlite3.connect('data/xarxa')

cursor = db.cursor()

cursos.execute('''
		CREATE TABLE usuaris(email TEXT PRIMARY KEY,nom TEXT,cognom TEXT,poblacio TEXT,dataNeixement DATA,pwd TEXT))
		''')
cursor.execute('''
		CREATE TABLE amistats(email1 TEXT PRIMARY KEY,email2 TEXT PRIMARY KEY,estat TEXT)
		''')
db.commit()

users = [({'albert@pato.com':email1},{'Albert':nom1},{'Garcia':cognom1},{'Manresa':poblacio1},{'1994':dataNeixament1},{'1234':pwd1})]

cursor.execute('''
		INSERT INTO usuaris(email,nom,cognom,poblacio,dataNeixament,pwd)
		'''),users)
db.commit()