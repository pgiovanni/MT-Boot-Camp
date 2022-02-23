CREATE SCHEMA Schema_One;

GO
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
	tavern_ID int IDENTITY(1, 1),
	tavern_name varchar(50),
	FloorsCount int,
	OwnerID int,
	LocationID int
);

CREATE TABLE Users (
	user_ID int IDENTITY(1,1),
	user_name varchar(50),
	roles varchar(50),
);

CREATE TABLE Roles (
	role_ID int IDENTITY(1,1),
	role_name varchar(50),
	Description varchar(250),
);

CREATE TABLE BasementRats(
	rat_ID int IDENTITY(1,1),
	rat_name varchar(50),
);

CREATE TABLE Locations (
	location_ID int IDENTITY(1,1),
	locataion_name varchar(50),
);

CREATE TABLE Supplies (
	supply_ID int IDENTITY(1,1),
	tavern_ID int,
	date datetime,
	supply_name varchar(50),
	unit varchar(25),
	count int,
);

CREATE TABLE SupplyDelivery (
	devliery_ID int IDENTITY(1,1),
	supply_ID int,
	tavern_ID int,
	cost int,
	amount_received int,
	date datetime,
);

CREATE TABLE Services (
	service_id int IDENTITY(1,1),
	service_name varchar(50),
	status varchar(50),
);


CREATE TABLE Status (
	active varchar(6),
	inactive varchar(8),
);

CREATE TABLE ServiceSales (
	service_ID int IDENTITY(1,1),
	service_name varchar(50),
	guest varchar(50),
	price int,
	date_purchased datetime,
	amount_purchased int,
	tavern_ID varchar(50),
	tavern_name varchar(50),
);