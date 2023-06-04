create schema `hotels`;

use hotels;

create table Cities(
cityID int primary key not null auto_increment,
cityName varchar(20)
);

create table village(
villageID int primary key not null auto_increment,
villageName varchar(20)
);

create table Hotels(
hotelID int not null primary key auto_increment,
hotelName varchar(20),
starsCounts int not null,
creationDate date,
cityId int,
foreign key(cityId) references Cities(cityID)
);

create table Rooms(
roomID int not null primary key auto_increment,
comfortLevel varchar(20),
hotelId int,
foreign key(hotelId) references Hotels(hotelID)
);

create table Clients(
clientID int primary key not null auto_increment,
clientName varchar(20),
clientNumber long
);

create table Orders(
orderID int not null auto_increment primary key,
clientId int,
roomId int,
foreign key(roomId) references Rooms(roomID),
foreign key(clientId) references Clients(clientID)
);

delete from hotels.clients where clientID=10;
drop table village;

alter table hotels.clients
add column age long not null;

UPDATE `hotels`.`clients` SET `age` = '23' WHERE (`clientID` = '1');
UPDATE `hotels`.`clients` SET `age` = '50' WHERE (`clientID` = '2');
UPDATE `hotels`.`clients` SET `age` = '38' WHERE (`clientID` = '3');
UPDATE `hotels`.`clients` SET `age` = '30' WHERE (`clientID` = '4');
UPDATE `hotels`.`clients` SET `age` = '28' WHERE (`clientID` = '5');
UPDATE `hotels`.`clients` SET `age` = '70' WHERE (`clientID` = '6');
UPDATE `hotels`.`clients` SET `age` = '31' WHERE (`clientID` = '7');
UPDATE `hotels`.`clients` SET `age` = '25' WHERE (`clientID` = '8');

insert into hotels.clients(clientID, clientName, clientNumber, age) values('9', 'Ihor', '0979999999', '29');

alter table hotels.clients
change column `age` `year of birth` long not null;

SELECT * FROM hotels.cities;
select * from hotels.clients;
select * from hotels.hotels;
select * from hotels.rooms;
select * from hotels.orders;

select * from clients;
select * from clients where clientName = 'Artem';
select clientName, clientNumber from clients;
select clientName, clientNumber from clients where clientName = 'Artem';
select clientName, clientNumber from clients where clientName like 'M%';
select clientName, clientNumber from clients where clientNumber like '%7';

select count(*) from cities; 
select count(clientName) from clients;
select count(clientName) from clients where clientName like 'M%';
select min(starsCounts) from hotels;
select max(starsCounts) from hotels;
select avg(starsCounts) from hotels;
select sum(starsCounts) from hotels;

select count(starsCounts), starsCounts from hotels group by starsCounts;
select count(starsCounts), starsCounts from hotels group by starsCounts having starsCounts > 3;

select * from hotels.clients order by clientName;
select * from hotels.clients order by clientName desc;
select * from hotels.clients order by clientName limit 5 offset 1;

select * from cities join hotels on cities.cityID = hotels.cityId;
select cities.cityName, hotels.hotelName from cities join hotels on cities.cityID = hotels.cityId;  
select * from cities left join hotels on cities.cityID = hotels.cityID;

