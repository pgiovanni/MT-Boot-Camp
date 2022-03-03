DROP TABLE IF EXISTS Level;
DROP TABLE IF EXISTS SupplyDelivery;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS SuppliesAndServices;
DROP TABLE IF EXISTS BasementRats;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS GuestStatus;
DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS Class;
DROP TABLE IF EXISTS Locations;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Tavern;

CREATE TABLE Class (
	ID int IDENTITY(1,1),
	mage varchar(50),
	warrior varchar(50),
	archer varchar(50),
);

CREATE TABLE Guests (
	ID int IDENTITY(1,1),
	notes varchar(250),
	birthday datetime,
	cakedays datetime,
);

CREATE TABLE Users (
	ID int IDENTITY(1,1),
	user_name varchar(50),
	roles varchar(50),
);

Create Table GuestStatus (
		ID int IDENTITY (1,1),
		hangry bit,
		mad bit,
		happy bit,
		sleepy bit,
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
	ID int PRIMARY KEY IDENTITY(1, 1),
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
	guest varchar(50),
	price int,
	date_purchased datetime,
	amount_purchased int,
	tavern_ID varchar(50),
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
	guest_ID int,
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

INSERT INTO BasementRats (rat_name)
Values ('Steve'), ('Margeret'), ('Killer'), ('Morty'), ('Luffy');

SELECT * FROM BasementRats;

DROP TABLE IF EXISTS BasementRats;

INSERT INTO SuppliesAndServices (tavern_ID, date, ServiceOrSupply_name, unit, count)
Values (1, '2007-05-08 12:35:29.123', 'salt', 'pounds', 100), (4, '2009-05-08 12:35:29.123', 'beer', 'bottles', 500), 
	   (3, '2017-05-08 11:27:29.123', 'garbage bags', 'boxes', 25), (3, '2020-12-08 13:35:29.123', 'milk', 'cartons', 4),
	   (2, '2021-04-25 15:21:29.123', 'sugar', 'pounds', 10);

SELECT * FROM SuppliesAndServices;

INSERT INTO SupplyDelivery (SupplyOrService_ID, tavern_ID, cost, amount_received, date)
Values (2, 3, 10.25, 10, '2022-08-08 12:00:00.123'), (3, 4, 100.27, 30, '2022-02-24 18:41:00.123'),
	   (1, 2, 200.25, 200, '2022-01-21 11:54:00.123' ), (4, 4, 20.00, 50, '2021-12-03 17:17:00.000'),
	   (5, 5, 271.15, 50, '2022-03-30 15:36:00.000');

SELECT * FROM SupplyDelivery;

INSERT INTO Statuses (active, inactive, tavern_ID, service_name)
Values (0, 1, 3, 'bar'), (1, 0, 5,'pool'), (0, 1, 1, 'music'), (1, 0, 2, 'kitchen'), (1, 0, 4, 'massage');

SELECT * FROM Statuses;

/*Sales*/
INSERT INTO Sales (SupplyOrService_ID, guest, price, date_purchased, amount_purchased, tavern_ID)
Values ('massage', 'Bob Melendez', 25, '2022-02-02 10:25:00.000', 1, 1), 
	   ('massage', 'Steve Jobs', 50, '2021-11-15 18:30:00.000', 2, 3),
	   ('bar', 'Bob Marley', 200.70, '2022-11-15 18:30:00.000', 21, 4),
	   ('pool', 'Elon Musk', 25, '2022-05-18 09:00:00.000', 3, 5),
	   ('music', 'Harry Potter', 25, '2022-06-04 16:50:00.000', 2, 2);

SELECT * FROM Sales;

ALTER TABLE Class ADD PRIMARY KEY (ID);
ALTER TABLE Guests ADD PRIMARY KEY (ID);
ALTER TABLE Users ADD PRIMARY KEY (ID);
ALTER TABLE GuestStatus ADD PRIMARY KEY (ID);
ALTER TABLE Locations ADD PRIMARY KEY (ID);
ALTER TABLE Roles ADD PRIMARY KEY (ID);
ALTER TABLE BasementRats ADD PRIMARY KEY (ID);

ALTER TABLE Tavern ADD PRIMARY KEY (ID);
ALTER TABLE Tavern ADD FOREIGN KEY (OwnerID) REFERENCES Users (ID);
ALTER TABLE Tavern ADD FOREIGN KEY (LocationID) REFERENCES Locations (ID);

ALTER TABLE BasementRats ADD PRIMARY KEY (ID);
ALTER TABLE BasementRats ADD FOREIGN KEY (tavern_ID) REFERENCES Tavern (ID);

ALTER TABLE SuppliesAndServices ADD PRIMARY KEY (ID);
ALTER TABLE SuppliesAndServices ADD FOREIGN KEY (tavern_ID) REFERENCES Tavern (ID);

ALTER TABLE Sales ADD PRIMARY KEY (ID);
ALTER TABLE Sales ADD FOREIGN KEY (SupplyOrService_ID) REFERENCES SuppliesAndServices (ID);

ALTER TABLE Statuses ADD PRIMARY KEY (ID);
ALTER TABLE Statuses ADD FOREIGN KEY (tavern_ID) REFERENCES Tavern (ID);

ALTER TABLE SupplyDelivery ADD PRIMARY KEY (ID);
ALTER TABLE SupplyDelivery ADD FOREIGN KEY (SupplyOrService_ID) REFERENCES SuppliesAndServices (ID);

ALTER TABLE Level ADD FOREIGN KEY (class_ID) REFERENCES Class (ID);
ALTER TABLE Level ADD FOREIGN KEY (guests_ID) REFERENCES Guests (ID);
