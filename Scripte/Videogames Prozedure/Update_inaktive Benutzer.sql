USE [Videogames]
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_ALL_SPIELER_DEAKTIVIEREN]    Script Date: 18.04.2024 22:11:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Tatiana>

-- Description:	<UPDATE Spieler >
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[UPDATE_inaktive_Benutzer] @MitgliedSeit DATE 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE        Spieler
	SET                        Aktiv = 0
	WHERE MitgliedSeit < @MitgliedSeit  AND Aktiv = 1
	SELECT @@ROWCOUNT AS UPDATE_SPALTEN
END
GO


