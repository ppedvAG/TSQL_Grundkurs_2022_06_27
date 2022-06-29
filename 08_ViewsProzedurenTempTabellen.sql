USE Northwind;
GO

--CREATE VIEW <Name> AS <SQL-Statement> GO
--Ist ein statische Snapshot der Datenbank
--v_ ist ein Prefix, kann beliebig sein und ist nur eine Konvention
--Kein ORDER BY

CREATE VIEW v_Countries
AS
SELECT DISTINCT City, Country FROM Customers;
GO

--View ansprechen
SELECT * FROM v_Countries;

--View mit WHERE
SELECT * FROM v_Countries
WHERE Country LIKE 'A%';

--View mit ORDER BY
SELECT * FROM v_Countries
ORDER BY Country;

--View löschen
DROP VIEW v_Countries;
GO

--Vorher überprüfen ob View existiert
DROP VIEW IF EXISTS v_CustomersGermany;
GO

--View mit JOIN
CREATE VIEW v_CustomersGermany
AS
SELECT OrderID, Freight, c.CustomerID, CompanyName, City, ContactName, Phone
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
GO

SELECT * FROM v_CustomersGermany;
GO

--------------------------------------------------------------------------------------

--Prozeduren: CREATE PROCEDURE <Name> AS <SQL-Statement> GO
CREATE PROCEDURE p_Test
AS
SELECT DISTINCT Country FROM Customers;
SELECT DISTINCT City FROM Customers;
SELECT TOP 3 Freight FROM Orders ORDER BY Freight DESC;
GO

--Prozedur ausführen mit EXECUTE
EXECUTE p_Test;
GO

--Prozedur mit Argument (@Country -> @<Name> <Typ>)
--PROC: Kurzform für PROCEDURE
CREATE PROC AllCustomersFromCountry @Country varchar(30)
AS
SELECT * FROM Customers WHERE Country = @Country
GO

--EXEC: Kurzform für EXECUTE, Parameter angeben mit @<Name> = <Wert>
EXEC AllCustomersFromCountry @Country = 'UK';
GO

--Anderen Wert eintragen
EXEC AllCustomersFromCountry @Country = 'USA';
GO

CREATE PROC AllCustomersFromCountryAndCity @Country varchar(30), @City varchar(30)
AS
SELECT * FROM Customers WHERE Country = @Country AND City = @City
GO

EXEC AllCustomersFromCountryAndCity @Country = 'UK', @City = 'London';
GO

--------------------------------------------------------------------------------------------

--SELECT ... INTO: Ergebnis in einer neuen Tabelle ablegen
SELECT CustomerID, Freight
INTO Test
FROM Orders;

--Vor Tabellenname eine # schreiben für eine Temporäre Tabelle
SELECT CustomerID, Freight
INTO #Test
FROM Orders;

--Wird gelöscht sobald die Session endet (nach Verbindungstrennung eine gewisse Zeit)
SELECT * FROM #Test;

--Globale Temporäre Tabelle (mit zwei #), kann jeder Benutzer darauf zugreifen, verschwindet wenn ALLE User die Session beenden
SELECT CustomerID, Freight
INTO ##Test
FROM Orders;