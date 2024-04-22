/*** 1-2. Erstellen Sie 2 neue Tabellen, erweitern ***/

/*** Tabelle Status ***/

USE [ProjektDB]

GO

CREATE TABLE dbo.Status
(		ID INT PRIMARY KEY IDENTITY (1,1),
		StatusName NVARCHAR(50)

);

GO

USE [ProjektDB]

GO

ALTER TABLE [dbo].[Aufgaben]
ADD StatusID INT NOT NULL DEFAULT 0

GO

USE [ProjektDB]

GO

UPDATE [dbo].[Aufgaben]
SET Aufgaben.StatusID = [dbo].[Status].ID
FROM  [dbo].[Aufgaben]
INNER JOIN [dbo].[Status]
	ON [Status].[StatusName] = [Aufgaben].[Status]

GO



/*** Tabelle Abteilung ***/

USE [ProjektDB]

GO


CREATE TABLE Abteilung 
(		ID INT PRIMARY KEY IDENTITY (1,1),
		AbteilungName NVARCHAR(50)

);

GO

USE [ProjektDB]

GO

ALTER TABLE [dbo].[Mitarbeiter]
ADD AbteilungID INT NOT NULL DEFAULT 0

GO

USE [ProjektDB]

GO

UPDATE [dbo].[Mitarbeiter]
SET [Mitarbeiter].AbteilungID = [dbo].[Abteilung].ID
FROM [dbo].[Mitarbeiter]
INNER JOIN [dbo].[Abteilung]
	ON [Abteilung].[AbteilungName] = [dbo].[Mitarbeiter].[Abteilung]
GO


USE [ProjektDB]

GO

ALTER TABLE [dbo].[Mitarbeiter] ADD CONSTRAINT FK_Mitarbeiter_Abteilung FOREIGN KEY (AbteilungID)
	REFERENCES Abteilung(ID)

GO


/*** Tabelle AufgabenMitarbeiter ***/

USE [ProjektDB]

GO
CREATE TABLE AufgabenMitarbeiter (
			ID INT PRIMARY KEY IDENTITY(1,1),
			AufgabenID INT,
			MitarbeiterID INT,
			Startzeit DATETIME,
			Endzeit DATETIME,
			Beschreibung NVARCHAR(500)
);



USE [ProjektDB]

GO

USE [ProjektDB]

GO

ALTER TABLE  [dbo].[AufgabenMitarbeiter] ADD CONSTRAINT FK_AufgabenMitarbeiter_Aufgaben FOREIGN KEY (AufgabenID)
	REFERENCES Aufgaben (ID)

GO


USE [ProjektDB]

GO

ALTER TABLE [dbo].[AufgabenMitarbeiter] ADD CONSTRAINT FK_AufgabenMitarbeiter_Mitarbeiter FOREIGN KEY (MitarbeiterID)
	REFERENCES Mitarbeiter (ID)

GO



/***3. Füllen Sie  die neuen Tabellen mit mindestens 3 Datensätzen ***/

USE [ProjektDB]

GO

INSERT INTO [dbo].[Status]
			([StatusName])

VALUES
		('Geplant'),
		('In Bearbeitung'),
		('Zurückgegeben'),
		('Abgeschlossen'),
		('Unvollständig')
		

		
GO

USE [ProjektDB]

GO
ALTER TABLE  [dbo].[Aufgaben] ADD CONSTRAINT FK_Aufgaben_Status FOREIGN KEY (StatusID)
	REFERENCES Status(ID)

GO


USE [ProjektDB]

GO

INSERT INTO [dbo].[Abteilung]
			(AbteilungName)

VALUES 
			('Management'),
			('Marketingabteilung'),
			('Entwicklungsabteilung')
GO



ALTER TABLE [dbo].[Aufgaben]
	DROP
	COLUMN [Status]

GO



USE [ProjektDB]

GO

ALTER TABLE [dbo].[Mitarbeiter]
	DROP
	COLUMN [Abteilung]
GO
/***4.  Erweitern Sie die Mitarbeiter Tabelle um das Feld Stundensatz ***/

USE [ProjektDB]

GO

ALTER TABLE [dbo].[Mitarbeiter]
ADD Stundensatz INT NOT NULL DEFAULT 0

GO

USE [ProjektDB]

GO

UPDATE [dbo].[Mitarbeiter]
SET [Stundensatz] = 40
        
WHERE    ID = 1 

GO 

UPDATE [dbo].[Mitarbeiter]
SET [Stundensatz] = 30

WHERE    ID = 2 


GO

UPDATE [dbo].[Mitarbeiter]

SET [Stundensatz] = 25

WHERE    ID = 3 

GO

/***5.  ***/

USE [ProjektDB]

GO


