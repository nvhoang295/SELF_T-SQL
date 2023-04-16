use master
go

create database SupplyChainDB

use SupplyChainDB
go

create table Suppliers(
	SuID char(10) not null primary key,
	SuName nvarchar(50),
	SuStkAvail int,
	SuCity nvarchar(50)
);

create table Products(
	PdID char(10) not null primary key,
	PdName nvarchar(50),
	PdColor nvarchar(30),
	PdWeight float
);

create table Projects(
	PjID char(10) not null primary key,
	PjName nvarchar(50),
	PjCity nvarchar(50),
);

create table SupplyChainManagement(
	SuID char(10) not null,
	PdID char(10) not null,
	PjID char(10) not null,
	ReqQty int
	constraint pk_SupplyChainManagement primary key(SuID, PdID, PjID),
	constraint fk_SupplyChainManagement_Suppliers foreign key(SuID) references Suppliers(SuID),
	constraint fk_SupplyChainManagement_Products foreign key(PdID) references Products(PdID),
	constraint fk_SupplyChainManagement_Projects foreign key(PjID) references Projects(PjID),
);


insert into Suppliers values('SU001', 'ASUS', 200, N'Hà Nội');
insert into Suppliers values('SU002', 'ACER', 400, N'Bắc Giang');
insert into Suppliers values('SU003', 'MSI', 100, N'Bắc Ninh');
insert into Suppliers values('SU004', 'LENOVO', 500, N'Vinh');
insert into Suppliers values('SU005', 'HP', 70, N'Hải Phòng');
insert into Suppliers values('SU006', 'DELL', 90, N'Hoà Bình');
insert into Suppliers values('SU007', 'GIGABYTE', 90, N'Hoà Bình');
insert into Suppliers values('SU008', 'LG', 90, N'Hoà Bình');
insert into Suppliers values('SU009', 'HUAWEI', 90, N'Hoà Bình');

insert into Products values('PD001', N'Laptop Asus Vivobook 15X OLED', N'Xanh', 1.7);
insert into Products values('PD002', N'Laptop ASUS Vivobook 15X OLED', N'Bạc', 1.7);
insert into Products values('PD003', N'Laptop Asus ZenBook OLED', N'Xám', 1.4);
insert into Products values('PD004', N'Laptop Acer Aspire 3', N'Bạc', 1.7);
insert into Products values('PD002', N'Laptop MSI Modern 15', N'Xám', 1.6);
insert into Products values('PD002', N'Laptop MSI Summit E14 Evo', N'Đen', 1.6);
insert into Products values('PD002', N'Laptop MSI Modern 14', N'Xám', 1.3);
insert into Products values('PD002', N'Laptop MSI Creator Z16', N'Xám', 2.2);
insert into Products values('PD002', N'', N'', );
insert into Products values('PD002', N'', N'', );

