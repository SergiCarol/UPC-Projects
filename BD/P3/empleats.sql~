CREATE TABLE IF NOT EXISTS empleat(id_empleat INT PRIMARY KEY, carrer TEXT, ciutat TEXT);
CREATE TABLE IF NOT EXISTS feina(id_empleat INT PRIMARY KEY, id_empresa INT, salari INT);
CREATE TABLE IF NOT EXISTS empresa(id_empresa INT PRIMARY KEY, ciutat TEXT);
CREATE TABLE IF NOT EXISTS manager(id_empleat INT PRIMARY KEY, id_empleat_coordinador INT);

INSERT INTO empleat(id_empleat,carrer,ciutat) VALUES (123,'Bases de Manres','Manresa');
INSERT INTO empleat(id_empleat,carrer,ciutat) VALUES (22,'Albeniz','Sant Fruitos de Bages');
INSERT INTO empleat(id_empleat,carrer,ciutat) VALUES (1235,'Guimera','Manresa');
INSERT INTO empleat(id_empleat,carrer,ciutat) VALUES (1236,'Carretera de Vic','Sant Fruitos de Bages');
INSERT INTO empleat(id_empleat,carrer,ciutat) VALUES (1237,'Bases de Manres','Manresa');
INSERT INTO empleat(id_empleat,carrer,ciutat) VALUES (1238,'Passeig Pere 3','Manresa');
INSERT INTO empleat(id_empleat,carrer,ciutat) VALUES (1239,'Carretera de Cardona','Manresa');


INSERT INTO feina(id_empleat,id_empresa,salari) VALUES (123,12,1000);
INSERT INTO feina(id_empleat,id_empresa,salari) VALUES (22,12,2000);
INSERT INTO feina(id_empleat,id_empresa,salari) VALUES (1238,12,4000);
INSERT INTO feina(id_empleat,id_empresa,salari) VALUES (1239,12,50000);
INSERT INTO feina(id_empleat,id_empresa,salari) VALUES (1235,10,1500);
INSERT INTO feina(id_empleat,id_empresa,salari) VALUES (1236,10,100000);
INSERT INTO feina(id_empleat,id_empresa,salari) VALUES (1237,10,2000);

INSERT INTO empresa(id_empresa,ciutat) VALUES (12,'Manresa');
INSERT INTO empresa(id_empresa,ciutat) VALUES (10,'Sant Fruitos de Bages');

INSERT INTO manager(id_empleat,id_empleat_coordinador) VALUES (1239,1238);
INSERT INTO manager(id_empleat,id_empleat_coordinador) VALUES (1236,1235);


