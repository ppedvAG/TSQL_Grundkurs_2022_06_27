USE Northwind;

--Zwei Spalten
SELECT 'Test1', 'Test2';

--Einzelne Spalte dank UNION, AS nur bei erstem Select
SELECT 'Test1' AS Spalte
UNION
SELECT 'Test2';

--CompanyName fusionieren
SELECT * FROM Customers;
SELECT * FROM Suppliers;

--Alle Customer Namen und Supplier Namen
SELECT CompanyName FROM Customers
UNION
SELECT CompanyName FROM Suppliers;

--Spalten m�ssen nicht den selben Namen haben
SELECT CompanyName FROM Customers
UNION
SELECT ContactName FROM Suppliers;

--Mit JOINs -> sehr unpraktisch
SELECT c.CustomerID, c.CompanyName, c.ContactName, c.Phone,
	   s.SupplierID, s.CompanyName, s.ContactName, s.Phone
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON od.OrderID = o.OrderID
				 INNER JOIN Products p ON p.ProductID = od.ProductID
				 INNER JOIN Suppliers s ON s.SupplierID = p.SupplierID;

--Statt JOINs, Datentypen m�ssen gleich sein bei allen Spalten
SELECT CustomerID AS ID, CompanyName, ContactName, Phone FROM Customers
UNION
SELECT CONVERT(NCHAR, SupplierID), CompanyName, ContactName, Phone FROM Suppliers;

--Gleich viele Spalten m�ssen vorhanden sein
SELECT CompanyName, Phone FROM Customers
UNION
SELECT CompanyName FROM Suppliers;

--Unterschiedliche Typen nicht m�glich
SELECT CompanyName FROM Customers
UNION
SELECT EmployeeID FROM Employees;

--M�glich, da gleiche Anzahl Spalten und gleiche Typen
SELECT CompanyName, ContactName, Phone FROM Customers
UNION
SELECT CompanyName, ContactName, Phone FROM Suppliers;

--UNION ALL um Duplikate zu behalten (Duplikate werden standardm��ig entfernt)
SELECT CompanyName, ContactName, Phone FROM Customers
UNION ALL
SELECT CompanyName, ContactName, Phone FROM Suppliers;

--ORDER BY einfach danach
SELECT CompanyName, ContactName, Phone FROM Customers
UNION
SELECT CompanyName, ContactName, Phone FROM Suppliers
ORDER BY Phone;

--INTERSECT: gibt die Daten zur�ck die in beiden Tabellen enthalten sind
--US, USA
SELECT Country FROM Customers
INTERSECT
SELECT Country FROM Employees;

--EXCEPT: gibt die Daten zur�ck die NICHT in beiden Tabellen enthalten sind
--Alles au�er UK, USA
SELECT Country FROM Customers
EXCEPT
SELECT Country FROM Employees;