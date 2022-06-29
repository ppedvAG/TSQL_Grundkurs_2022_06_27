USE Northwind;

--Alle Order die teurer als der Durchschnitt sind
SELECT * FROM Orders
--WHERE Freight >= AVG(Freight) --funktioniert nicht
WHERE Freight >= (SELECT AVG(Freight) FROM Orders)
ORDER BY Freight;

--Subselect mit IN, Resultate vom Subselect werden in IN gefüllt
SELECT * FROM Customers
WHERE Country IN(SELECT DISTINCT Country FROM Customers WHERE Country LIKE 'A%'); --Argentina, Austria

--Subselect Wert steht in jeder Zeile, muss einen Wert zurückgeben
SELECT Freight, (SELECT TOP 1 AVG(Freight) FROM Orders)
FROM Orders;

--Subselect im FROM mit JOIN
SELECT *
FROM 
(
	SELECT 
	Orders.EmployeeID, 
	Orders.Freight,
	Employees.FirstName + ' ' + Employees.LastName AS FullName
	FROM Orders
	INNER JOIN Employees
	ON Orders.EmployeeID = Employees.EmployeeID
) AS ergebnis
WHERE ergebnis.FullName LIKE 'A%'

--EXISTS um zu prüfen ob Subquery ein Ergebnis bringt
SELECT * FROM Customers
WHERE EXISTS (SELECT Country FROM Customers WHERE Country LIKE 'X%'); --Kein Ergebnis da keine Länder mit X beginnend