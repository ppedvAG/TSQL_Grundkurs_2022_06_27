USE Northwind;

SELECT * FROM Orders; --EmployeeID
SELECT * FROM Employees; --Datensätze hinüber bringen mit JOIN

SELECT * 
FROM Orders 
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID; --Tabellen kombiniert über EmployeeID

SELECT --Sinnvolle Spalten ausgeben statt *
Orders.OrderID,
Employees.EmployeeID,
Employees.FirstName + ' ' + Employees.LastName AS FullName,
Orders.ShippedDate
FROM Orders 
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID;

SELECT --Aliases um Code zu kürzen, Orders = ord, Customers = cust
ord.OrderID,
cust.CustomerID,
cust.CompanyName,
ord.ShippedDate
FROM Orders ord
INNER JOIN Customers cust
ON ord.CustomerID = cust.CustomerID;

SELECT
ord.OrderID,
cust.CustomerID,
cust.CompanyName,
ord.ShippedDate,
ord.ShipCountry
FROM Orders ord
INNER JOIN Customers cust
ON ord.CustomerID = cust.CustomerID
WHERE ord.ShipCountry = 'UK'
ORDER BY cust.CustomerID; --WHERE und ORDER BY hier auch möglich, hier wieder Alias angeben

SELECT * --Join mit mehreren Tabellen (Orders mit Employees und Customers kombinieren)
FROM Orders
INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID;

SELECT --Sinnvolle Felder holen mithilfe von Aliases
o.OrderID,
c.CustomerID,
c.CompanyName,
e.FirstName + ' ' + e.LastName AS FullName
FROM Orders o
INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID
INNER JOIN Customers c ON c.CustomerID = o.CustomerID;

--Füllt Customer die keine Order getätigt haben mit NULL auf
SELECT * 
FROM Orders 
RIGHT JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID 
WHERE OrderID IS NULL;

--Oberes Statement nur umgekehrt (und sinnvoller)
SELECT * 
FROM Customers 
LEFT JOIN Orders 
ON Orders.CustomerID = Customers.CustomerID 
WHERE OrderID IS NULL;

--CROSS JOIN: Gibt alle Kombinationen ohne ON zurück
SELECT * FROM Orders CROSS JOIN Customers;

--SELF JOIN: Join mit der selben Tabelle statt mit zwei Tabellen
SELECT emp.EmployeeID, 
emp.FirstName + ' ' + emp.LastName AS Mitarbeiter, 
chef.EmployeeID as ChefID, 
chef.FirstName + ' ' + chef.LastName AS [Chef Name]
FROM Employees emp 
INNER JOIN Employees chef 
ON emp.ReportsTo = chef.EmployeeID;

--LEFT JOIN statt INNER JOIN um den Chef auch zu finden
SELECT emp.EmployeeID, 
emp.FirstName + ' ' + emp.LastName AS Mitarbeiter, 
chef.EmployeeID AS ChefID, 
chef.FirstName + ' ' + chef.LastName AS [Chef Name]
FROM Employees emp 
LEFT JOIN Employees chef 
ON emp.ReportsTo = chef.EmployeeID;

--JOIN ohne Keyword ist ein INNER JOIN
SELECT * 
FROM Orders 
JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID;