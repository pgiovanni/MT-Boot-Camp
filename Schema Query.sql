DROP TABLE IF EXISTS Users
DROP TABLE IF EXISTS Tavern;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS BasementRats;
DROP TABLE IF EXISTS Locations;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS SupplyDelivery;
DROP TABLE IF EXISTS Services;
DROP TABLE IF EXISTS ServiceSales;
DROP TABLE IF EXISTS Status;

CREATE TABLE Tavern (
	ID int IDENTITY(1, 1),
	tavern_name varchar(250),
	FloorsCount int,
	OwnerID int,
	LocationID int
);

CREATE TABLE Users (
	ID int IDENTITY(1,1),
	user_name varchar(50),
	roles varchar(50),
);

CREATE TABLE Roles (
	ID int IDENTITY(1,1),
	role_name varchar(50),
	Description varchar(250),
);

CREATE TABLE BasementRats(
	ID int IDENTITY(1,1),
	rat_name varchar(50),
);

CREATE TABLE Locations (
	 ID int IDENTITY(1,1),
	location_name varchar(50),
);

CREATE TABLE Supplies (
	ID int IDENTITY(1,1),
	tavern_ID int,
	date datetime,
	supply_name varchar(50),
	unit varchar(25),
	count int,
);

CREATE TABLE SupplyDelivery (
	ID int IDENTITY(1,1),
	supply_ID int,
	tavern_ID int,
	cost money,
	amount_received int,
	date datetime,
);

CREATE TABLE Services (
	ID int IDENTITY(1,1),
	service_name varchar(50),
	status varchar(50),
);

CREATE TABLE Status (
	ID int IDENTITY(1,1),
	active bit,
	inactive bit,
	tavern_ID int,
	service_name varchar(50),
);

CREATE TABLE ServiceSales (
	ID int IDENTITY(1,1),
	service_name varchar(50),
	guest varchar(50),
	price int,
	date_purchased datetime,
	amount_purchased int,
	tavern_ID varchar(50),
);

/* 
Insert Statements 
5 Inserts into Tavern table
*/

/* 5 inserts into Tavern table */
INSERT INTO Tavern (tavern_name, FloorsCount, OwnerID, LocationID)
Values ('Johns Tavern', 10, 3, 5);

INSERT INTO Tavern (tavern_name, FloorsCount, OwnerID, LocationID) 
Values ('Joes Tavern', 7, 3, 5);

INSERT INTO Tavern (tavern_name, FloorsCount, OwnerID, LocationID) 
Values ('Boba Bubble Bois', 3, 2, 1);

INSERT INTO Tavern (tavern_name, FloorsCount, OwnerID, LocationID)
Values ('Garbage Goober', 1, 1, 3);

INSERT INTO Tavern (tavern_name, FloorsCount, OwnerID, LocationID) 
Values('Garfields Cabin', 7, 1, 2);

/*Test data was inserted and seeds are counting*/
SELECT * FROM Tavern;

/*User insert statements */
INSERT INTO Users (user_name, roles)
Values ('John', 'Owner');

INSERT INTO Users (user_name, roles)
Values ('Joe', 'Cook');

INSERT INTO Users (user_name, roles)
Values ('Garfield', 'Owner');

INSERT INTO Users (user_name, roles)
Values ('Goku', 'Dish Washer');

INSERT INTO Users (user_name, roles)
Values ('Bob', 'Delivery Handler');

SELECT * FROM Users;

/*Roles insert statements*/
INSERT INTO Roles (role_name, Description)
Values ('Owner', 'Owner of a tavern');

INSERT INTO Roles (role_name, Description)
Values ('Cook', 'Taverns cook');

INSERT INTO Roles (role_name, Description)
Values ('Delivery handler', 'In charge of shipping and receiving')

INSERT INTO Roles (role_name, Description)
Values ('Dish Washer', 'Washes Dishes');

INSERT INTO Roles (role_name, Description)
Values ('Bar Tender', 'Serves alcoholic beverages');

SELECT * FROM Roles;

/*Basement Rats*/
INSERT INTO BasementRats (rat_name)
Values ('Steve');

INSERT INTO BasementRats (rat_name)
Values ('Margeret');

INSERT INTO BasementRats (rat_name)
Values ('Killer');

INSERT INTO BasementRats (rat_name)
Values ('Morty');

INSERT INTO BasementRats (rat_name)
Values ('Luffy');

SELECT * FROM BasementRats;

