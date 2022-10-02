drop database trotro_system;
create database trotro_system;

use trotro_system;

create table Person(
personID int unsigned  not null  auto_increment primary key,
fname varchar(40) not null,
lname varchar(40),
age tinyint unsigned,
gender char(1), /* 'M', 'F' */
check(gender='M' or gender='F'),
address varchar(50)
);

create table Manager(
managerID int unsigned not null primary key,
salary decimal(10,2),
Highest_qualification varchar(40),
foreign key (managerID) references Person(personID) on update cascade on delete restrict
);

create table Mechanic(
mechanicID int unsigned not null primary key,
date_employed date,
years_of_exp tinyint,
salary decimal(10,2),
foreign key (mechanicID) references Person(personID) on update cascade on delete restrict
);

create table Station(
stationID varchar(10) not null,
location varchar(50),
managerID int unsigned not null,
primary key (stationID, managerID),
foreign key(managerID) references Manager(managerID) on update cascade on delete restrict
);

create table Legal_documents(
document_name varchar(50) not null primary key,
date_acquired date default'2021-04-30', /*YYYY-MM-DD*/
stationID varchar(10) not null,
foreign key (stationID) references Station(stationID) on update cascade on delete restrict
);

create table Driver(
driverID int unsigned not null primary key, 
salary decimal(10,2),
years_of_exp tinyint,
date_employed date default '2021-04-30',
foreign key (driverID) references Person(personID)
);

create table Trip(
tripID int unsigned auto_increment not null,
managerID int unsigned not null,
driverID int unsigned not null,
duration time default '00:00:00', /*hh:mm:ss*/
distance decimal(8,2), /*kilometers*/
destination_name  varchar(40),
rating int, /*score of trip ?/100 */
primary key(tripID),
foreign key(managerID) references Manager(managerID), 
foreign key(driverID) references Driver(driverID)
);

create table Passenger(
passengerID int unsigned not null primary key,
tripID int unsigned not null,
seatnumber int,
date_booked date default '2021-04-30',
occupation varchar(50),
foreign key(tripID) references Trip(tripID) on update cascade on delete restrict,
foreign key(passengerID) references Person(personID) 
);

create table Mate(
mateID int unsigned not null primary key,
salary decimal(10,2),
primary_language varchar(20)
);

create table Bus(
vehicle_no varchar(20) not null primary key,
driverID int unsigned not null,
mateID int unsigned not null,
model varchar(40), 
maxnumberofseat int unsigned,
maintenance enum('Yes', 'No'), 
state enum('on transit','not on transit'),
check(maintenance='Yes' or maintenance='No' and state='on transit' or state='not on transit'),
foreign key (driverID)  references Driver(driverID),
foreign key (mateID) references Mate(mateID)
);

create table TripBus(
vehicle_no varchar(20) not null,
tripID int unsigned not null,
primary key (vehicle_no, tripID),
foreign key (tripID)  references Trip(tripID),
foreign key (vehicle_no) references Bus(vehicle_no)
);

create table First_Aid_Kits(
itemID varchar(20) primary key,
vehicle_no varchar(20) not null, 
item_name varchar(40),
price decimal(8,2),
foreign key (vehicle_no) references Bus(vehicle_no)
);

create table Package(
packageID varchar(20) not null primary key,
tripID int unsigned not null, 
weight decimal(10,3), 
content varchar(50), 
tel_recipient varchar(10),
foreign key(tripID) references Trip(tripID)
);

create table BusMechanic(
vehicle_no varchar(20) not null,
mechanicID int unsigned not null,
primary key (vehicle_no, mechanicID),
foreign key (vehicle_no) references Bus(vehicle_no),
foreign key (mechanicID) references Mechanic(mechanicID)
);

create table Spareparts(
 SPID varchar(40) not null primary key,
 mechanicID int unsigned not null,
 sparepart_name varchar(40) not null,
 price decimal(10,2) not null,
 foreign key (mechanicID) references Mechanic(mechanicID)
);

