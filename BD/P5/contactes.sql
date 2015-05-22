CREATE TABLE IF NOT EXISTS contacte(
nom TEXT NOT NULL,
fix INT (9));



create trigger R1 
BEFORE INSERT on contacte 
FOR EACH ROW 
WHEN EXISTS (SELECT * FROM contacte WHERE fix = New.fix AND nom = New.nom) 
begin 
	SELECT raise(ignore); 
end;

create trigger R2 before update on contacte
FOR EACH ROW
WHEN EXISTS (SELECT * FROM contacte WHERE fix = New.fix AND Nom=New.Nom) 
begin
    SELECT raise(ignore);
end;

INSERT INTO contacte (nom,fix) VALUES ('Enric',647561339);
INSERT INTO contacte (nom,fix) VALUES ('Joan',647561338);
INSERT INTO contacte (nom,fix) VALUES ('Josep',647561337);
INSERT INTO contacte (nom,fix) VALUES ('Sergi',647561336);
INSERT INTO contacte (nom,fix) VALUES ('Xavi',647561335);
INSERT INTO contacte (nom,fix) VALUES ('Pol',647561334);
INSERT INTO contacte (nom,fix) VALUES ('Dani',647561333);
INSERT INTO contacte (nom,fix) VALUES ('Oriol',647561332);
INSERT INTO contacte (nom,fix) VALUES ('Pere',647561331);
INSERT INTO contacte (nom,fix) VALUES ('Jordi',647561330);


