--DROP TABLE <Name>: Tabelle löschen
DROP TABLE Test;

--CREATE TABLE <Name>(<Name Feld1> <Typ Feld1>, <Name Feld2> <Typ Feld2>, ...)
--Primärschlüssel
CREATE TABLE Test
(
	--primary key um Spalte zum Primärschlüssel zu machen (kann nicht null sein)
	--identity: Erhöht die Spalte bei jedem INSERT um 1
	--identity(<Startwert>, <Inkrement>) z.B.: identity(0, 3) -> Start bei 0, erhöhe jedes mal um 3
	ID int primary key identity,
	Vorname varchar(20),
	Nachname varchar(20) not null --Werte können nicht null sein
);

--Einen Datensatz einfügen
INSERT INTO Test(Vorname, Nachname)
VALUES ('Max', 'Muster');

--Mehrere Datensätze einfügen
INSERT INTO Test(Vorname, Nachname) VALUES 
('Max', 'Muster'), 
('Test', 'Test');

--Tabellenspalten weglassen, Reihenfolge muss beachtet werden
INSERT INTO Test VALUES
('Max', NULL); --NULL: kein Wert

--Werte aus SELECT Statement in die Tabelle einfügen (ohne INTO)
INSERT Test SELECT FirstName, LastName FROM Employees;

--Werte aus Prozedur in Tabelle einfügen (ohne INTO)
--INSERT Test
--EXEC AllCustomersFromCountry @Country = 'UK';

--Ergebnis von SELECT in eine neue Tabelle speichern
SELECT FirstName, LastName INTO TestTabelle FROM Employees;
DROP TABLE TestTabelle;

--UPDATE <Tabellenname> SET <Spalte> = <WERT>;
--WHERE sollte verwendet werden da sonst ALLE Werte angepasst werden
UPDATE Test SET Nachname = NULL WHERE Vorname LIKE 'M%';

--CREATE SEQUENCE <Name> AS <Datentyp> (Numerischer Datentyp)
--Standardmäßig (1, 1), anpassbar mit START WITH <Zahl> und INCREMENT BY <Zahl>
CREATE SEQUENCE TestSeq AS INT
START WITH 1
INCREMENT BY 1;

--Nächsten Wert aus der Sequenz entnehmen
SELECT NEXT VALUE FOR TestSeq;

--Nächsten Wert bei INSERT benutzen
INSERT INTO Test
VALUES ('X', 'Y', NEXT VALUE FOR TestSeq);

--DELETE FROM <Tabellenname> WHERE <Bedingung>
--DELETE ohne WHERE löscht ALLE Datensätze
DELETE FROM Test WHERE ID >= 5;

--TRUNCATE löscht alle Daten aus der Tabelle genauso wie DELETE ohne WHERE
--WHERE nicht möglich bei TRUNCATE
--Programmiere wollte explizit alle Daten löschen und hat kein WHERE vergessen
TRUNCATE TABLE Test;

--Spalte hinzufügen
--ALTER TABLE <Tabellenname> ADD <Spaltenname> <Typ>
ALTER TABLE Test ADD Seq int;

--Spalte entfernen
--ALTER TABLE <Tabellenname> DROP COLUMN <Spaltenname>
ALTER TABLE Test DROP COLUMN Seq;