USE [UserDB]
GO

/****** Object:  View [dbo].[ListeBenutzernView]    Script Date: 01.04.2024 19:03:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[ListeBenutzernView] AS
SELECT ID AS Nummer
	, Benutzer AS Anmeldename
	, CONCAT('Name: ',Vorname, ' ', Nachname) AS Anwender
	, CONCAT('E-Mailadresse: ', Benutzer, '@test.de') AS Mail
	, CASE 
		WHEN Aktiv = 1 THEN 'Aktiv'
		ELSE 'Inaktiv'
	  END
	AS Anmeldung
	, CASE 
		WHEN ID < 4 THEN DATEADD(DAY, 2, Erstelldatum)
		ELSE DATEADD(DAY, -2, Erstelldatum)
	  END
	 AS Erstelldatum
FROM Mitarbeiter;
GO


