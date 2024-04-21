USE [Videogames]
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_ALL_SPIELER_AKTIVIEREN]    Script Date: 18.04.2024 21:13:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Tatiana>

-- Description:	<INSERT Spieler>
-- =============================================
CREATE OR ALTER  PROCEDURE [dbo].[INSERT_SPIELER] @HerkunftslandID INT,
    @Name VARCHAR(50)
	,@Nickname VARCHAR(50)
	,@Aktiv BIT = 0
	,@MitgliedSeit DATE


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO            Spieler
				([HerkunftslandID], [Name],[Nickname],[Aktiv],[MitgliedSeit])
	VALUES
				(@HerkunftslandID,@Name,@Nickname,@Aktiv,@MitgliedSeit)
	--SELECT @@IDENTITY AS ID, @@ROWCOUNT AS INSERT_SPALTEN
END
GO


