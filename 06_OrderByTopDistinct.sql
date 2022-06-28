USE Northwind;

--ORDER BY: Tabelle nach einer Spalte sortieren
SELECT * FROM Customers ORDER BY Country;

--Bei ORDER BY können mehrere Sortierparameter angegeben werden. Es wird Primär nach dem ersten und Sekundär nach dem zweiten sortiert
SELECT * FROM Customers ORDER BY Country, ContactName;

--Sortierrichtung mit ASC (Ascending) oder DESC (Descending) festlegen
SELECT * FROM Customers ORDER BY Country DESC, ContactName ASC;

--Sortiert nach drittem Spaltenindex (Phone), funktioniert auch bei *
SELECT CustomerID, Address, Phone FROM Customers ORDER BY 3;

--Nach Alias (AS) sortieren
SELECT FirstName + ' ' + LastName AS FullName FROM Employees ORDER BY FullName;

--Gibt jedes Country nur einmal aus
SELECT DISTINCT Country FROM Customers ORDER BY Country;

--Gibt alle Stadt + Land Kombinationen
SELECT DISTINCT City, Country FROM Customers ORDER BY City;

--COUNT: Zähle die Ergebnisse ohne sie auszugeben
SELECT COUNT(*) FROM Customers; --91
SELECT COUNT(DISTINCT Country) FROM Customers; --21

--Obersten 10 Datensätze
SELECT TOP 10 * FROM Customers;

--TOP macht nur wirklich Sinn mit ORDER BY
SELECT TOP 10 * FROM Orders ORDER BY ShippedDate DESC;

--Obersten 2%
SELECT TOP 2 PERCENT * FROM Orders ORDER BY Freight DESC;

--Untersten 2%
SELECT TOP 2 PERCENT * FROM Orders ORDER BY Freight;

--Mit einzelnen Spalten statt *
SELECT TOP 5 PERCENT
CustomerID,
CompanyName,
ContactName,
Phone,
City
FROM Customers
ORDER BY City;

--Mit Unentschieden (22 -> 69)
SELECT TOP 1 PERCENT WITH TIES *
FROM "Order Details"
ORDER BY Quantity;