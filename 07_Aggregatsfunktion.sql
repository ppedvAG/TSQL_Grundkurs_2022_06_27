USE Northwind;

--COUNT(Spaltenname oder *): Gibt die Anzahl an Resultaten aus
SELECT COUNT(*) FROM Customers;

--COUNT in Kombination mit WHERE
SELECT COUNT(*) FROM Customers WHERE Country = 'UK'; --7

--DISTINCT in der Klammer um Distinct von der Spalte zu nehmen
SELECT COUNT(DISTINCT Country) FROM Customers;

--Gibt die Anzahl pro Customer pro Land aus
SELECT Country, COUNT(*) FROM Customers GROUP BY Country;

--MIN/MAX: Minimum, Maximum der Spalte
--AVG (Average): Durchschnitt der Spalte
--SUM: Summiert die Spalte auf
SELECT
MAX(Freight) AS HöchsteLadung,
MIN(Freight) AS NiedrigsteLadung,
AVG(Freight) AS Durchschnittsladung,
SUM(Freight) AS GesamteLadung
FROM Orders;

--Alle Kombinationen der angegebenen Spalten ausgeben
SELECT City, Country FROM Customers GROUP BY City, Country;

--Gibt pro Employee die Anzahl Order an
SELECT EmployeeID, COUNT(*) FROM Orders GROUP BY EmployeeID;

--Gibt die Durchschnittlichen Frachtkosten pro Mitarbeiter an
SELECT EmployeeID, AVG(Freight) FROM Orders GROUP BY EmployeeID;

--Obere Abfrage sortieren nach Mitarbeiternummer
SELECT EmployeeID, AVG(Freight) FROM Orders GROUP BY EmployeeID ORDER BY EmployeeID;

--Nach Durchschnittspreis sortieren mit AS
SELECT EmployeeID, AVG(Freight) AS Durchschnittspreis FROM Orders GROUP BY EmployeeID ORDER BY Durchschnittspreis;

--Weiteres Feld hinzufügen (Anzahl)
SELECT EmployeeID, COUNT(*) AS AnzahlBestellungen, AVG(Freight) AS Durchschnittspreis FROM Orders GROUP BY EmployeeID ORDER BY Durchschnittspreis;

--WHERE vs GROUP BY + HAVING
--WHERE filtert Daten bevor sie geholt werden
--HAVING holt alle Daten und filtert sie dann

--Alle Kunden die mindestens 10 Einkäufe getätigt haben
SELECT CustomerID, COUNT(*) AS AnzahlEinkäufe
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 10;

--Alle Kunden die mindestens 1000$ Frachtkosten verursacht haben
SELECT CustomerID, COUNT(*), SUM(Freight)
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 1000

--Obere Abfrage nur Sortierung mit Aggregatsfunktion zusätzlich zu Spalte mit AS
SELECT CustomerID, COUNT(*) AS Anzahl, SUM(Freight) 
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 1000
ORDER BY Anzahl, SUM(Freight)