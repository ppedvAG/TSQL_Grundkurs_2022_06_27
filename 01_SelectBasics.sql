--Kommentar, wird nicht ausgeführt

/*
Mehrzeiliger
Kommentar
*/

USE Northwind; --Datenbank auswählen

SELECT 100;

SELECT 'Test'; --Strg + E: Markierten Code ausführen

SELECT 100*3; --Berechnung

SELECT '100*3'; --Strg + R: Ergebnisansicht schließen

SELECT 'Lukas' AS Name; --AS: Text als Spaltenname verwenden

SELECT 100, 'Test' AS Test, 'weiterer Test'; --Mehrere Werte selektieren

SELECT 10.50; --Kommazahlen mit Punkt statt mit Beistrich

--Strg + K, C: Ausgewählte Zeilen auskommentieren
--Strg + K, U: Ausgewählte Zeilen einkommentieren

--Alt + Pfeiltaste (Up, Down): Ausgewählte Zeilen verschieben

SELECT * FROM Customers; --*: Alles

SELECT CompanyName FROM Customers; --Einzelne Spalten selektieren