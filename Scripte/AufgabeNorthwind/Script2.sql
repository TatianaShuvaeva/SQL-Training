USE [Northwind]

GO


--Select  [Country], [Region], [City], [PostalCode]
--FROM [dbo].[Customers]
--GROUP BY [Country], [Region], [City], [PostalCode]
--HAVING COUNT(*) > 1

--Select  *
--FROM [dbo].[Customers]
--WHERE (Country = 'Argentina' AND PostalCode = '1010') OR (Country = 'France' AND PostalCode = '44000') OR (Country = 'Mexico' AND PostalCode = '05033' )


SELECT [Country] AS Land, [Region] AS Region, [City] AS Ort, [PostalCode] AS Postleitzahl
INTO Standort
FROM [dbo].[Customers]
GROUP BY [Country], [Region], [City], [PostalCode]


GO

ALTER TABLE [dbo].[Standort] 
ADD ID INT PRIMARY KEY IDENTITY(1,1)


GO

ALTER TABLE [dbo].[Customers]
ADD StandortID INT NOT NULL DEFAULT 0

GO


--90
UPDATE [dbo].[Customers]
SET Customers.StandortID = [dbo].[Standort].ID
FROM [dbo].[Customers]
INNER JOIN [dbo].[Standort]
	ON [Standort].[Land]=[Customers].[Country]
		--AND [Standort].[Region]=[Customers].[Region]
		AND [Standort].[Ort]=[Customers].[City]
		AND [Standort].[Postleitzahl]=[Customers].[PostalCode]

--SELECT Country, Customers.Region, City, PostalCode, StandortID, Standort.Land, Standort.Region, Standort.Ort,Standort.Postleitzahl, Standort.ID
--FROM Customers
--INNER JOIN Standort ON Standort.ID = Customers.StandortID
--ORDER BY Country, Customers.Region, City, PostalCode

--1
UPDATE [dbo].[Customers]
SET Customers.StandortID = [dbo].[Standort].ID
FROM [dbo].[Customers]
INNER JOIN [dbo].[Standort]
	ON [Standort].[Land]=[Customers].[Country]
		AND [Standort].[Region]=[Customers].[Region]
		AND [Standort].[Ort]=[Customers].[City]
		--AND [Standort].[Postleitzahl]=[Customers].[PostalCode]
WHERE Customers.StandortID = 0


ALTER TABLE [dbo].[Customers] ADD CONSTRAINT FK_Customers_Standort FOREIGN KEY (StandortID) 
	REFERENCES Standort (ID)
GO

DROP INDEX [City] ON [dbo].[Customers]
DROP INDEX [Region] ON [dbo].[Customers]
DROP INDEX [PostalCode] ON [dbo].[Customers]


ALTER TABLE [dbo].[Customers]
	DROP 
	 COLUMN [Country] 
		, COLUMN [Region]
		, COLUMN [City] 
		, COLUMN [PostalCode]

GO
	