CREATE TABLE Teilaufgaben
(	ID INT PRIMARY KEY
			IDENTITY (1,1),
	AufgabenID INT NOT NULL DEFAULT 0,
	TeilaufgabenName NVARCHAR(50),
	Beschreibung TEXT,
	Startdatum DATE,
	Enddatum DATE,
	Zeitaufwand INT,
	MitarbeiterID INT NOT NULL DEFAULT 0,
	StatusID INT NOT NULL DEFAULT 0


);

GO


/***6. Tragen Sie mindestens 30 Datensätze in Ihre neue Tabelle ein ***/

USE [ProjektDB]

GO

INSERT INTO [dbo].[AufgabenMitarbeiter]
			([AufgabenID]
			, [MitarbeiterID]
			, [Startzeit]
			, [Endzeit]
			, [Beschreibung])
			
			

VALUES 
			(1, 1, '2023/05/07 09:30:00', '2023/06/07 15:30:00', 'Entwicklung eines detaillierten Plans zur Modernisierung der Unternehmenswebsite'),
			(1, 2, '2023/06/10 10:34:54', '2023/07/10 13:34:54', 'Erstellung von Designkonzepten für das neue Layout der Website'),
			(1, 1, '2023/07/15 09:34:54', '2023/08/15 15:34:54', 'Umsetzung des genehmigten Designkonzepts auf der Website'),
			(2, 3, '2023/06/17 15:34:54', '2023/07/01 14:34:54', 'Entwicklung eines Fragebogens zur Kundenbefragung'),
			(2, 1, '2023/07/05 09:34:54', '2023/08/05 17:34:54', 'Durchführung der Kundenumfrage gemäß dem entwickelten Fragebogen'),
			(2, 3,'2023/08/10 15:34:54', '2023/09/10 16:34:54','Analyse der Umfrageergebnisse und Erstellung eines Berichts'),
			(3, 1, '2023/12/28 08:34:54', '2024/01/15 17:34:54', 'Analyse der Kundenanforderungen für das neue Produkt'),
			(3, 2, '2024/01/20 11:34:54', '2024/02/20 10:34:54','Entwicklung eines Prototyps basierend auf den Kundenanforderungen' ),
			(3, 1,'2024/02/25 11:34:54', '2024/03/25 12:34:54', 'Durchführung von Tests am Prototypen und Sammeln von Feedback'),
			(4, 3, '2024/01/05 17:34:54', '2024/01/15 11:34:54','Durchführung einer Analyse zur Identifizierung der Zielgruppen für die Marketingkampagne'),
			(4, 1, '2024/01/20 15:34:54', '2024/02/10 10:34:54','Entwicklung einer Strategie für die Marketingkampagne basierend auf der Zielgruppenanalyse'),
			(4, 1, '2024/02/15 10:34:54', '2024/03/14 17:34:54', 'Umsetzung der Marketingkampagne gemäß der entwickelten Strategie'),
			(5, 2, '2023/12/28 09:34:54', '2024/01/10 14:34:54', 'Entwicklung von Schulungsinhalten für neue Mitarbeiter'),
			(5, 1, '2024/01/15 16:34:54', '2024/02/15 13:34:54','Durchführung von Schulungen für neue Mitarbeiter gemäß den entwickelten Inhalten'),
			(5, 3, '2024/02/20 16:34:54', '2024/03/15 08:34:54', 'Sammeln von Feedback von den Teilnehmern der Schulungen und Anpassung der Inhalte'),
			(6, 1, '2024/01/09 11:34:54', '2024/02/09 10:34:54','Durchführung von Tests zur Überprüfung der Produktqualität'),
			(6, 2,  '2024/02/12 11:34:54', '2024/03/12 12:34:54', 'Sammeln von Feedback der Kunden bezüglich der Produktqualität'),
			(6, 2, '2024/03/15 15:34:54', '2024/04/15 09:34:54','Umsetzung von Verbesserungsmaßnahmen basierend auf dem gesammelten Feedback'),
			(7, 2, '2024/01/22 09:34:54', '2024/02/05 07:34:54', 'Auswahl eines geeigneten Veranstaltungsortes für das Unternehmensevent'),
			(7, 1,  '2024/02/10 13:34:54', '2024/02/25 17:34:54', 'Planung des Programms und der Aktivitäten für das Unternehmensevent'),
			(7, 3,'2024/03/01 15:34:54', '2024/03/14 12:34:54', 'Durchführung des Unternehmensevents gemäß dem geplanten Programm'),
			(8, 1, '2024/01/30 14:34:54', '2024/02/10 10:34:54','Analyse des aktuellen Budgets für das laufende Quartal'),
			(8, 2,'2024/02/15 10:34:54', '2024/02/28 15:34:54', 'Überprüfung der Ausgaben und Identifizierung von Einsparungsmöglichkeiten'),
			(8, 3, '2024/03/01 09:34:54', '2024/03/14 16:34:54',  'Anpassung des Budgets gemäß den überprüften Ausgaben'),
			(9, 2, '2023/12/28 10:34:54', '2024/01/10 12:34:54', 'Sammlung von Daten für die Marktanalyse'),
			(9, 2, '2024/01/15 15:34:54', '2024/01/28 16:34:54', 'Analyse der gesammelten Daten zur Identifizierung von Geschäftsmöglichkeiten'),
			(9, 1, '2024/02/01 11:34:54', '2024/02/15 17:34:54', 'Erstellung eines Berichts mit den Ergebnissen der Marktanalyse'),
			(10, 3,  '2024/05/01 11:34:54', '2024/05/15 09:34:54', 'Durchführung von Leistungsbewertungen für Mitarbeiter'),
			(10, 2,  '2024/05/20 15:34:54', '2024/06/01 10:34:54', 'Festlegung von Entwicklungszielen für jeden Mitarbeiter'),
			(10, 3, '2024/06/05 09:34:54', '2024/06/12 17:34:54','Führen von Feedbackgesprächen mit Mitarbeitern über ihre Leistung')

		GO

		/***7. Programmiren Sie eine Tabellenwertfunktion ***/


