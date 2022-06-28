USE Northwind;

SELECT Freight, Freight % 5 FROM Orders; --%: Modulo, Rest einer Division

SELECT CompanyName, (Address + ' ' + City + ', ' + PostalCode + ' ' + Country) AS VolleAdresse FROM Customers; --mit + Strings (Zeichenketten) verbindet sie miteinander

SELECT DISTINCT Country FROM Customers; --Datensätze einzigartig machen

SELECT c.Country FROM Customers c; --c als Tabellenalias, bei mehreren Tabellen mit gleichen Spalten, wichtig bei Subselects

SELECT * FROM Customers ORDER BY Country ASC; --ORDER BY: Sortiere nach einer Spalte, ASC/DESC gibt die Richtung an