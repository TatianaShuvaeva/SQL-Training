/*** 1. Erstellen Sie 2 neue Tabellen ***/

USE [ProjektDB]

GO

CREATE TABLE dbo.Status
(    ID INT PRIMARY KEY
			IDENTITY (1,1),
	StatusName NVARCHAR(50)

);

GO

USE [ProjektDB]

GO


CREATE TABLE Abteilung 
(    ID INT PRIMARY KEY
			IDENTITY (1,1),
	AbteilungName NVARCHAR(50)

);

GO

/***3. Füllen Sie  die zwei neuen Tabellen mit mindestens 3 Datensätzen ***/

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

INSERT INTO [dbo].[Abteilung]
			(AbteilungName)

VALUES 
			('Management'),
			('Marketingabteilung'),
			('Entwicklungsabteilung')
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

ALTER TABLE  [dbo].[Aufgaben] ADD CONSTRAINT FK_Aufgaben_Status FOREIGN KEY (StatusID)
	REFERENCES Status(ID)

GO

USE [ProjektDB]

GO

ALTER TABLE [dbo].[Aufgaben]
	DROP
	COLUMN [Status]

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


USE [ProjektDB]

GO

ALTER TABLE [dbo].[Teilaufgaben] ADD CONSTRAINT FK_Teilaufgaben_Aufgaben FOREIGN KEY (AufgabenID)
	REFERENCES Aufgaben (ID)

GO


USE [ProjektDB]

GO

ALTER TABLE [dbo].[Teilaufgaben] ADD CONSTRAINT FK_Teilaufgaben_Mitarbeiter FOREIGN KEY (MitarbeiterID)
	REFERENCES Mitarbeiter (ID)

GO

USE [ProjektDB]

GO

ALTER TABLE [dbo].[Teilaufgaben] ADD CONSTRAINT FK_Teilaufgaben_Status FOREIGN KEY (StatusID)
	REFERENCES [dbo].[Status] (ID)

GO



/***6. Tragen Sie mindestens 30 Datensätze in Ihre neue Tabelle ein ***/

USE [ProjektDB]

GO

INSERT INTO [dbo].[Teilaufgaben]
			([AufgabenID]
			,[TeilaufgabenName]
			, [Beschreibung]
			, [Startdatum]
			, [Enddatum]
			, [Zeitaufwand]
			, [MitarbeiterID]
			, [StatusID])
			

