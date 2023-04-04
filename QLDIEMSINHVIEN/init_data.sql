use master
go

create database QUANLYDIEMSV

use QUANLYDIEMSV
go

create table SV(
	MaSV char(10) not null primary key,
	TenSV char(35),
	Que char(10),
)
go

create table MON(
	MaMH char(10)not null primary key,
	TenMH char(20),
	SoTC int
)
go

alter table MON
alter column TenMH nvarchar(50)

alter table SV
alter column TenSV nvarchar(35)

create table KQ(
	MaSV char(10) not null,
	MaMH char(10)not null,
	Diem float,

	constraint pk_KQ primary key(MaSV, MaMH),
	constraint fk_KQ_SV foreign key(MaSV) references SV(MaSV),
	constraint fk_KQ_MON foreign key(MaMH) references MON(MaMh),
)

alter table SV
alter column Que nvarchar(50)

insert into MON values('IT6015', N'Kỹ thuật lập trình', 3);
insert into MON values('IT6039', N'Thiết kế web', 3);
insert into MON values('IT6035', N'Toán rời rạc', 3);
insert into MON values('PE6025', N'Cầu lông 2', 1);
insert into MON values('LP6003', N'Pháp luật đại cương', 2);

insert into SV values('2021608538', N'Nguyễn Việt Hoàng', N'Bắc Giang')
insert into SV values('2021605634', N'Cao Thị Thanh Quỳnh', N'Hà Nội')
insert into SV values('2020603080', N'Trần Tuấn Hùng', N'Lai Châu')
insert into SV values('2021607515', N'Nguyễn Huy Hoàng', N'Nghệ An')
insert into SV values('2020606097', N'Nguyễn Quang Huy', N'Bắc Ninh')
insert into SV values('2019601032', N'Bùi Văn Công', N'Thanh Hoá')

insert into KQ values('2021608538', 'IT6015', 10)
insert into KQ values('2021608538', 'IT6039', 9)
insert into KQ values('2021608538', 'IT6035', 9)
insert into KQ values('2021608538', 'PE6025', 8)
insert into KQ values('2021608538', 'LP6003', 9)

insert into KQ values('2021605634', 'IT6015', 10)
insert into KQ values('2021605634', 'IT6039', 9)
insert into KQ values('2021605634', 'IT6035', 8.5)
insert into KQ values('2021605634', 'PE6025', 7)
insert into KQ values('2021605634', 'LP6003', 9)

insert into KQ values('2020603080', 'IT6015', 4)
insert into KQ values('2020603080', 'IT6039', 7)
insert into KQ values('2020603080', 'IT6035', 6)
insert into KQ values('2020603080', 'LP6003', 5)

insert into KQ values('2021607515', 'IT6015', 7)
insert into KQ values('2021607515', 'IT6039', 7)
insert into KQ values('2021607515', 'LP6003', 8)

insert into KQ values('2020606097', 'IT6015', 3)
insert into KQ values('2020606097', 'IT6039', 7)
insert into KQ values('2020606097', 'IT6035', 6)
insert into KQ values('2020606097', 'PE6025', 6)
insert into KQ values('2020606097', 'LP6003', 4)

insert into KQ values('2019601032', 'IT6015', 3)
insert into KQ values('2019601032', 'IT6039', 3)
insert into KQ values('2019601032', 'PE6025', 2)
insert into KQ values('2019601032', 'LP6003', 0)

select * 
from SV, MON, KQ
where SV.MaSV = KQ.MaSV and MON.MaMH = KQ.MaMH

update SV
set Que = N'Hà Nội'
where MaSV = '2021605634'

update SV
set Que = N'Nghệ An'
where MaSV = '2021607515'

update SV
set Que = N'Bắc Giang'
where MaSV = '2021608538'

update SV
set Que = N'Bắc Ninh'
where MaSV = '2020606097'

-- Thông tin sinh viên không bị điểm nào dưới 5
select * 
from SV ,KQ
where SV.MaSV not in (
	select SV.MaSV 
	from SV, KQ
	where SV.MaSV = KQ.MaSV and KQ.Diem < 5
)

-- Thông tin môn học không có sinh viên nào đạt điểm 10
select *
from MON
where MON.MaMH not in(
	select MON.MaMH
	from MON, KQ
	where MON.MaMH = KQ.MaMH and KQ.Diem = 10
)

-- Đưa ra thông tin sinh viên có điểm tất cả các môn > 7
select *
from SV
where SV.MaSV in(
	select MaSV
	from KQ
	where Diem > 7 and MaMH = 'IT6035'
	intersect
	select MaSV
	from KQ
	where Diem > 7 and MaMH = 'IT6015'
)

SELECT *
FROM SV
INNER JOIN KQ kq1 ON SV.MaSV = kq1.MaSV AND kq1.MaMH = 'IT6035' AND kq1.Diem > 4
INNER JOIN KQ kq2 ON SV.MaSV = kq2.MaSV AND kq2.MaMH = 'IT6015' AND kq2.Diem > 7;



-- Đưa ra danh sách sinh viên thi lại tất cả các môn học (điểm < 4 tất cả các môn)
select * 
from SV
where MaSV in (
	SELECT MaSV
	FROM KQ
	GROUP BY MaSV
	HAVING MAX(Diem) < 4
);



-- Đưa ra danh sách sinh viên không bị điểm nào dưới 5
select * from SV
where SV.MaSV in(
	select MaSV
	from KQ
	group by MaSV
	having min(diem)>=5
);



-- Đưa ra tên môn học có sinh viên đạt điểm 10
select TenMH
from MON
where MaMH in (
	select MaMH
	from KQ
	group by MaMH
	having max(Diem) = 10
);