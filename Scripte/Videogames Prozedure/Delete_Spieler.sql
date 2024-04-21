USE [Videogames]
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_ALL_SPIELER_DEAKTIVIEREN]    Script Date: 18.04.2024 20:52:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Markus>

-- Description:	<Aller Spieler auf Aktiv setzen>
-- =============================================
CREATE OR ALTER   PROCEDURE [dbo].[DELETE_SPIELER](@ID INT) 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE        Spieler
	
	WHERE        (ID = @ID)
	SELECT @@ROWCOUNT AS DELETE_SPALTEN
END
GO