insert into Person( fname,lname, age, gender, address) values('Ngoh', 'Amah', 26, 'M', 'Ashesi University');
insert into Person( fname,lname, age, gender, address) values('Awura', 'Afram', 27, 'F', 'Ashesi University');
insert into Person( fname,lname, age, gender, address) values('Lois', 'Otchi', 29, 'F', 'Ashesi University');
insert into Person( fname,lname, age, gender, address) values('Ebenezer', 'Amoah', 21, 'M', 'Ashesi University');
insert into Person( fname,lname, age, gender, address) values('Prince', 'Yeboah', 22, 'M', 'Ashesi University');
insert into Person( fname,lname, age, gender, address) values('Lekane', 'Styve', 17, 'M', 'Ashongma');
insert into Person( fname,lname, age, gender, address) values('Junior','Abiringo', 26, 'M', 'Dansoman');
insert into Person( fname,lname, age, gender, address) values('Sylvi','Fomba', 23, 'F', 'Berekuso');
insert into Person( fname,lname, age, gender, address) values('Precious', 'Tima', 26, 'F', 'Achimota');
insert into Person( fname,lname, age, gender, address) values('Nkeng', 'Stephen', 25, 'M', 'Tema');
insert into Person( fname,lname, age, gender, address) values('Elvis', 'Dankrah',17, 'M', 'Ashongma');
insert into Person( fname,lname, age, gender, address) values('Mensah', 'Acquah', 24, 'M', 'Dansoman');
insert into Person( fname,lname, age, gender, address) values('Emmanuel','Otchi', 23, 'M', 'Berekuso');
insert into Person( fname,lname, age, gender, address) values('Bless','Tibot', 17, 'M', 'Achimota');
insert into Person( fname,lname, age, gender, address) values('Manuella', 'Langi', 16, 'M', 'Tema');
insert into Person( fname,lname, age, gender, address) values('Ellis', 'Woodes',22, 'M', 'Berekuso');
insert into Person( fname,lname, age, gender, address) values('Miriam', 'Duke',21, 'F', 'Takrade');
insert into Person( fname,lname, age, gender, address) values('Ayomaoh', 'Biden',19, 'M', 'Tema');
insert into Person( fname,lname, age, gender, address) values('Gertrude', 'Perls',20, 'F', 'Accra');
insert into Person( fname,lname, age, gender, address) values('Graham', 'Woodes',17, 'M', 'Kumasi');
insert into Person( fname,lname, age, gender, address) values('Nadine', 'Tim',22, 'M', 'Berekuso');
insert into Person( fname,lname, age, gender, address) values('Omoeibi', 'Bagsaw',23, 'F', 'Cape Coast');
insert into Person( fname,lname, age, gender, address) values('Goodness', 'Amankwa',27, 'M', 'Accra');
insert into Person( fname,lname, age, gender, address) values('Lemfon', 'Tyrone',30, 'F', 'Accra');
insert into Person( fname,lname, age, gender, address) values('Peter', 'Mensah',25, 'M', 'Kumasi');

insert into Manager(managerID, salary, Highest_qualification) values(21,2000,'B.Arts');
insert into Manager(managerID, salary, Highest_qualification) values(22,2100,'B.Sc');
insert into Manager(managerID, salary, Highest_qualification) values(23,2700,'M.Arts');
insert into Manager(managerID, salary, Highest_qualification) values(24,2100,'B.Sc');
insert into Manager(managerID, salary, Highest_qualification) values(25,4000,'PhD');

insert into Mechanic(mechanicID, date_employed,years_of_exp,salary) values(16,'2021-01-21',10,600);
insert into Mechanic(mechanicID, date_employed, years_of_exp,salary) values(17,'2021-01-01',5,400);
insert into Mechanic(mechanicID, date_employed, years_of_exp,salary) values(18,'2021-01-20',3,300);
insert into Mechanic(mechanicID, date_employed, years_of_exp,salary) values(19,'2021-02-01',2,250);
insert into Mechanic(mechanicID, date_employed, years_of_exp,salary) values(20,'2021-03-11',1,250);

insert into Station(stationID, location, managerID) values('001', 'Cantoments', 21);
insert into Station(stationID, location, managerID) values('002','Legon',22);
insert into Station(stationID, location, managerID) values('003','East airport',23);
insert into Station(stationID, location, managerID) values('004','Osu',24);
insert into Station(stationID, location, managerID) values('005','Tema',25);

