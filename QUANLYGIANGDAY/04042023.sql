use master
go

create database QUANLYGIANGDAY
go

use QUANLYGIANGDAY
go

create table DV(
	MaDV char(10) not null primary key,
	TenDV nvarchar(50),
	DT char(15)
)

create table GV(
	MaGV char(10) not null primary key,
	TenGV nvarchar(35),
	MaDV char(10) not null

	constraint fk_GV_DV foreign key(MaDV) references DV(MaDV)
)

create table GD(
	Thang int not null,
	Nam int not null,
	MaGV char(10) not null,
	SoTiet int

	constraint pk_GD primary key(Thang, Nam, MaGV),
	constraint fk_GD_GV foreign key(MaGV) references GV(MaGV)
)
-- nhập các đơn vị
insert into DV values('FL', N'Khoa ngoại ngữ', '0336118269')
insert into DV values('IT', N'Khoa công nghệ thông tin', '0909684666');
insert into DV values('BS', N'Khoa khoa học cơ bản', '0909887443');
insert into DV values('PE', N'Khoa giáo dục thể chất', '0555998554');
insert into DV values('LP', N'Khoa giáo dục chính trị', '0904334225');

-- nhập các giảng viên
insert into GV values('GV001', N'Hoàng Quang Huy', 'IT');
insert into GV values('GV002', N'Nguyễn Lan Anh', 'IT');
insert into GV values('GV003', N'Trần Việt Hà', 'IT');

insert into GV values('GV004', N'Nguyễn Thị Thảo', 'BS');
insert into GV values('GV005', N'Lê Bá Phương', 'BS');
insert into GV values('GV006', N'Nguyễn Thị Hiên', 'BS');

insert into GV values('GV007', N'Nguyễn Thị Minh', 'FL');
insert into GV values('GV008', N'Nguyễn Thị Huế', 'FL');
insert into GV values('GV009', N'Nguyễn Thị Kim Khánh', 'FL');

insert into GV values('GV010', N'Trần Thị Tùng Lâm', 'LP');
insert into GV values('GV011', N'Trần Thị Anh', 'LP');

insert into GV values('GV012', N'Vũ Mạnh Tiến', 'PE');
insert into GV values('GV013', N'Đặng Xuân Quang', 'PE');


-- nhập thông tin giảng dạy
insert into GD values(12, 2022, 'GV002', 100);
insert into GD values(1, 2023, 'GV002', 50);
insert into GD values(2, 2023, 'GV002', 70);
insert into GD values(3, 2023, 'GV002', 80);
insert into GD values(4, 2023, 'GV002', 120);

insert into GD values(12, 2022, 'GV003', 210);
insert into GD values(1, 2023, 'GV003', 300);
insert into GD values(2, 2023, 'GV003', 150)
insert into GD values(4, 2023, 'GV003', 50);

insert into GD values(12, 2022, 'GV004', 40);
insert into GD values(1, 2023, 'GV004', 90);
insert into GD values(2, 2023, 'GV004', 190);
insert into GD values(3, 2023, 'GV004', 170);

insert into GD values(2, 2023, 'GV006', 44);
insert into GD values(3, 2023, 'GV006', 65);
insert into GD values(4, 2023, 'GV006', 34);

insert into GD values(12, 2022, 'GV007', 55);
insert into GD values(1, 2023, 'GV007', 50);
insert into GD values(2, 2023, 'GV007', 40);
insert into GD values(3, 2023, 'GV007', 30);
insert into GD values(4, 2023, 'GV007', 10);

insert into GD values(12, 2022, 'GV008', 25);
insert into GD values(3, 2023, 'GV008', 37);
insert into GD values(4, 2023, 'GV008', 19);

insert into GD values(12, 2022, 'GV009', 55);
insert into GD values(1, 2023, 'GV009', 50);
insert into GD values(2, 2023, 'GV009', 40);
insert into GD values(3, 2023, 'GV009', 310);
insert into GD values(4, 2023, 'GV009', 305);

insert into GD values(2, 2023, 'GV010', 70);
insert into GD values(3, 2023, 'GV010', 320);
insert into GD values(4, 2023, 'GV010', 303);

insert into GD values(1, 2023, 'GV011', 88);
insert into GD values(2, 2023, 'GV011', 34);
insert into GD values(3, 2023, 'GV011', 31);
insert into GD values(4, 2023, 'GV011', 30);

update GD
set SoTiet = 301
where MaGV = 'GV011' and Thang = 4


update GD
set SoTiet = 31
where MaGV = 'GV011' and Thang = 3





insert into GD values(3, 2023, 'GV012', 40);
insert into GD values(4, 2023, 'GV012', 61);



-- Đưa ra giảng viên không giảng dạy tiết nào
select * 
from GV
left join GD on GV.MaGV = GD.MaGV
where SoTiet is null


-- Đưa ra thông tin đơn vị có giảng viên dạy số tiết tháng 3 và tháng 4 năm 2023 đều lớn hơn 300 (>300)
select * 
from DV
where MaDV in (
	select GV.MaDV
	from DV
	left join GV on GV.MaDV = DV.MaDV
	left join GD on GV.MaGV = GD.MaGV
	where Nam = 2023 and Thang = 3 and SoTiet > 300
	intersect
	select GV.MaDV
	from DV
	left join GV on GV.MaDV = DV.MaDV
	left join GD on GV.MaGV = GD.MaGV
	where Nam = 2023 and Thang = 4 and SoTiet > 300
)
-- !!Chú ý lúc giao thì chỉ dùng thuộc tính mã, nếu không sẽ nhận về bảng rỗng



-- Đưa ra thông tin giảng viên hàng tháng đều có số tiết dưới 60 (<60)
select GV.* 
from GV
left join GD on GV.MaGV = GD.MaGV
group by GV.MaGV
having max(SoTiet) < 60


-- Đưa ra thông tin giảng viên có ít nhất 1 tháng dạy dưới 60 tiết
select * 
from GV
where MaGV in (
	select MaGV
	from GD
	where SoTiet<60
)

select * 
from GV
left join GD on GV.MaGV = GD.MaGV
left join DV on DV.MaDV = GV.MaDV