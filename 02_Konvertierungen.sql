USE Northwind;

SELECT GETDATE(); --GETDATE(): jetztiges Datum + Uhrzeit

SELECT CAST(GETDATE() AS date); --Zeit entfernen durch Cast auf Date

SELECT CAST(GETDATE() AS time); --Datum entfernen durch Cast auf Time

SELECT '123' + 2; --Automatische Konvertierung zu int durch Addition

SELECT '123.4' + 2; --Keine automatische Konvertierung

SELECT CAST('123.4' AS decimal(10, 2)) + 2; --Konvertierung zu decimal(10, 2) um Addition zu ermöglichen

SELECT CAST('123.4' AS float) + 2; --Einfacher als oberes

SELECT CAST(GETDATE() AS varchar); --Datum zu string konvertieren (andere Schreibweise)

SELECT CAST(GETDATE() AS varchar(11)); --Bei Konvertierung abtrennen (erste 11 Stellen)

SELECT CAST(BirthDate AS varchar(11)) FROM Employees; --Formatiertes DateTime
SELECT BirthDate FROM Employees; --ISO DateTime (YYYY-MM-DD hh:mm:ss)

SELECT CAST('2022-06-27' AS date); --Problematisch da möglicherweise falsches Format

SELECT CONVERT(VARCHAR, GETDATE()); --CONVERT: Typ zuerst, dann Wert

--https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#date-and-time-styles
SELECT CONVERT(VARCHAR, GETDATE(), 104); --27.06.2022
SELECT CONVERT(VARCHAR, GETDATE(), 4); --27.06.22

SELECT FORMAT(1234, '#-#/#-#'); --#: Platzhalter für die derzeitige Stelle

SELECT FORMAT(1234, '#/#'); --Erste #: 123, Zweite: 4

SELECT FORMAT(1234, '#/#-#'); --Erste #: 12, Zweite: 3, Dritte: 4

SELECT FORMAT(GETDATE(), 'dd.MM.yyyy HH:mm:ss'); --Datumsformate

SELECT FORMAT(GETDATE(), 'dddd, dd.MMMM.yyyy HH:mm:ss'); --dddd: Schöner Tag, MMMM: Schönes Monat

SELECT FORMAT(CAST('2022-06-27' AS date), 'dd.MM.yyyy'); --Konvertierung von VARCHAR zu DATE notwendig

SELECT FORMAT(GETDATE(), 'D'); --D: Schönes Datum, d: dd.MM.yyyy, s: ISO Datum

SELECT FORMAT(HireDate, 'D') AS HireDate FROM Employees;