DROP TABLE IF EXISTS Level;
DROP TABLE IF EXISTS SupplyDelivery;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS SuppliesAndServices;
DROP TABLE IF EXISTS BasementRats;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS GuestStatus;
DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS Class;
DROP TABLE IF EXISTS Tavern;
DROP TABLE IF EXISTS Locations;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Statuses;

CREATE TABLE Class (
	ID int IDENTITY(1,1),
	class_name varchar(50)
);

CREATE TABLE Guests (
	ID int IDENTITY(1,1),
	notes varchar(250),
	name varchar(50),
	birthday datetime,
	cakedays datetime,
	status_ID int,
);

CREATE TABLE Users (
	ID int IDENTITY(1,1),
	user_name varchar(50),
	roles varchar(50),
);

Create Table GuestStatus (
		ID int IDENTITY (1,1),
		status_name varchar(50),
);

CREATE TABLE Locations (
	ID int IDENTITY(1,1),
	location_name varchar(50),
);


CREATE TABLE Roles (
	ID int IDENTITY(1,1),
	role_name varchar(50),
	Description varchar(250),
);

GO

CREATE TABLE Tavern (
	ID int IDENTITY(1, 1),
	tavern_name varchar(250),
	FloorsCount int,
	OwnerID int,
	LocationID int,
);

CREATE TABLE BasementRats (
	ID int IDENTITY(1,1),
	rat_name varchar(50),
	tavern_ID varchar(50),
);

CREATE TABLE SuppliesAndServices (
	ID int IDENTITY(1,1),
	tavern_ID int,
	date datetime,
	ServiceOrSupply_name varchar(50),
	unit varchar(25),
	count int,
	status varchar(50)
);

CREATE TABLE Sales (
	ID int IDENTITY(1,1),
	SupplyOrService_ID int,
	guests_ID int,
	price int,
	date_purchased datetime,
	amount_purchased int,
	tavern_ID int,
);

CREATE TABLE Statuses (
	ID int IDENTITY(1,1),
	active bit,
	inactive bit,
	tavern_ID int,
	service_name varchar(50),
	
);

CREATE TABLE SupplyDelivery (
	ID int IDENTITY(1,1),
	SupplyOrService_ID int,
	tavern_ID int,
	cost money,
	amount_received int,
	date datetime,
);

CREATE TABLE Level (
	class_ID int,
	guests_ID int,
	Level int,
);

INSERT INTO Locations
Values ('pluto'), ('New Jersey'), ('Boston'), ('Isengard'), ('mars');

SELECT * FROM Locations;

INSERT INTO Users (user_name, roles)
Values ('John', 'Owner'), ('Joe', 'Cook'),('Garfield', 'Owner'), ('Goku', 'Dish Washer'), ('Bob', 'Delivery Handler');

SELECT * FROM Users;

INSERT INTO Tavern (tavern_name, FloorsCount, OwnerID, LocationID)
Values ('Johns Tavern', 10, 1, 4), ('Joes Tavern', 7, 2, 5), ('Boba Bubble Bois', 3, 3, 2),
	   ('Garbage Goober', 1, 3, 3), ('Garfields Cabin', 7, 4, 4);

SELECT * FROM Tavern;

INSERT INTO Roles (role_name, Description)
Values ('Owner', 'Owner of a tavern'), ('Cook', 'Taverns cook'), ('Delivery handler', 'In charge of shipping and receiving'),
	   ('Dish Washer', 'Washes Dishes'), ('Bar Tender', 'Serves alcoholic beverages');

SELECT * FROM Roles;

INSERT INTO BasementRats (rat_name, tavern_ID)
Values ('Steve', 1), ('Margeret', 5), ('Killer', 3), ('Morty', 3), ('Luffy', 2);

ALTER TABLE BasementRats ADD PRIMARY KEY (ID);

SELECT * FROM BasementRats;

DROP TABLE IF EXISTS BasementRats;

INSERT INTO SuppliesAndServices (tavern_ID, date, ServiceOrSupply_name, unit, count, status)
Values (1, '2007-05-08 12:35:29.123', 'salt', 'pounds', 100, 1), (4, '2009-05-08 12:35:29.123', 'beer', 'bottles', 500, 0), 
	   (3, '2017-05-08 11:27:29.123', 'garbage bags', 'boxes', 25, 0), (3, '2020-12-08 13:35:29.123', 'milk', 'cartons', 4, 1),
	   (2, '2021-04-25 15:21:29.123', 'sugar', 'pounds', 10, 1), (4, '2022-04-21 16:45:29.573', 'massage', 'one service', 10, 0);

SELECT * FROM SuppliesAndServices;

INSERT INTO SupplyDelivery (SupplyOrService_ID, tavern_ID, cost, amount_received, date)
Values (2, 3, 10.25, 10, '2022-08-08 12:00:00.123'), (3, 4, 100.27, 30, '2022-02-24 18:41:00.123'),
	   (1, 2, 200.25, 200, '2022-01-21 11:54:00.123' ), (4, 4, 20.00, 50, '2021-12-03 17:17:00.000'),
	   (5, 5, 271.15, 50, '2022-03-30 15:36:00.000');

