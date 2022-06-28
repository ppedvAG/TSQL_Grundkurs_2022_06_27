USE Northwind;

SELECT * FROM Customers WHERE Country LIKE 'A%'; --Alle Customer mit Ländern die mit A anfangen

SELECT * FROM Customers WHERE Country LIKE 'a%'; --Case Insensitive (Groß- und Kleinschreibung wird ignoriert)

SELECT * FROM Customers WHERE Country LIKE '%A%'; --Beidseitig beliebig viele Zeichen (Argentinien fällt hier auch hinein, da keine Zeichen auch gültig ist für %)

SELECT * FROM Customers WHERE City LIKE '_ünchen'; --Underscore: Ein Zeichen suchen, statt wie bei % mehrere

SELECT * FROM Customers WHERE PostalCode LIKE '____'; --Nach genau 4 beliebigen Zeichen suchen

SELECT * FROM Customers WHERE ContactName LIKE '[arn]%';
--Eckige Klammern: Suche nach einem der Zeichen in der Klammer
--Mit % nach Anfangsbuchstabe im Namen suchen

SELECT * FROM Customers WHERE ContactName LIKE '[a-d]%'; --Platzhalter für eine Liste von Zeichen (hier A bis D)

SELECT * FROM Customers WHERE ContactName LIKE '[^a-d]%' ORDER BY ContactName; --Invertierung der Klammer (Alle Kunden die nicht mit A-D anfangen)

SELECT * FROM Customers WHERE ContactName LIKE '[a-d|x-z]%'; --In der eckigen Klammer Ranges kombinieren mit | (A bis D und X bis Z)

SELECT * FROM Customers WHERE CompanyName LIKE '%[%]%'; --Um Prozent zu suchen: Prozent in eckige Klammer

SELECT * FROM Customers WHERE CompanyName LIKE '%['']%'; --Um einzelnes Hochkomma zu finden: ['']