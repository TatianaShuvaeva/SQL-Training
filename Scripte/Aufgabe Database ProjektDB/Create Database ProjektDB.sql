/*** 1. Erstellen Sie eine Datenbank mit dem Namen ProjektDB ***/

USE master

Create Database ProjektDB;

GO


/*** 2. Tabelle Projekte erstellen ***/
USE [ProjektDB]

GO

CREATE TABLE dbo.Projekte
(	ID INT PRIMARY KEY
             IDENTITY(1,1),
	Projektname NVARCHAR(255) NOT NULL,
	Startdatum DATE,
	Enddatum DATE,
	Budget DECIMAL(18,2)
);

GO
/*** 3. Tabelle Mitarbeiter erstellen ***/
USE [ProjektDB]

GO

CREATE TABLE dbo.Mitarbeiter
(	ID INT PRIMARY KEY
           IDENTITY(1,1),
	Vorname NVARCHAR(50),
	Nachname NVARCHAR(50),
	Abteilung NVARCHAR(100),
);
GO
/*** 4. Tabelle Aufgaben erstellen ***/

USE [ProjektDB]

GO

CREATE TABLE dbo.Aufgaben
(	ID INT PRIMARY KEY
           IDENTITY(1,1),
	Aufgabennamen NVARCHAR(255) NOT NULL,
	Beschreibung TEXT,
	Startdatum DATE,
	Enddatum DATE,
	Status NVARCHAR(50),
	ProjektID INT,
	MitarbeiterID INT
	FOREIGN KEY (ProjektID) REFERENCES Projekte(ID),
	FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(ID)
);

GO
/*** 5. Füllen Sie die Tabelle Projekte mit 5 Projekten (Projekt 1 bis 5) ***/

USE [ProjektDB]

GO

INSERT INTO [dbo].[Projekte]
           (
            [Projektname]
           ,[Startdatum]
           ,[Enddatum]
           ,[Budget])
     VALUES
           ('Website Redesign', '2023/01/23', '2023/06/14', 30000),
           ('Product Launch', '2023/01/29', '2023/07/15', 45000),
		   ('Marketing Campaign', '2023/02/02', '2023/07/14', 52000),
		   ('Software Development', '2023/03/11', '2023/05/10', 18000),
		   ('Training Program', '2023/04/23', '2023/10/21', 69999)
GO

/*** 6. Füllen Sie die Tabelle Mitarbeiter mit 3 Datensätzen ***/


USE [ProjektDB]

GO

INSERT INTO [dbo].[Mitarbeiter]
           (
            [Vorname]
           ,[Nachname]
           ,[Abteilung])
     VALUES
           ('Robin', 'Schmidt', 'abt.01'),
           ('Lorie', 'Fischer', 'abt.02'),
		   ('Roger', 'Meyer', 'abt.03')
	GO	 
	
/*** 7. Füllen Sie die Tabelle Aufgaben mit 10 Datensätzen ***/

USE [ProjektDB]

GO

INSERT INTO [dbo].[Aufgaben]
           (
            [Aufgabennamen]
           ,[Beschreibung]
           ,[Startdatum]
		   ,[Enddatum]
		   ,[Status]
		   ,[ProjektID]
		   ,[MitarbeiterID])
     VALUES
           ('Website Redesign', 'Überarbeitung der Unternehmenswebsite für ein moderneres Design', '2023/05/07', '2023/12/12', 'ZURÜCKGEGEBEN', 1,1),
           ('Kundenbefragung', 'Durchführung einer Umfrage zur Kundenzufriedenheit und Analyse der Ergebnisse', '2023/06/17', '2023/12/20', 'Abgeschlossen', 2, 1),
		   ('Produktentwicklung', 'Entwicklung eines neuen Produkts basierend auf den Kundenanforderungen', '2023/12/28', '2024/05/03', 'IN BEARBEITUNG', 3, 1),
	       ('Marketingkampagne', ' Planung und Durchführung einer Marketingkampagne zur Steigerung der Markenbekanntheit', '2024/01/05', '2024/03/14', 'UNVOLLSTÄNDIG', 4, 2),
		   ('Schulungsprogramm', 'Organisation von Schulungen für neue Mitarbeiter zur Einarbeitung in Unternehmensprozesse', '2023/12/28', '2024/12/12', 'IN BEARBEITUNG', 5, 3),
		   ('Qualitätssicherung', 'Überprüfung der Produktqualität und Implementierung von Verbesserungsmaßnahmen', '2024/01/09', '2025/12/12', 'IN BEARBEITUNG', 4, 3),
		   ('Eventplanung', 'Planung und Organisation eines Unternehmensevents zur Kundenbindung', '2024/01/22', '2024/12/28', 'IN BEARBEITUNG', 5, 1),
		   ('Budgetüberprüfung', 'Überprüfung des Budgets für das laufende Quartal und Anpassung der Ausgaben', '2024/01/30', '2025/01/06', 'IN BEARBEITUNG', 2, 2),
		   ('Marktforschung', 'Durchführung einer Marktanalyse zur Identifizierung neuer Geschäftsmöglichkeiten', '2023/12/28', '2024/01/06','Abgeschlossen', 5, 3),
		   ('Mitarbeiterbewertung', 'Durchführung von Leistungsbewertungen für Mitarbeiter und Festlegung von Entwicklungszielen', '2024/05/01', '2025/06/12', 'Geplant', 3, 2)

GO

/*** 8. Erstellen Sie ein Script um Login User und einen User ***/

USE master

CREATE LOGIN ProjektAdmin WITH PASSWORD = 'Test1234!' --USE [ProjektDB]

GO

CREATE USER ProjektAdmin FOR LOGIN ProjektAdmin

GO

ALTER ROLE db_owner ADD MEMBER ProjektAdmin

GO