SELECT * FROM SupplyDelivery;

INSERT INTO Statuses (active, inactive, tavern_ID, service_name)
Values (0, 1, 3, 'bar'), (1, 0, 5,'pool'), (0, 1, 1, 'music'), (1, 0, 2, 'kitchen'), (1, 0, 4, 'massage');

SELECT * FROM Statuses;

INSERT INTO Sales (SupplyOrService_ID, guests_ID, price, date_purchased, amount_purchased, tavern_ID)
Values (1, 3, 25, '2022-02-02 10:25:00.000', 1, 1), 
	   (6, 4, 50, '2021-11-15 18:30:00.000', 2, 3),
	   (5, 1, 200.70, '2022-11-15 18:30:00.000', 21, 4),
	   (5, 2, 25, '2022-05-18 09:00:00.000', 3, 5),
	   (2, 5, 25, '2022-06-04 16:50:00.000', 2, 2);

SELECT * FROM Sales;

INSERT INTO Class (class_name) 
Values ('mage'), ('warrior'), ('archer'), ('technician'), ('worker');

SELECT * FROM Class;

INSERT INTO Level (class_ID, guests_ID, Level)
Values (1, 3, 5), (3, 2, 4), (4, 4, 4), (4, 3, 4), (4, 5, 2);

SELECT * FROM Level;

INSERT INTO Guests (notes, name, birthday, cakedays, status_ID)
VALUES ('very cool', 'megu', '2022-11-17 21:00:00.000','2022-11-17 21:00:00.000', 1), 
	   ('super nice and super strong', 'ducky', '2022-11-17 21:00:00.000', '2022-11-17 21:00:00.000', 3),
	   ('leader of the kuzon alliance', 'shifonia', '2022-11-17 21:00:00.000', '2022-11-17 21:00:00.000', 5), 
	   ('officer of the tremain alliance', 'bargar', '2022-11-17 21:00:00.000', '2022-11-17 21:00:00.000', 4), 
	   ('king of gondor', 'aragorn', '2022-11-17 21:00:00.000', '2022-11-17 21:00:00.000', 5);

SELECT * FROM Guests;

INSERT INTO GuestStatus (status_name)
VALUES ('hangry'), ('happy'), ('sad'), ('frustrated'), ('thirsty');

SELECT * FROM GuestStatus;

ALTER TABLE Class ADD PRIMARY KEY (ID);
ALTER TABLE Users ADD PRIMARY KEY (ID);
ALTER TABLE GuestStatus ADD PRIMARY KEY (ID);
ALTER TABLE Locations ADD PRIMARY KEY (ID);
ALTER TABLE Roles ADD PRIMARY KEY (ID);

ALTER TABLE Guests ADD PRIMARY KEY (ID);
ALTER TABLE Guests ADD FOREIGN KEY (status_ID) REFERENCES GuestStatus (ID);

ALTER TABLE Tavern ADD PRIMARY KEY (ID);
ALTER TABLE Tavern ADD FOREIGN KEY (OwnerID) REFERENCES Users (ID);
ALTER TABLE Tavern ADD FOREIGN KEY (LocationID) REFERENCES Locations (ID);

ALTER TABLE SuppliesAndServices ADD PRIMARY KEY (ID);
ALTER TABLE SuppliesAndServices ADD FOREIGN KEY (tavern_ID) REFERENCES Tavern (ID);

ALTER TABLE Sales ADD PRIMARY KEY (ID);
ALTER TABLE Sales ADD FOREIGN KEY (SupplyOrService_ID) REFERENCES SuppliesAndServices (ID);
ALTER TABLE Sales ADD FOREIGN KEY (guests_ID) REFERENCES Guests (ID);
ALTER TABLE Sales ADD FOREIGN KEY (tavern_ID) REFERENCES Tavern (ID);

ALTER TABLE Statuses ADD PRIMARY KEY (ID);
ALTER TABLE Statuses ADD FOREIGN KEY (tavern_ID) REFERENCES Tavern (ID);

ALTER TABLE SupplyDelivery ADD PRIMARY KEY (ID);
ALTER TABLE SupplyDelivery ADD FOREIGN KEY (SupplyOrService_ID) REFERENCES SuppliesAndServices (ID);

ALTER TABLE Level ADD FOREIGN KEY (class_ID) REFERENCES Class (ID);
ALTER TABLE Level ADD FOREIGN KEY (guests_ID) REFERENCES Guests (ID);


/*
DROP TABLE IF EXISTS Tavern;
-Fails because it is being used by the Statuses table, SuppliesAndServices table, and the Sales table
INSERT INTO Level (guests_ID) VALUES (56);
-Fails because of invalid foreign key insertions
DELETE FROM Guests WHERE name='megu';
-Fails because it attempts to delete a record with a primary key
UPDATE Tavern SET OwnerID=6 WHERE ID=1;
-Fails do to attempting to update a foreign id
*/