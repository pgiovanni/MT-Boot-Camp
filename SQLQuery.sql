DROP TABLE IF EXISTS Level;
DROP TABLE IF EXISTS SupplyDelivery;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS ServiceSupply;
DROP TABLE IF EXISTS BasementRats;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS GuestStatus;
DROP TABLE IF EXISTS Class;
DROP TABLE IF EXISTS RoomStays;
DROP TABLE IF EXISTS RoomStatus;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS SupplyServiceStatus;
DROP TABLE IF EXISTS Tavern;
DROP TABLE IF EXISTS Locations;
DROP TABLE IF EXISTS Users;

CREATE TABLE Class (
	ID int IDENTITY(1,1),
	name varchar(50)
);

CREATE TABLE Guests (
	ID int IDENTITY(1,1),
	notes varchar(250),
	name varchar(50),
	birthday date,
	cakedays date,
	status_ID int,
);

CREATE TABLE Users (
	ID int IDENTITY(1,1),
	name varchar(50),
	roles_ID int,
);

Create Table GuestStatus (
	ID int IDENTITY (1,1),
	name varchar(50),
);

CREATE TABLE Locations (
	ID int IDENTITY(1,1),
	name varchar(50),
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

CREATE TABLE ServiceSupply (
	ID int IDENTITY(1,1),
	tavern_ID int,
	date date,
	ServiceSupply_name varchar(50),
	unit varchar(25),
	count int,
	status varchar(50)
);
CREATE TABLE Sales (
	ID int IDENTITY(1,1),
	ServiceSupply_ID int,
	guests_ID int,
	price money,
	date_purchased date,
	amount_purchased int,
	tavern_ID int,
);

CREATE TABLE SupplyServiceStatus (
	ID int IDENTITY(1,1),
	name varchar(50),
	service_ID int,
	tavern_ID int,
	
);

CREATE TABLE SupplyDelivery (
	ID int IDENTITY(1,1),
	ServiceSupply_ID int,
	tavern_ID int,
	cost money,
	amount_received int,
	date date,
);

CREATE TABLE Level (
	class_ID int,
	guests_ID int,
	Level int,
);

CREATE TABLE Room (
	ID int IDENTITY (1,1),
	status_ID int,
	tavern_ID int,
);

CREATE TABLE RoomStatus (
	ID int IDENTITY (1,1),
	room_ID int,
	name varchar(50),
);

GO

CREATE TABLE RoomStays (
	ID int IDENTITY(1,1),
	sale money,
	guest_ID int,
	room_ID int,
	tavern_ID int,
	dateStart date, 
	dateEnd date,
	rate money,
);

INSERT INTO Locations
Values ('pluto'), ('New Jersey'), ('Boston'), ('Isengard'), ('mars');

SELECT * FROM Locations;

INSERT INTO Users (name, roles_ID)
Values ('John', 6), ('Joe', 2),('Garfield', 5), ('Goku', 6), ('Bob', 4);

SELECT * FROM Users;

INSERT INTO Tavern (tavern_name, FloorsCount, OwnerID, LocationID)
Values ('Johns Tavern', 10, 1, 4), ('Joes Tavern', 7, 2, 5), ('Boba Bubble Bois', 3, 3, 2),
	   ('Garbage Goober', 1, 3, 3), ('Garfields Cabin', 7, 4, 4);

SELECT * FROM Tavern;

INSERT INTO Roles (role_name, Description)
Values ('Owner', 'Owner of a tavern'), ('Cook', 'Taverns cook'), ('Delivery handler', 'In charge of shipping and receiving'),
	   ('Dish Washer', 'Washes Dishes'), ('Bar Tender', 'Serves alcoholic beverages'), ('admin', 'system administrator');

SELECT * FROM Roles;

INSERT INTO BasementRats (rat_name, tavern_ID)
Values ('Steve', 1), ('Margeret', 5), ('Killer', 3), ('Morty', 3), ('Luffy', 2);

ALTER TABLE BasementRats ADD PRIMARY KEY (ID);

SELECT * FROM BasementRats;

DROP TABLE IF EXISTS BasementRats;

INSERT INTO ServiceSupply (tavern_ID, date, ServiceSupply_name, unit, count, status)
Values (1, '2007-05-08 12:35:29.123', 'salt', 'pounds', 100, 1), (4, '2009-05-08 12:35:29.123', 'beer', 'bottles', 500, 0), 
	   (3, '2017-05-08 11:27:29.123', 'garbage bags', 'boxes', 25, 0), (3, '2020-12-08 13:35:29.123', 'milk', 'cartons', 4, 1),
	   (2, '2021-04-25 15:21:29.123', 'sugar', 'pounds', 10, 1), (4, '2022-04-21 16:45:29.573', 'massage', 'one service', 10, 0);

SELECT * FROM ServiceSupply;

INSERT INTO SupplyDelivery (ServiceSupply_ID, tavern_ID, cost, amount_received, date)
Values (2, 3, 10.25, 10, '2022-08-08 12:00:00.123'), (3, 4, 100.27, 30, '2022-02-24 18:41:00.123'),
	   (1, 2, 200.25, 200, '2022-01-21 11:54:00.123' ), (4, 4, 20.00, 50, '2021-12-03 17:17:00.000'),
	   (5, 5, 271.15, 50, '2022-03-30 15:36:00.000');

SELECT * FROM SupplyDelivery;

INSERT INTO SupplyServiceStatus (name, service_ID, tavern_ID)
Values ('active', 3, 4), ('inactive', 3, 2), ('break', 2, 3), ('closed', 4, 1), ('cleaning', 1, 5);

SELECT * FROM SupplyServiceStatus;

INSERT INTO Sales (ServiceSupply_ID, guests_ID, price, date_purchased, amount_purchased, tavern_ID)
Values (1, 3, 25, '2022-02-02 10:25:00.000', 1, 1), 
	   (6, 4, 50, '2021-11-15 18:30:00.000', 2, 3),
	   (5, 1, 200.70, '2022-11-15 18:30:00.000', 21, 4),
	   (5, 2, 25, '2022-05-18 09:00:00.000', 3, 5),
	   (2, 5, 25, '2022-06-04 16:50:00.000', 2, 2), (3, 2, 10000, '2022-04-16', 5000, 3),
	   (5, 4, 57.80, '2022-03-01', 50, 2),
	   (4, 3, 2000.00, '2022-08-15', 500, 3),
	   (3, 3, 17.80, '2021-11-09', 1, 2),
	   (2, 4, 69.95, '2022-09-19', 3, 5),
	   (1, 2, 79.92, '2022-10-31', 100, 3),
	   (4, 3, 100.50, '2022-12-24', 20, 1);

SELECT * FROM Sales;

INSERT INTO Class (name) 
Values ('mage'), ('warrior'), ('archer'), ('technician'), ('worker');

SELECT * FROM Class;

INSERT INTO Level (class_ID, guests_ID, Level)
Values (1, 3, 5), (3, 2, 4), (1, 4, 4), (4, 3, 4), (4, 5, 12), (2, 3, 18), (3, 4, 35), (2, 4, 20), (4, 5, 13), (2, 1, 15);

SELECT * FROM Level;

INSERT INTO Guests (notes, name, birthday, cakedays, status_ID)
VALUES ('very cool', 'megu', '1992-11-11','2022-11-17 ', 1), 
	   ('super nice and super strong', 'ducky', '1777-11-17', '2022-11-17', 3),
	   ('leader of the kuzon alliance', 'shifonia', '2001-11-17', '2022-11-17', 5), 
	   ('officer of the tremain alliance', 'bargar', '1500-11-17', '2022-11-17 ', 4), 
	   ('king of gondor', 'aragorn', '2022-11-17', '2004-11-17', 5),
	   ('dude from guitar center', 'ducky', '1985-11-30', '1987-03-12', 5);

SELECT * FROM Guests;

INSERT INTO GuestStatus (name)
VALUES ('hangry'), ('happy'), ('sad'), ('frustrated'), ('thirsty');

SELECT * FROM GuestStatus;

INSERT INTO Room (status_ID, tavern_ID)
VALUES (1, 3), (5, 3), (3,2), (3,3), (2,2);

SELECT * FROM Room;

INSERT INTO RoomStays (sale, guest_ID, room_ID, tavern_ID, dateStart,	dateEnd, rate) 
Values (500.00, 3, 5, 3, '2022-02-02', '2022-02-07', 100.00), 
	   (250.00, 1, 3, 5, '2022-02-02', '2022-02-07', 50.00), 
	   (300.00, 1, 3, 4, '2022-02-07', '2022-02-09', 150.00),
	   (1000.00, 2, 4, 3, '2022-02-02', '2022-02-03', 1000.00),
	   (10.00, 4, 3, 1, '2022-02-02', '2022-02-12', 1.00);

ALTER TABLE Class ADD PRIMARY KEY (ID);
ALTER TABLE Roles ADD PRIMARY KEY (ID);

ALTER TABLE Users ADD PRIMARY KEY (ID);
ALTER TABLE Users ADD FOREIGN KEY (roles_ID) REFERENCES Roles (ID);

ALTER TABLE GuestStatus ADD PRIMARY KEY (ID);
ALTER TABLE Locations ADD PRIMARY KEY (ID);
ALTER TABLE Guests ADD PRIMARY KEY (ID);
ALTER TABLE Guests ADD FOREIGN KEY (status_ID) REFERENCES GuestStatus (ID);

ALTER TABLE Tavern ADD PRIMARY KEY (ID);
ALTER TABLE Tavern ADD FOREIGN KEY (OwnerID) REFERENCES Users (ID);
ALTER TABLE Tavern ADD FOREIGN KEY (LocationID) REFERENCES Locations (ID);

ALTER TABLE ServiceSupply ADD PRIMARY KEY (ID);
ALTER TABLE ServiceSupply ADD FOREIGN KEY (tavern_ID) REFERENCES Tavern (ID);

ALTER TABLE Sales ADD PRIMARY KEY (ID);
ALTER TABLE Sales ADD FOREIGN KEY (ServiceSupply_ID) REFERENCES ServiceSupply (ID);
ALTER TABLE Sales ADD FOREIGN KEY (guests_ID) REFERENCES Guests (ID);
ALTER TABLE Sales ADD FOREIGN KEY (tavern_ID) REFERENCES Tavern (ID);

ALTER TABLE SupplyServiceStatus ADD PRIMARY KEY (ID);
ALTER TABLE SupplyServiceStatus ADD FOREIGN KEY (tavern_ID) REFERENCES Tavern (ID);

ALTER TABLE SupplyDelivery ADD PRIMARY KEY (ID);
ALTER TABLE SupplyDelivery ADD FOREIGN KEY (ServiceSupply_ID) REFERENCES ServiceSupply (ID);

ALTER TABLE Level ADD FOREIGN KEY (class_ID) REFERENCES Class (ID);
ALTER TABLE Level ADD FOREIGN KEY (guests_ID) REFERENCES Guests (ID);

ALTER TABLE Room ADD PRIMARY KEY (ID);
ALTER TABLE Room ADD FOREIGN KEY (tavern_ID) REFERENCES Tavern (ID);

ALTER TABLE RoomStays ADD PRIMARY KEY (ID);
ALTER TABLE RoomStays ADD FOREIGN KEY (room_ID) REFERENCES Room (ID);
ALTER TABLE RoomStays ADD FOREIGN KEY (guest_ID) REFERENCES Guests (ID);
ALTER TABLE RoomStays ADD FOREIGN KEY (tavern_ID) REFERENCES Tavern (ID);

/*
DROP TABLE IF EXISTS Tavern;
-Fails because it is being used by the SupplyServiceStatus table, ServiceSupply table, and the Sales table
INSERT INTO Level (guests_ID) VALUES (56);
-Fails because of invalid foreign key insertions
DELETE FROM Guests WHERE name='megu';
-Fails because it attempts to delete a record with a primary key
UPDATE Tavern SET OwnerID=6 WHERE ID=1;
-Fails do to attempting to update a foreign id
*/


SELECT 'SELECT * FROM Taverns WHERE tavern_name = ' + '''' + tavern_name + '''' FROM Tavern;
--HOMEWORK 3
SELECT * FROM Guests WHERE birthday< '2000-01-01';
SELECT * FROM RoomStays WHERE rate > 100.00;
SELECT DISTINCT name FROM Guests;
SELECT * FROM Guests ORDER BY name asc;
SELECT TOP 10 price FROM Sales;


--7
SELECT ID, name FROM Class
UNION ALL
SELECT ID, name FROM GuestStatus 
UNION ALL
SELECT ID, name FROM Locations
UNION ALL
SELECT ID, name FROM SupplyServiceStatus
UNION ALL
SELECT ID, name FROM RoomStatus;

--8
DROP TABLE IF EXISTS level_groupings;
SELECT guests_ID, class_ID, level, 
(SELECT CASE WHEN level < 11 THEN '1-10' 
WHEN level < 21 THEN '11-20' 
WHEN level < 41 THEN '21-40' END)
AS level_grouping INTO level_groupings FROM Level;
SELECT * FROM level_groupings;

--1 h/w from 3/3 (h/w 4)
SELECT name, Roles.role_name 
FROM 
Users JOIN Roles ON Users.roles_ID = Roles.ID WHERE roles_ID = 6;

--2
SELECT Users.name, Tavern.FloorsCount, Tavern.tavern_name, Locations.name, Roles.role_name FROM Tavern
JOIN Users ON Tavern.OwnerID = Users.ID
JOIN Roles ON Users.roles_ID = roles_ID 
JOIN Locations On Tavern.LocationID = Locations.ID WHERE Users.roles_ID = 6 AND Roles.role_name = 'admin';

--3
SELECT Guests.name, Class.name, Level.Level FROM Guests
JOIN Level ON Level.guests_ID = Guests.ID
JOIN Class ON Level.class_ID = Class.ID ORDER BY Guests.name asc;

--4
SELECT TOP 10 Sales.price, ServiceSupply.ServiceSupply_name FROM Sales
JOIN ServiceSupply ON Sales.ServiceSupply_ID = ServiceSupply.ID ORDER BY Sales.price desc;

--5
SELECT  Guests.name FROM Guests
JOIN Level ON Guests.ID = Level.guests_ID 
JOIN Class ON Level.class_ID = Class.ID 
GROUP BY Guests.name 
HAVING count(Guests.name) > 1
ORDER BY Guests.name;

--6
SELECT Guests.name as Guest FROM Guests
JOIN Level ON Guests.ID = Level.guests_ID 
JOIN Class ON Level.class_ID = Class.ID 
WHERE Level.level > 5
GROUP BY Guests.name
HAVING count(Guests.name) > 1;

--7
SELECT Guests.name as Guest, ML.HighestLevel as HighestLevel, Class.name as Class FROM Guests
JOIN Level ON Guests.ID = Level.guests_ID
JOIN (SELECT Level.guests_ID, max(Level.level) as HighestLevel FROM Level 
	  GROUP BY Level.guests_ID)
	  as ML ON ML.guests_ID = Guests.ID
JOIN Class ON Level.class_ID = Class.ID
GROUP BY Guests.name, Class.name, ML.HighestLevel 

--8
SELECT Guests.name, RoomStays.dateStart, RoomStays.dateEnd FROM RoomStays
JOIN Guests on RoomStays.guest_ID = Guests.ID
WHERE RoomStays.dateStart >= '2022-02-02' OR RoomStays.dateEnd < '2022-02-11';