CREATE OR ALTER FUNCTION dbo.ufn_GetAufgabenMitarbeiterSummen(@ProjektID int) 
RETURNS TABLE 
AS 
RETURN
  (SELECT Projekte.ID AS ProjektID,
          Mitarbeiter.ID,
          Projekte.Projektname,
          Aufgaben.Aufgabennamen,
          AufgabenMitarbeiter.Beschreibung,
          Mitarbeiter.Nachname,
          DATEDIFF(hh, aufgabenMitarbeiter.Startzeit, aufgabenMitarbeiter.Endzeit) AS Dauer,
          DATEDIFF(hh, aufgabenMitarbeiter.Startzeit, aufgabenMitarbeiter.Endzeit) * Mitarbeiter.Stundensatz AS Lohn,
          derivedtbl_1.Dauer AS SummeDauer,
          derivedtbl_1.SummeLohn
   FROM Aufgaben
   INNER JOIN aufgabenMitarbeiter ON Aufgaben.ID = aufgabenMitarbeiter.AufgabenID
   INNER JOIN Mitarbeiter ON aufgabenMitarbeiter.MitarbeiterID = Mitarbeiter.ID
   INNER JOIN Projekte ON Aufgaben.ProjektID = Projekte.ID
   INNER JOIN
     (SELECT Mitarbeiter_1.ID,
             SUM(DATEDIFF(hh, aufgabenMitarbeiter_1.Startzeit, aufgabenMitarbeiter_1.Endzeit)) AS Dauer,
             SUM(DATEDIFF(hh, aufgabenMitarbeiter_1.Startzeit, aufgabenMitarbeiter_1.Endzeit) * Mitarbeiter_1.Stundensatz) AS SummeLohn
      FROM aufgabenMitarbeiter AS aufgabenMitarbeiter_1
      INNER JOIN Mitarbeiter AS Mitarbeiter_1 ON aufgabenMitarbeiter_1.MitarbeiterID = Mitarbeiter_1.ID
      GROUP BY Mitarbeiter_1.ID) AS derivedtbl_1 ON aufgabenMitarbeiter.MitarbeiterID = derivedtbl_1.ID
   WHERE (Projekte.ID = @ProjektID) )

  SELECT *
  FROM dbo.ufn_GetAufgabenMitarbeiterSummen(3)
 

   /***8. Erweitern Sie die Tabelle Aufgaben um das Feld erledigt. Programmieren Sie eine  Prozedur um Aufgaben mittels Ihrer ID zu deaktivieren und zu aktivieren.***/

   ALTER TABLE [dbo].[Aufgaben]
ADD Erledigt [bit] NOT NULL DEFAULT 0

GO

CREATE OR ALTER PROCEDURE AKTIVIEREN_Aufgabe_Erledigt(@AufgabeID INT, @Erledigt BIT) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE        [dbo].[Aufgaben]
	SET                        Erledigt = @Erledigt 
WHERE ID = @AufgabeID AND Erledigt <> @Erledigt 

	SELECT @@ROWCOUNT AS AKTIVIEREN_SPALTEN
END
GO

EXEC AKTIVIEREN_Aufgabe_Erledigt @AufgabeID = 5, @Erledigt = 0


 /***9. Schreiben Sie eine Prozedur um in der Tabelle Projekte mittels der Variablen ID das Budget um jeweils 5% zu erhöhen.***/

CREATE OR ALTER PROCEDURE ERHÖHEN_um_5_Pro(@ProjektID INT) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE        [dbo].[Projekte]
	SET                       Budget = (Budget*5)/100 + Budget

WHERE ID = @ProjektID 

	SELECT @@ROWCOUNT AS AKTIVIEREN_SPALTEN
END
GO

EXEC  ERHÖHEN_um_5_Pro @ProjektID = 5