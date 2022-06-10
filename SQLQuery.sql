use master

create database MilitaryUnitBD
on
(
	name = 'MilitaryUnitBD',
	filename = 'D:\bla\bla\bla\MilitaryUnitBD.mdf',
	size = 100mb,
	maxsize = 500mb,
	filegrowth = 100mb
)
log on
(
	name = 'LogMilitaryUnitBD',
	filename = 'D:\bla\bla\bla\MilitaryUnitBD.ldf',
	size = 50mb,
	maxsize = 250mb,
	filegrowth = 50mb
)
collate cyrillic_general_ci_as

use MilitaryUnitBD

create table Platoons
(
	PlatoonId smallint not null primary key,
	OtherInfo char(1) null
)

create table Soldiers
(
	FIO nvarchar(30) not null primary key,
	PlatoonId smallint not null foreign key references Platoons(PlatoonId)
)

create table GunStock
(
	Gun varchar(20) not null primary key,
	Count int not null
)

create table TeachingStaff
(
	FIO nvarchar(30) not null primary key,
	Rank varchar(10) not null
)

create table AccountingForTheIssuanceOfWeapons
(
	Soldier nvarchar(30) not null foreign key references Soldiers(FIO),
	Techer nvarchar(30) not null foreign key references TeachingStaff(FIO),
	Gun varchar(20) not null foreign key references GunStock(Gun),
	primary key(Soldier, Gun)
)