insert into Legal_documents(document_name,date_acquired,stationID) values ('Contract of employment', '2021-03-12', '001');
insert into Legal_documents(document_name,date_acquired,stationID) values ('Purchase details', '2021-03-24', '002');
insert into Legal_documents(document_name,date_acquired,stationID) values ('Permit information', '2021-03-25', '003');
insert into Legal_documents(document_name,date_acquired,stationID) values ('Rules and regulations', '2021-03-08', '004');
insert into Legal_documents(document_name,date_acquired,stationID) values ('Complaints', '2021-03-30', '005');

insert into Driver(driverID,salary,years_of_exp,date_employed) values (6, 1500.00, 5, '2021-04-30');
insert into Driver(driverID,salary,years_of_exp,date_employed) values (7, 1340.00, 3, '2021-02-13');
insert into Driver(driverID,salary,years_of_exp,date_employed) values (8, 1450.00, 7, '2021-01-25');
insert into Driver(driverID,salary,years_of_exp,date_employed) values (9, 1400.50, 5, '2021-04-13');
insert into Driver(driverID,salary,years_of_exp,date_employed) values (10, 1400.00, 2, '2021-02-28');

insert into Trip( managerID, driverID, duration, distance, destination_name, rating ) values (21, 6,'00:45:16',5.0,'Oyarifa',50);
insert into Trip( managerID, driverID, duration, distance, destination_name, rating) values (22,7,'00:37:02',3.06,'Ashongman',60);
insert into Trip( managerID, driverID, duration, distance, destination_name, rating) values (23,8,'01:04:00',5.8,'Aburi',80);
insert into Trip( managerID, driverID, duration, distance, destination_name, rating) values (24,9,'00:31:00',3.0,'Dansoman',20);
insert into Trip( managerID, driverID, duration, distance, destination_name, rating ) values (25,10,'00:15:01',1.3,'Adringanor',10);

insert into Passenger (passengerID,tripID,seatnumber, date_booked, occupation) values (1, 2, 12, '2021-03-25', 'Trader');
insert into Passenger (passengerID,tripID,seatnumber, date_booked, occupation) values (2, 2, 6, '2021-01-06', 'Nurse');
insert into Passenger (passengerID,tripID,seatnumber, date_booked, occupation) values (3, 1, 11, '2021-02-10', 'Teacher');
insert into Passenger (passengerID,tripID,seatnumber, date_booked, occupation) values (4, 3, 9, '2021-03-15', 'Lawyer');
insert into Passenger (passengerID,tripID,seatnumber, date_booked, occupation) values (5, 4, 5, '2021-04-11', 'Doctor');

insert into Mate(mateID,salary,primary_language) values (11, 500.00, 'Twi');
insert into Mate(mateID,salary,primary_language) values (12, 100.00, 'Twi');
insert into Mate(mateID,salary,primary_language) values (13, 150.00, 'Ga');
insert into Mate(mateID,salary,primary_language) values (14, 250.80,'English');
insert into Mate(mateID,salary,primary_language) values (15, 400.00, 'Twi');


insert into Bus(vehicle_no,driverID,mateID,model,maxnumberofseat,maintenance,state) values ('GHA113XY',6, 11,'Toyota',20,'No','on transit');
insert into Bus(vehicle_no,driverID,mateID,model,maxnumberofseat,maintenance,state) values ('GHA110IY', 7, 12,'Toyota',20,'No','on transit');
insert into Bus(vehicle_no,driverID,mateID,model,maxnumberofseat,maintenance,state) values ('GHA011PH', 8, 13,'Toyota',20,'Yes','not on transit');
insert into Bus(vehicle_no,driverID,mateID,model,maxnumberofseat,maintenance,state) values ('GHA121HT', 9, 14,'Toyota',30,'No','on transit');
insert into Bus(vehicle_no,driverID,mateID,model,maxnumberofseat,maintenance,state) values ('GHA000LL', 10, 15,'Toyota',30,'No','on transit');


insert into TripBus(vehicle_no,tripID) values ('GHA113XY', 1);
insert into TripBus(vehicle_no,tripID) values ('GHA110IY', 2);
insert into TripBus(vehicle_no,tripID) values ('GHA121HT', 3);
insert into TripBus(vehicle_no,tripID) values ('GHA000LL', 4);
insert into TripBus(vehicle_no,tripID) values ('GHA011PH', 5); /* trip five is 'not on transit' because of maintenance issues, 
																  future task should prevent buses that need maintenane from going on a trip.*/


