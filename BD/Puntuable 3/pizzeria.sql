create table productes(
	idProducte char(9),
	nom char(20),
	mida char(20),
	preu integer check(preu>0),
	primary key (idProducte),
	unique(nom, mida));

create table domicilis(
       numero char(9),
       carrer char(20),
       numCarrer integer check(numCarrer>0),
       pis char(2),
       porta char(2),
       primary key (numero));

create table comandes(
       numComanda integer check(numComanda>0),
       instantFeta integer not null check(instantFeta>0),
       instantServida integer check(instantServida>0),
       numTelf char(9),
       import integer check(import>0),
       primary key (numComanda),
       foreign key (numTelf) references domicilis,
       check (instantServida>instantFeta));

create table liniesComandes(
       numComanda integer,
       idProducte char(9),
       quantitat integer check(quantitat>0),
       primary key (numComanda, idProducte),
       foreign key (numComanda) references comandes,
       foreign key (idProducte) references productes);

/*each row represents one of the presents which it's done to the store with one unit of product  idProdRegalat when someons buy one unit of product idProdComprat*/

create table regals(
       idProdComprat char(9),
       idProdRegalat char(9),
       primary key (idProdComprat, idProdRegalat),
       foreign key (idProdComprat) references productes,
       foreign key (idProdRegalat) references productes);

INSERT INTO productes VALUES ("id0", "Tomaquet0", "Mitjana",7);
INSERT INTO productes VALUES ("id1", "Tomaquet1", "Mitjana",8);
INSERT INTO productes VALUES ("id2", "Tomaquet2", "Mitjana",9);
INSERT INTO productes VALUES ("id3", "Tomaquet3", "Mitjana",6);
INSERT INTO productes VALUES ("id4", "Tomaquet4", "Mitjana",7);
INSERT INTO productes VALUES ("id5", "Tomaquet5", "Mitjana",8);
INSERT INTO productes VALUES ("id6", "Tomaquet6", "Mitjana",9);
INSERT INTO productes VALUES ("id7", "napolitana", "gran",15);

INSERT INTO regals VALUES ("id7", "id0");
INSERT INTO regals VALUES ("id2", "id1");
INSERT INTO regals VALUES ("id3", "id1");

INSERT INTO domicilis VALUES (938773066, "Domenech0", 16, 1, 2);
INSERT INTO domicilis VALUES (938774066, "Domenech1", 17, 1, 2);
INSERT INTO domicilis VALUES (938775066, "Domenech2", 18, 1, 2);
INSERT INTO domicilis VALUES (938776066, "Domenech3", 19, 1, 2);
INSERT INTO domicilis VALUES (938777066, "Domenech4", 20, 1, 2);
INSERT INTO domicilis VALUES (938778066, "Domenech5", 21, 1, 2);

INSERT INTO comandes VALUES (1000, 1, 2, 938773066, 20);
INSERT INTO comandes VALUES (1001, 2, 3, 938775066, 10);
INSERT INTO comandes VALUES (1002, 3, 4, 938774066, 2);
INSERT INTO comandes VALUES (1003, 4, 5, 938773066, 5);
INSERT INTO comandes VALUES (1004, 5, 6, 938775066, 8);

/*producte demanat en una comanda*/
INSERT INTO liniesComandes VALUES (1000, "id7", 100);
INSERT INTO liniesComandes VALUES (1001, "id1", 20);
INSERT INTO liniesComandes VALUES (1002, "id2", 10);
INSERT INTO liniesComandes VALUES (1003, "id2", 50);
INSERT INTO liniesComandes VALUES (1004, "id3", 1);
INSERT INTO liniesComandes VALUES (1003, "id7", 2);
INSERT INTO liniesComandes VALUES (1003, "id0", 2);
INSERT INTO liniesComandes VALUES (1004, "id7", 2);