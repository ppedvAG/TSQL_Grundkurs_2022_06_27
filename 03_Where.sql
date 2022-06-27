-- <, >, <=, >= kleiner, größer, kleiner-gleich, größer-gleich
-- =, !=, <> gleich, ungleich, ungleich
-- IN, BETWEEN, LIKE Liste angeben und prüfen ob die Spalte einem Wert der Liste entspricht, zwischen
-- AND, OR Um mehrere Bedingungen zu verknüpfen

SELECT * FROM Orders WHERE Freight > 50;

SELECT * FROM Orders WHERE Freight > 50 AND EmployeeID != 4; --WHERE mit mehreren Bedingungen und ungleich

SELECT * FROM Orders WHERE Freight BETWEEN 25 AND 50; --Ist Freight zwischen 25 und 50 (Grenzen inkludiert)

SELECT * FROM Orders WHERE EmployeeID BETWEEN 1 AND 3;

SELECT * FROM Orders WHERE ShipCountry = 'Austria' OR ShipCountry = 'Germany' OR ShipCountry = 'Sweden'; --Lang und unübersichtlich
SELECT * FROM Orders WHERE ShipCountry IN('Austria', 'Germany', 'Sweden'); --Einfacher und übersichtlicher mit IN(...)

SELECT * FROM Customers WHERE Country = 'Germany';

SELECT * FROM Customers WHERE Country = 'Germany' AND City != 'Berlin';

SELECT * FROM Customers WHERE Country = 'Germany' ORDER BY PostalCode DESC; --Sortiere alle deutschen Customer nach PLZ (absteigend dank DESC)

SELECT * FROM Customers WHERE Fax IS NOT NULL; --IS (NOT) NULL: Null-Check, funktioniert nicht mit =/!=