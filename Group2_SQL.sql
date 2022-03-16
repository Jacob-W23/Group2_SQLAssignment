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


--- Part 5 --- Join the first two tables and get all of the results. No conditional necessary and no grouping necessary.


--- Part 6 and 7 will be discussed on Docs and In Video ---
