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
	PriceChange float NOT NULL, 
)

GO

--- Part 3 --- Create a linking entity named OwnerCoin that stores the ACId and the symbol of the coin. The OwnerCoin table will be used to join the two previous tables.
CREATE TABLE OwnerCoin (
	ACid INT NOT NULL,
	Symbol nvarchar(6) NOT NULL,
	PRIMARY KEY (ACid, Symbol),
	FOREIGN KEY (ACid) REFERENCES AccountOwner(ACid),
	FOREIGN KEY (Symbol) REFERENCES Coin(Symbol)
)

GO

--- Part 4 --- The AccountOwner table should have at least ten accounts. The OwnerCoin table should have five linking instances.
--AccountOwner accounts inserts
SET IDENTITY_INSERT AccountOwner ON
INSERT INTO AccountOwner(ACid, OwnerName, OwnerCreationDate, OwnerStatus, PriceChange)
VALUES (1, 'Cory Kennedy', GETDATE(), 1, 0.10),
(2, 'Breanna Gearing', GETDATE(), 1, 0.50),
(3, 'Todd Howard', GETDATE(), 1, 0.60),
(4, 'Jake Burton', GETDATE(), 1, 0.75),
(5, 'Andrew Reynolds', GETDATE(), 1, 4.69),
(6, 'Ellie Jenkins', GETDATE(), 1, 0.55),
(7, 'Ron Weasley', GETDATE(), 1, 0.88),
(8, 'Paul Rodrigeuz', GETDATE(), 1, 0.01),
(9, 'Sarah Nickleson', GETDATE(), 1, 2.11),
(10, 'Victoria Wednz', GETDATE(), 1, 3.60)
GO

--- Part 5 --- Join the first two tables and get all of the results. No conditional necessary and no grouping necessary.


--- Part 6 and 7 will be discussed on Docs and In Video ---
