USE [master]
GO

CREATE DATABASE [Group2Database]
GO
USE [Group2Database]
GO
SET QUOTED_IDENTIFIER ON
GO


--- Part 1 --- Create a table named Coin with at least five properties from the sample JSON
CREATE TABLE Coin (
	Symbol nvarchar(6) NOT NULL PRIMARY KEY,
	AskPrice float NOT NULL,
	HighPrice float NOT NULL,
	LowPrice float NOT NULL,
	PriceChange float NOT NULL,
)
GO

INSERT INTO Coin (Symbol, AskPrice, HighPrice, LowPrice, PriceChange) VALUES ('ETHBTC', '0.07107800', '0.07168000', '0.06897100', '0.00194800')
GO

--- Part 2 --- 
--- Create a table named AccountOwner with the following properties: ACId, OwnerName, OwnerCreationDate, OwnerStatus where the creation property represents when the owner created their account and where the owner status property is an integer that represents if the owner is active or not. 
--- Use the incrementation of your choosing for ACId. 
CREATE TABLE AccountOwner (
	ACid INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	OwnerName char(100) NOT NULL,
	OwnerCreationDate date NOT NULL,
	OwnerStatus INT NOT NULL,
)

GO

--- Part 3 --- Create a linking entity named OwnerCoin that stores the ACId and the symbol of the coin. The OwnerCoin table will be used to join the two previous tables.
CREATE TABLE OwnerCoin (
	ACid INT NOT NULL,
	Symbol nvarchar(6) NOT NULL,
	PRIMARY KEY (ACid, Symbol)
)

GO

--- Part 4 --- The AccountOwner table should have at least ten accounts. The OwnerCoin table should have five linking instances.
--AccountOwner accounts inserts
SET IDENTITY_INSERT AccountOwner OFF
GO
INSERT INTO AccountOwner(OwnerName, OwnerCreationDate, OwnerStatus)
VALUES ('Cory Kennedy', GETDATE(), 1),
('Breanna Gearing', GETDATE(), 1),
('Todd Howard', GETDATE(), 1),
('Jake Burton', GETDATE(), 1),
('Andrew Reynolds', GETDATE(), 1),
('Ellie Jenkins', GETDATE(), 1),
('Ron Weasley', GETDATE(), 1),
('Paul Rodrigeuz', GETDATE(), 1),
('Sarah Nickleson', GETDATE(), 1),
('Victoria Wednz', GETDATE(), 1)
GO


INSERT INTO OwnerCoin(ACid, Symbol)
VALUES (3,'ETHBTC'),(7,'ETHBTC'),(8,'ETHBTC'),(6,'ETHBTC'),(1,'ETHBTC')
GO

--- Part 5 --- Join the first two tables and get all of the results. No conditional necessary and no grouping necessary.
SELECT AccountOwner.ACid, AccountOwner.OwnerName, AccountOwner.OwnerStatus, AccountOwner.OwnerCreationDate, Coin.Symbol, Coin.AskPrice, Coin.HighPrice,
Coin.LowPrice, Coin.PriceChange FROM AccountOwner 
INNER JOIN OwnerCoin ON OwnerCoin.ACid = AccountOwner.ACid
INNER JOIN Coin ON Coin.Symbol = OwnerCoin.Symbol