insert into First_Aid_Kits(itemID, vehicle_no, item_name,price) values ('111000','GHA113XY','Spray',50);
insert into First_Aid_Kits(itemID, vehicle_no, item_name,price) values ('111001','GHA110IY','Bandage',20);
insert into First_Aid_Kits(itemID, vehicle_no, item_name,price) values ('111002', 'GHA113XY', 'Safety Pins',30);
insert into First_Aid_Kits(itemID, vehicle_no, item_name,price) values ('111003', 'GHA113XY', 'Plasters',45);
insert into First_Aid_Kits(itemID, vehicle_no, item_name,price) values ('111004', 'GHA110IY', 'Sterile Glove',70); /* the above representation indicates
																												      that some vehicles do not have first
																												      aid kits and some have just a few items*/
insert into Package(packageID,tripID, weight,content,tel_recipient) values('PKG001',1, 12.1, 'Vegetables', '0987608173');
insert into Package(packageID,tripID, weight,content, tel_recipient) values('PKG002',1, 182.1, 'SpareParts', '0897216873');
insert into Package(packageID,tripID, weight,content, tel_recipient) values('PKG003',2, 152.1, 'Clothes', '0597107873');
insert into Package(packageID,tripID, weight,content, tel_recipient) values('PKG004',2, 129.1, 'Clothes', '0587604567'); 
insert into Package(packageID,tripID, weight,content,tel_recipient) values('PK005',3, 18.1, 'WindowFrames', '0557948253');
insert into Package(packageID,tripID, weight,content, tel_recipient) values('PKG006',3, 192.1, 'DoorLocks', '0264606873');
insert into Package(packageID,tripID, weight,content, tel_recipient) values('PKG007',4, 197.1, 'CementBags', '0527809873');
insert into Package(packageID,tripID, weight,content,tel_recipient) values('PKG008',4, 198.1, 'Books', '0557307573');
insert into Package(packageID,tripID, weight,content, tel_recipient)values('PKG009',5,186.1, 'Fruits', '0567676073');
insert into Package(packageID,tripID, weight,content, tel_recipient)values('PKG010',5,82.1, 'CookingUtensils', '0547236873');
 

insert into Spareparts(SPID, mechanicID, sparepart_name,price) values('SP001',16,'ElectricMotor',12.50);
insert into Spareparts( SPID, mechanicID, sparepart_name,price) values('SP002',16,'CoolingFan',123.50);
insert into Spareparts( SPID, mechanicID, sparepart_name,price) values('SP003',17, 'SteeringWheel', 172.50);
insert into Spareparts( SPID, mechanicID, sparepart_name,price) values('SP004',17, 'WaterTank', 123.50);
insert into Spareparts( SPID, mechanicID, sparepart_name,price) values('SP005',18, 'Shaft', 128.50);
insert into Spareparts( SPID, mechanicID, sparepart_name,price) values('SP006',19, 'TailLight', 1234.50);
insert into Spareparts( SPID, mechanicID, sparepart_name,price) values('SP007',20,'CarKeys',123.50);
insert into Spareparts( SPID, mechanicID, sparepart_name,price) values('SP008',20, 'Horn', 1234.50);
insert into Spareparts( SPID, mechanicID, sparepart_name,price) values ('SP009',19, 'BrakePad', 128.50);
insert into Spareparts( SPID , mechanicID, sparepart_name,price) values('SP010',17, 'RightHeadlight', 128.50);

insert into BusMechanic(vehicle_no,mechanicID) values ('GHA113XY',16);
insert into BusMechanic(vehicle_no,mechanicID) values ('GHA110IY',16);
insert into BusMechanic(vehicle_no,mechanicID) values ('GHA011PH',17);
insert into BusMechanic(vehicle_no,mechanicID) values ('GHA121HT',18); 
insert into BusMechanic(vehicle_no,mechanicID) values ('GHA000LL',18); 
insert into BusMechanic(vehicle_no,mechanicID) values ('GHA113XY',17); 
insert into BusMechanic(vehicle_no,mechanicID) values ('GHA110IY',19);
insert into BusMechanic(vehicle_no,mechanicID) values ('GHA011PH',19);
insert into BusMechanic(vehicle_no,mechanicID) values ('GHA000LL',20);
insert into BusMechanic(vehicle_no,mechanicID) values ('GHA000LL',16); /* A bus can be serviced by more than one mechanic */











