USE [UserDB]
GO

/****** Aufgabe 1 ******/


CREATE TABLE Rollen (
	ID int IDENTITY(1,1) NOT NULL,
	Rolle nvarchar(50) NOT NULL,
 CONSTRAINT [PK_Rollen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Mitarbeiter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RollenID] [int] NOT NULL,
	[Benutzer] [nvarchar](50) NOT NULL,
	[Vorname] [nvarchar](50) NOT NULL,
	[Nachname] [nvarchar](50) NOT NULL,
	[Passwort] [nvarchar](50) NOT NULL,
	[Aktiv] [bit] NOT NULL,
	[Erstelldatum] [datetime] NOT NULL,
	CONSTRAINT AK_Benutzer UNIQUE(Benutzer),

CONSTRAINT [PK_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [FK_Mitarbeiter_Rollen] FOREIGN KEY([RollenID])
REFERENCES [dbo].[Rollen] ([ID])
GO

ALTER TABLE [dbo].[Mitarbeiter] CHECK CONSTRAINT [FK_Mitarbeiter_Rollen]
GO


