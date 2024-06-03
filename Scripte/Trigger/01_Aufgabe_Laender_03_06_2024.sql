Use [Videogames]

ALTER TABLE [dbo].[Laender]
ADD Del BIT NOT NULL DEFAULT 0

ALTER TABLE [dbo].[Laender]
ADD DelDate DATETIME NULL

GO