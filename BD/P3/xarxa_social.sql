
CREATE TABLE IF NOT EXISTS usuaris(email TEXT PRIMARY KEY,nom TEXT,cognom TEXT,poblacio TEXT,dataNaixement DATA,pwd TEXT);

CREATE TABLE IF NOT EXISTS amistats(email1 TEXT,email2 TEXT,estat TEXT,PRIMARY KEY (email1, email2));

INSERT INTO usuaris (email,nom,cognom,poblacio,dataNaixement,pwd) VALUES ('sergicarol35@gmail.com','Sergi','Carol','Sant Fruitos de Bages',1994,'1234');
INSERT INTO usuaris (email,nom,cognom,poblacio,dataNaixement,pwd) VALUES ('enriclenard@gmail.com','Enric','Lenard','Manresa',1994,'Correcalles');
INSERT INTO usuaris (email,nom,cognom,poblacio,dataNaixement,pwd) VALUES ('albert@gmail.com','Albert','Martin','Sant Fruitos de Bages',1991,'12');
INSERT INTO usuaris (email,nom,cognom,poblacio,dataNaixement,pwd) VALUES ('joanalbets@gmail.com','Joan','Albets','Manresa',2001,'123456');
INSERT INTO usuaris (email,nom,cognom,poblacio,dataNaixement,pwd) VALUES ('peregarcia@gmail.com','Pere','Garcia','Manresa',1990,'nope');
INSERT INTO usuaris (email,nom,cognom,poblacio,dataNaixement,pwd) VALUES ('jordialba@gmail.com','Jordi','Alba','Barcelona',1997,'sep');
INSERT INTO usuaris (email,nom,cognom,poblacio,dataNaixement,pwd) VALUES ('annavidella@nose.com','Anna','Vidella','Sant Fruitos de Bages',1991,'1234');
INSERT INTO usuaris (email,nom,cognom,poblacio,dataNaixement,pwd) VALUES ('bertacapdavila@nose.com','Berta','Capdevila','Navarcles',1994,'1234');
INSERT INTO usuaris (email,nom,cognom,poblacio,dataNaixement,pwd) VALUES ('jorditorres@nose.com','Jordi','Torres','Cardona',1989,'12345673');

INSERT INTO amistats (email1,email2,estat) VALUES ('sergicarol35@gmail.com','enriclenard@gmail.com','Acceptada');
INSERT INTO amistats (email1,email2,estat) VALUES ('albert@gmail.com','joanalbets@gmail.com','Acceptada');
INSERT INTO amistats (email1,email2,estat) VALUES ('peregarcia@gmail.com','bertacapdavila@nose.com','Acceptada');
INSERT INTO amistats (email1,email2,estat) VALUES ('sergicarol35@gmail.com','jordialba@gmail.com','Acceptada');
INSERT INTO amistats (email1,email2,estat) VALUES ('bertacapdavila@nose.com','jordialba@gmail.com','Rebutjada');
INSERT INTO amistats (email1,email2,estat) VALUES ('sergicarol35@gmail.com','annavidella@nose.com','Acceptada');
INSERT INTO amistats (email1,email2,estat) VALUES ('peregarcia@gmail.com','jorditorres@nose.com','Rebutjada');
INSERT INTO amistats (email1,email2,estat) VALUES ('peregarcia@gmail.com','sergicarol35@gmail.com@gmail.com','Rebutjada');
INSERT INTO amistats (email1,email2,estat) VALUES ('peregarcia@gmail.com','enriclenard@gmail.com','Acceptada');
INSERT INTO amistats (email1,email2,estat) VALUES ('peregarcia@gmail.com','albert@gmail.com','Rebutjada');
INSERT INTO amistats (email1,email2,estat) VALUES ('annavidella@nose.com','bertacapdavila@nose.com','Acceptada');
INSERT INTO amistats (email1,email2,estat) VALUES ('sergicarol35@gmail.com','peregarcia@gmail.com','Acceptada');
INSERT INTO amistats (email1,email2,estat) VALUES ('annavidella@nose.com','peregarcia@gmail.com','Acceptada');
INSERT INTO amistats (email1,email2,estat) VALUES ('jordialba@gmail.com','annavidella@nose.com','Rebutjada');
INSERT INTO amistats (email1,email2,estat) VALUES ('annavidella@nose.com','sergicarol35@gmail.com','Rebutjada');
