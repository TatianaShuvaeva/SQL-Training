USE [Videogames]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Markus>

-- Description:	<Aller Spieler auf Aktiv setzen>
-- =============================================
CREATE OR ALTER PROCEDURE UPDATE_ALL_SPIELER_DEAKTIVIEREN 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE        Spieler
	SET                        Aktiv = 0
	SELECT @@ROWCOUNT AS DEAKTIVIEREN_SPALTEN
END
GO
