

USE [UserDB]
GO


/***Aufgabe 2***/


INSERT INTO [dbo].[Rollen]
      ([Rolle])
VALUES
      ('Benutzer'),
      ('Administrator'),
      ('Superadmin')
GO



INSERT INTO [dbo].[Mitarbeiter]
      ([RollenID]
      ,[Benutzer]
      ,[Vorname]
      ,[Nachname]
      ,[Passwort]
      ,[Aktiv]
      ,[Erstelldatum])
VALUES
      (3, 'RobinGud', 'Robin', 'Schmidt', '842fskop', 1, '2024/31/01 15:30:34'),
      (2, 'Lorie612', 'Lorie', 'Fischer', 'sd01kofwfdl', 1, '2024/31/01 15:34:54'),
      (1, 'Roger985', 'Roger', 'Meyer', '44jidlalk', 1, '2024/31/01 16:23:34'),
      (1, 'Levi612', 'Levi', 'Weber', 'r8jfsbnm3789', 0, '2024/01/02 10:56:21'),
      (1, 'Erica942', 'Erica', 'Schulz', 'djhs89e32', 1, '2024/02/02 19:34:51'),
      (1, 'Larry006', 'Larry', 'Wagner', '8fhjsk22490ffsk', 1, '2024/03/02 20:11:45'),
      (1, 'Ivan567', 'Ivan', 'Becker', 'jkd902ejs', 1, '2024/24/02 22:09:51'),
      (1, 'Betsy22', 'Betsy', 'Hoffmann', '9dj23jl09', 0, '2024/28/02 12:12:21'),
      (1, 'Lilian2002', 'Lilian', 'Koch', '2904hfsnmk29', 1, '2024/03/03 14:23:51'),
      (1, 'Tommy15', 'Tommy', 'Bauer', '2mklfhs9824', 0, '2024/04/03 12:15:17')
GO


