USE [Northwind]
GO

ALTER TABLE [dbo].[Customers] ADD
Firstname NVARCHAR(30) NOT NULL DEFAULT '',
Lastname NVARCHAR(30) NOT NULL DEFAULT ''

GO 

UPDATE [dbo].[Customers]
SET Firstname = SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1),
	Lastname = SUBSTRING(ContactName, CHARINDEX(' ', ContactName) + 1, LEN(ContactName))
GO

ALTER TABLE [dbo].[Customers] DROP COLUMN ContactName

GO

ALTER TABLE [dbo].[Customers] ADD
ID INT IDENTITY(1,1)

GO

ALTER TABLE [dbo].[Orders] ADD
CustomID INT NOT NULL DEFAULT 0

GO


UPDATE [dbo].[Orders] 
SET Orders.CustomID = Customers.ID
FROM Orders
INNER JOIN Customers
	ON Customers.CustomerID = Orders.CustomerID

GO


ALTER TABLE [dbo].[Orders] DROP CONSTRAINT FK_Orders_Customers

GO

ALTER TABLE [dbo].[Customers] DROP CONSTRAINT PK_Customers

GO

ALTER TABLE [dbo].[Customers] ADD PRIMARY KEY (ID)

GO


ALTER TABLE [dbo].[Orders] ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomID)
	REFERENCES dbo.Customers (ID)

GO




GO

