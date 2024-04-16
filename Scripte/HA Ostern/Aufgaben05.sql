USE [UserDB]
GO
/*** Aufgabe 5***/

SELECT ID
      ,RollenID
      ,Benutzer
      ,Vorname
      ,Nachname
      ,Passwort
      ,Aktiv
      ,Erstelldatum
  FROM [dbo].[Mitarbeiter]
  WHERE ID = 5
GO


