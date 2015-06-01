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

INSERT INTO productes VALUES ("Pid0", "4Formatges", "Petita",7);
INSERT INTO productes VALUES ("Pid1", "BBQ", "Mitjana",8);
INSERT INTO productes VALUES ("Pid2", "Tropical", "Mitjana",9);
INSERT INTO productes VALUES ("Pid3", "Motzarela", "Mitjana",6);
INSERT INTO productes VALUES ("Pid4", "Calzone", "Mitjana",7);
INSERT INTO productes VALUES ("Pid5", "Peperoni", "Mitjana",8);
INSERT INTO productes VALUES ("Pid6", "Pollastre", "Mitjana",9);
INSERT INTO productes VALUES ("Pid7", "Napolitana", "gran",15);

INSERT INTO regals VALUES ("Pid7", "Pid0");
INSERT INTO regals VALUES ("Pid2", "Pid1");
INSERT INTO regals VALUES ("Pid3", "Pid1");

INSERT INTO domicilis VALUES (938725479, "Angel", 16, 1, 2);
INSERT INTO domicilis VALUES (938725478, "Carrio", 17, 1, 2);
INSERT INTO domicilis VALUES (938725477, "Numancia", 18, 1, 2);
INSERT INTO domicilis VALUES (938725476, "Diagonal", 19, 1, 2);
INSERT INTO domicilis VALUES (938725475, "Alvenez", 20, 1, 2);
INSERT INTO domicilis VALUES (938725474, "Complex", 21, 1, 2);

INSERT INTO comandes VALUES (1000, 1, 2, 938725479, 20);
INSERT INTO comandes VALUES (1001, 2, 3, 938725478, 10);
INSERT INTO comandes VALUES (1002, 3, 4, 938725477, 2);
INSERT INTO comandes VALUES (1003, 4, 5, 938725476, 5);
INSERT INTO comandes VALUES (1004, 5, 6, 938725475, 8);

/*producte demanat en una comanda*/
INSERT INTO liniesComandes VALUES (1000, "Pid7", 100);
INSERT INTO liniesComandes VALUES (1001, "Pid1", 20);
INSERT INTO liniesComandes VALUES (1002, "Pid2", 10);
INSERT INTO liniesComandes VALUES (1003, "Pid2", 50);
INSERT INTO liniesComandes VALUES (1004, "Pid3", 1);
INSERT INTO liniesComandes VALUES (1003, "Pid7", 2);
INSERT INTO liniesComandes VALUES (1003, "Pid0", 2);
INSERT INTO liniesComandes VALUES (1004, "Pid7", 2);
