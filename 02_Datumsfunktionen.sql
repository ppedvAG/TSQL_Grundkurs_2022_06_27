USE Northwind;

SELECT GETDATE();

SELECT SYSDATETIME(); --Aktuelles Datum auf Nanosekunden genau (7 Stellen)

/*
Intervalle:
    year, yyyy, yy = Year
    quarter, qq, q = Quarter (1-4)
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, n = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns
    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
*/

SELECT DATEADD(HOUR, 2, GETDATE()); --Auf Datum 2 Stunden addieren

SELECT DATEADD(HOUR, -2, GETDATE()); --Von Datum 2 Stunden subtrahieren

SELECT DATEADD(DAY, 5, '27.06.2022'); --Hier nicht klar was Tag und Monat ist, wird von der Zone des Computers genommen
--Bei Datumswerten generell ISO-Datum benutzen (yyyy-MM-dd hh:mm:ss:fff)

SELECT DATEADD(HOUR, 10, '27.06.2022 20:00:00');

SELECT DATEADD(MONTH, 10, '27.06.2022 20:00:00');

SELECT DATEADD(QUARTER, 1, GETDATE());

SELECT DATEDIFF(YEAR, '2000', GETDATE());

SELECT DATEDIFF(DAY, '18.07.1998', GETDATE()); --Unterschied zwischen zwei Datumswerten ausgeben (hier Tage seit Anfangsdatum bis Heute)

SELECT DATEPART(HOUR, GETDATE()); --Teil eines Datums ausgeben (hier Stunde)

SELECT DATEPART(QUARTER, GETDATE()); --Quartal von Heute ausgeben

SELECT DATEPART(DayOfYear, GETDATE()); --Tag seit 01.01.

SELECT DATEPART(WEEKDAY, GETDATE()); --Heutiger Wochentag (Montag, 1)

SELECT DATENAME(DW, GETDATE()); --Montag (DW statt WeekDay)

SELECT DATEFROMPARTS('2022', '07', '26'); --Datum aus einzelnen Strings aufbauen