/*Locations*/
INSERT INTO Locations
Values ('mars');

INSERT INTO Locations
Values ('pluto');

INSERT INTO Locations 
Values ('New Jersey');

INSERT INTO Locations 
Values ('Boston');

INSERT INTO Locations 
Values ('Isengard');

SELECT * FROM Locations;

/*Supplies*/
INSERT INTO Supplies (tavern_ID, date, supply_name, unit, count)
Values (1, '2007-05-08 12:35:29.123', 'salt', 'pounds', 100);

INSERT INTO Supplies (tavern_ID, date, supply_name, unit, count)
Values (4, '2009-05-08 12:35:29.123', 'beer', 'bottles', 500);

INSERT INTO Supplies (tavern_ID, date, supply_name, unit, count)
Values (3, '2017-05-08 11:27:29.123', 'garbage bags', 'boxes', 25);

INSERT INTO Supplies (tavern_ID, date, supply_name, unit, count)
Values (3, '2020-12-08 13:35:29.123', 'milk', 'cartons', 4); 

INSERT INTO Supplies (tavern_ID, date, supply_name, unit, count)
Values (2, '2021-04-25 15:21:29.123', 'sugar', 'pounds', 10);

SELECT * FROM Supplies;

/*SupplyDelivery*/
INSERT INTO SupplyDelivery (supply_ID, tavern_ID, cost, amount_received, date)
Values (2, 3, 10.25, 10, '2022-08-08 12:00:00.123');

INSERT INTO SupplyDelivery (supply_ID, tavern_ID, cost, amount_received, date)
Values (3, 4, 100.27, 30, '2022-02-24 18:41:00.123');

INSERT INTO SupplyDelivery (supply_ID, tavern_ID, cost, amount_received, date)
Values (1, 2, 200.25, 200, '2022-01-21 11:54:00.123' );

INSERT INTO SupplyDelivery (supply_ID, tavern_ID, cost, amount_received, date)
Values (4, 4, 20.00, 50, '2021-12-03 17:17:00.000');

INSERT INTO SupplyDelivery (supply_ID, tavern_ID, cost, amount_received, date)
Values (5, 5, 271.15, 50, '2022-03-30 15:36:00.000');

SELECT * FROM SupplyDelivery;

/*Services*/
INSERT INTO Services (service_name, status)
Values ('massage', 'active');

INSERT INTO Services (service_name, status)
Values ('pool', 'inactive');

INSERT INTO Services (service_name, status)
Values ('kitchen', 'active');

INSERT INTO Services (service_name, status)
Values ('music', 'inactive');

INSERT INTO Services (service_name, status)
Values ('bar', 'inactive');

SELECT * FROM Services;

/*Status*/
INSERT INTO Status (active, inactive, tavern_ID, service_name)
Values (0, 1, 3, 'bar');

INSERT INTO Status (active, inactive, tavern_ID, service_name)
Values (1, 0, 5,'pool');

INSERT INTO Status (active, inactive, tavern_ID, service_name)
Values (0, 1, 1, 'music');

INSERT INTO Status (active, inactive, tavern_ID, service_name)
Values (1, 0, 2, 'kitchen');

INSERT INTO Status (active, inactive, tavern_ID, service_name)
Values (1, 0, 4, 'massage');

SELECT * FROM Status;

/*ServiceSales*/
INSERT INTO ServiceSales (service_name, guest, price, date_purchased, amount_purchased, tavern_ID)
Values ('massage', 'Bob Melendez', 25, '2022-02-02 10:25:00.000', 1, 1, 1);

INSERT INTO ServiceSales (service_name, guest, price, date_purchased, amount_purchased, tavern_ID)
Values ('massage', 'Steve Jobs', 50, '2021-11-15 18:30:00.000', 2, 3, 3);

INSERT INTO ServiceSales (service_name, guest, price, date_purchased, amount_purchased, tavern_ID)
Values ('bar', 'Bob Marley', 200.70, '2022-11-15 18:30:00.000', 21, 4, 4);

INSERT INTO ServiceSales (service_name, guest, price, date_purchased, amount_purchased, tavern_ID)
Values ('pool', 'Elon Musk', 25, '2022-05-18 09:00:00.000', 3, 5, 5);

INSERT INTO ServiceSales (service_name, guest, price, date_purchased, amount_purchased, tavern_ID)
Values ('music', 'Harry Potter', 25, '2022-06-04 16:50:00.000', 2, 2, 2);


SELECT * FROM ServiceSales;