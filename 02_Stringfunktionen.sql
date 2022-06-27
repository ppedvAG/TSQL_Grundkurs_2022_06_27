USE Northwind;

SELECT CompanyName, (Address + ' ' + City + ', ' + PostalCode + ' ' + Country) AS VolleAddresse FROM Customers; --mit + Strings (Zeichenketten) verbindet sie miteinander

SELECT CompanyName, CONCAT(Address, ' ', City, ', ', PostalCode, ' ', Country) FROM Customers; --CONCAT: Strings zusammenbauen ohne +

SELECT TRIM('     Test     '); --Schneidet Leerzeichen auf beiden Seiten weg
SELECT RTRIM('    Test     '); --Schneidet Leerzeichen rechts weg
SELECT LTRIM('    Test     '); --Schneidet Leerzeichen links weg

SELECT LOWER('Test'); --Ganzer String lowercase
SELECT UPPER('Test'); --Ganzer String UPPERCASE

SELECT LEN('Test '); --L�nge vom String ohne Abst�nde links und rechts
SELECT DATALENGTH(' Test '); --L�nge vom String mit Abst�nden

SELECT REVERSE('Test'); --Dreht String um

SELECT LEFT('Testtext', 4); --Linke 4 Zeichen
SELECT RIGHT('Testtext', 4); --Rechte 4 Zeichen
SELECT SUBSTRING('Testtext', 2, 4); --Von Stelle 2 nimm 4 Zeichen (nicht von 2-4, sondern 2-5)

SELECT STUFF('Testtext', 2, 0, '_Hallo_'); --F�ge den neuen Text vor der Stelle 2 ein
SELECT STUFF('Testtext', 2, 5, '_Hallo_'); --Ersetze einen Teil vom Text (Von Stelle 2, 5 Zeichen) mit dem angegebenen neuen Text

SELECT REPLICATE('xy', 4); --Schreibe einen String x-Mal