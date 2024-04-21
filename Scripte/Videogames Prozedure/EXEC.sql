USE Videogames

GO
--EXEC [dbo].[DELETE_SPIELER]@ID = 3
--EXEC [dbo].[INSERT_SPIELER]@HerkunftslandID = 32, @Name = 'Alex', @Nickname = 'Alex2000', @MitgliedSeit = '2018-12-24'
EXEC [dbo].[UPDATE_inaktive_Benutzer] @MitgliedSeit = '2013-09-11'

--SELECT * FROM [dbo].[Spieler]
--order by MitgliedSeit asc