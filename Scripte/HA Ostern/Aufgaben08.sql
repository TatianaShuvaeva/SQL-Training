USE UserDB;
/***Aufgabe 8***/
GO
CREATE VIEW ListeBenutzernView AS
SELECT ID AS Nummer
	, Benutzer AS Anmeldename
	, CONCAT('Name: ',Vorname, ' ', Nachname) AS Anwender
	, CONCAT('E-Mailadresse: ', Benutzer, '@test.de') AS Mail
	, CASE 
		WHEN Aktiv = 1 THEN 'Aktiv'
		ELSE 'Inaktiv'
	  END
	AS Anmeldung
	 
FROM Mitarbeiter;
GO