VALUES 
			(1, 'Planung der Website-Überarbeitung', 'Entwicklung eines detaillierten Plans zur Modernisierung der Unternehmenswebsite', '2023/05/07', '2023/06/07', 30, 1, 2),
			(1, 'Designkonzept erstellen', 'Erstellung von Designkonzepten für das neue Layout der Website', '2023/06/10', '2023/07/10', 40, 2, 2),
			(1, 'Implementierung des neuen Designs', 'Umsetzung des genehmigten Designkonzepts auf der Website', '2023/07/15', '2023/08/15', 60, 1, 1 ),
			(2, 'Umfrage erstellen', 'Entwicklung eines Fragebogens zur Kundenbefragung', '2023/06/17', '2023/07/01', 20, 3, 4),
			(2, 'Umfrage durchführen', 'Durchführung der Kundenumfrage gemäß dem entwickelten Fragebogen', '2023/07/05', '2023/08/05', 30, 1, 1),
			(2, 'Ergebnisse analysieren', 'Analyse der Umfrageergebnisse und Erstellung eines Berichts', '2023/08/10', '2023/09/10', 40, 3, 5),
			(3, 'Anforderungsanalyse durchführen', 'Analyse der Kundenanforderungen für das neue Produkt', '2023/12/28', '2024/01/15', 40, 1, 4),
			(3, 'Prototyp entwickeln', 'Entwicklung eines Prototyps basierend auf den Kundenanforderungen', '2024/01/20', '2024/02/20', 60, 2, 5 ),
			(3, 'Produkttests durchführen', 'Durchführung von Tests am Prototypen und Sammeln von Feedback', '2024/02/25', '2024/03/25', 50, 1, 1),
			(4, 'Zielgruppenanalyse durchführen', 'Durchführung einer Analyse zur Identifizierung der Zielgruppen für die Marketingkampagne', '2024/01/05', '2024/01/15', 30, 3, 3),
			(4, 'Kampagnenstrategie entwickeln', 'Entwicklung einer Strategie für die Marketingkampagne basierend auf der Zielgruppenanalyse', '2024/01/20', '2024/02/10', 40, 1, 3),
			(4, 'Umsetzung der Kampagne', 'Umsetzung der Marketingkampagne gemäß der entwickelten Strategie', '2024/02/15', '2024/03/14', 50, 1, 4),
			(5, 'Schulungsinhalte entwickeln', 'Entwicklung von Schulungsinhalten für neue Mitarbeiter', '2023/12/28', '2024/01/10', 30, 2, 2),
			(5, 'Schulungen durchführen', 'Durchführung von Schulungen für neue Mitarbeiter gemäß den entwickelten Inhalten', '2024/01/15', '2024/02/15', 40, 1, 5),
			(5, 'Feedback sammeln', 'Sammeln von Feedback von den Teilnehmern der Schulungen und Anpassung der Inhalte', '2024/02/20', '2024/03/15', 30, 3, 1),
			(6, 'Produkttests durchführen', 'Durchführung von Tests zur Überprüfung der Produktqualität', '2024/01/09', '2024/02/09', 40, 1, 1),
			(6, 'Feedback der Kunden sammeln', 'Sammeln von Feedback der Kunden bezüglich der Produktqualität', '2024/02/12', '2024/03/12', 30, 2, 2),
			(6, 'Verbesserungsmaßnahmen umsetzen', 'Umsetzung von Verbesserungsmaßnahmen basierend auf dem gesammelten Feedback', '2024/03/15', '2024/04/15', 50, 2, 5),
			(7, 'Veranstaltungsort auswählen', 'Auswahl eines geeigneten Veranstaltungsortes für das Unternehmensevent', '2024/01/22', '2024/02/05', 20, 2, 1),
			(7, 'Programm planen', 'Planung des Programms und der Aktivitäten für das Unternehmensevent', '2024/02/10', '2024/02/25', 30, 1, 4),
			(7, 'Durchführung des Events', 'Durchführung des Unternehmensevents gemäß dem geplanten Programm', '2024/03/01', '2024/03/14', 40, 3, 3),
			(8, 'Budget analysieren', 'Analyse des aktuellen Budgets für das laufende Quartal', '2024/01/30', '2024/02/10', 20, 1, 2),
			(8, 'Ausgaben überprüfen', 'Überprüfung der Ausgaben und Identifizierung von Einsparungsmöglichkeiten', '2024/02/15', '2024/02/28', 30, 2, 4),
			(8, 'Budget anpassen', 'Anpassung des Budgets gemäß den überprüften Ausgaben', '2024/03/01', '2024/03/14', 30, 3, 1),
			(9, 'Daten sammeln', 'Sammlung von Daten für die Marktanalyse', '2023/12/28', '2024/01/10', 20, 2, 5),
			(9, 'Daten analysieren', 'Analyse der gesammelten Daten zur Identifizierung von Geschäftsmöglichkeiten', '2024/01/15', '2024/01/28', 30, 2, 3),
			(9, 'Bericht erstellen', 'Erstellung eines Berichts mit den Ergebnissen der Marktanalyse', '2024/02/01', '2024/02/15', 30, 1, 4),
			(10, 'Leistungsbewertungen durchführen', 'Durchführung von Leistungsbewertungen für Mitarbeiter', '2024/05/01', '2024/05/15', 30, 3, 5),
			(10, 'Entwicklungsziele festlegen', 'Festlegung von Entwicklungszielen für jeden Mitarbeiter', '2024/05/20', '2024/06/01', 20, 2, 3),
			(10, 'Feedbackgespräche führen', 'Führen von Feedbackgesprächen mit Mitarbeitern über ihre Leistung', '2024/06/05', '2024/06/12', 20, 3, 1)

		GO

