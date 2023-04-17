use master;
go

create database QUANLYBANHANG;
use QUANLYBANHANG;
go

create table KhachHang(
	MaKH char(10) not null primary key,
	TenKH nvarchar(35),
	DiaChi nvarchar(50)
);

create table Hang(
	MaHang char(10) not null primary key,
	Tenhang nvarchar(50),
	HangSX nvarchar(50),
	DonGia float
);

create table HangDat(
	MaKH char(10) not null,
	MaHang char(10) not null,
	SoLuong int,
	NgayGiao datetime

	constraint pk_HangDat primary key(MaKH, MaHang),
	constraint fk_HangDat_Hang foreign key(MaHang) references Hang(MaHang),
	constraint fk_HangDat_KhachHang foreign key(MaKH) references KhachHang(MaKH)
);

insert into Hang values('H001', N'Laptop ASUS Vivobook 15X OLED', N'ASUS', 17490000);
insert into Hang values('H002', N'Laptop Lenovo IdeaPad 1', N'Lenovo', 12490000);
insert into Hang values('H003', N'Laptop MSI Modern 14', N'MSI', 11490000);
insert into Hang values('H004', N'Laptop Lenovo Ideapad 5 Pro', N'Lenovo', 21990000);
insert into Hang values('H005', N'Laptop Dell Inspiron 15 3520', N'Dell', 13990000);
insert into Hang values('H006', N'Laptop Acer Aspire 3', N'Acer', 11990000);
insert into Hang values('H007', N'Laptop ASUS Zenbook 14 OLED', N'ASUS', 26490000);

insert into KhachHang values('KH001', N'Nguyễn Việt Hoàng', N'Bắc Giang');
insert into KhachHang values('KH002', N'Cao Thị Thanh Quỳnh', N'Hà Nội');
insert into KhachHang values('KH003', N'Nguyễn Hoàng Dương', N'Bắc Ninh');
insert into KhachHang values('KH004', N'Cao Thanh Cường', N'Hoà Bình');

insert into HangDat values('KH001', 'H001', 12, 3/12/2023);
insert into HangDat values('KH001', 'H003', 9, 3/14/2023);
insert into HangDat values('KH001', 'H004', 3, 3/10/2023);
insert into HangDat values('KH001', 'H005', 2, 4/12/2023);
insert into HangDat values('KH001', 'H006', 4, 3/1/2023);
insert into HangDat values('KH001', 'H007', 6, 3/29/2023);

insert into HangDat values('KH002', 'H001', 1, 2/12/2023);
insert into HangDat values('KH002', 'H003', 2, 3/2/2023);
insert into HangDat values('KH002', 'H004', 5, 1/2/2023);
insert into HangDat values('KH002', 'H005', 4, 1/10/2023);
insert into HangDat values('KH002', 'H006', 10, 1/20/2023);
insert into HangDat values('KH002', 'H007', 9, 2/19/2023);

insert into HangDat values('KH003', 'H001', 9, 1/19/2023);
insert into HangDat values('KH003', 'H003', 8, 4/19/2023);
insert into HangDat values('KH003', 'H004', 12, 3/25/2023);
insert into HangDat values('KH003', 'H005', 1, 2/24/2023);
insert into HangDat values('KH003', 'H006', 3, 1/22/2023);
insert into HangDat values('KH004', 'H007', 6, 3/7/2023);

update HangDat
set NgayGiao = '3/7/2023'
where MaKH = 'KH003' and MaHang = 'H007'

update HangDat
set NgayGiao = '1/22/2023'
where MaKH = 'KH003' and MaHang = 'H006'

update HangDat
set NgayGiao = '2/24/2023'
where MaKH = 'KH003' and MaHang = 'H005'

update HangDat
set NgayGiao = '3/25/2023'
where MaKH = 'KH003' and MaHang = 'H004'

update HangDat
set NgayGiao = '4/19/2023'
where MaKH = 'KH003' and MaHang = 'H003'

update HangDat
set NgayGiao = '1/19/2023'
where MaKH = 'KH003' and MaHang = 'H001'



delete from HangDat where MaKH = 'KH003' and MaHang = 'H004';
delete from HangDat where MaKH = 'KH003' and MaHang = 'H005';

update HangDat
set NgayGiao = '2/19/2023'
where MaKH = 'KH002' and MaHang = 'H007'

update HangDat
set NgayGiao = '1/20/2023'
where MaKH = 'KH002' and MaHang = 'H006'

update HangDat
set NgayGiao = '1/10/2023'
where MaKH = 'KH002' and MaHang = 'H005'

update HangDat
set NgayGiao = '1/2/2023'
where MaKH = 'KH002' and MaHang = 'H004'

update HangDat
set NgayGiao = '3/2/2023'
where MaKH = 'KH002' and MaHang = 'H003'

update HangDat
set NgayGiao = '2/12/2023'
where MaKH = 'KH002' and MaHang = 'H001'

update HangDat
set NgayGiao = '3/29/2023'
where MaKH = 'KH001' and MaHang = 'H007'

update HangDat
set NgayGiao = '3/1/2023'
where MaKH = 'KH001' and MaHang = 'H006'

update HangDat
set NgayGiao = '4/12/2023'
where MaKH = 'KH001' and MaHang = 'H005'

update HangDat
set NgayGiao = '3/10/2023'
where MaKH = 'KH001' and MaHang = 'H004'

update HangDat
set NgayGiao = '3/14/2023'
where MaKH = 'KH001' and MaHang = 'H003'

update HangDat
set NgayGiao = '3/12/2023'
where MaKH = 'KH001' and MaHang = 'H001'





select * from Hang
inner join HangDat on Hang.MaHang = HangDat.MaHang
inner join KhachHang on HangDat.MaKH = KhachHang.MaKh


-- Số lượng hàng lớn nhất mà KH001 đặt
select max(SoLuong)
from HangDat
where MaKH = 'KH001'


-- Số lượng đặt hàng lớn nhất, nhỏ nhất, trung bình của mặt hàng 'Laptop ASUS Zenbook 14 OLED' do hãng 'ASUS' sản xuất
select max(SoLuong) 'Max', min(SoLuong) 'Min', avg(SoLuong) 'Avg'
from HangDat
left join Hang on Hang.MaHang = HangDat.MaHang
where Hang.TenHang = 'Laptop ASUS Zenbook 14 OLED' and Hang.HangSX = 'ASUS'


-- Mã hàng, tên hàng, tổng số lượng hàng được khách đặt
select HangDat.MaHang, Hang.TenHang, sum(HangDat.SoLuong)
from HangDat
left join Hang on HangDat.MaHang = Hang.MaHang
group by HangDat.MaHang, Hang.TenHang

-- Mã hàng có số lượng đặt hàng nhỏ nhất
select MaHang, sum(SoLuong)
from HangDat
group by MaHang
having sum(SoLuong) = (
	select min(SoLuong_VirtualField) 
	from(
		select sum(SoLuong) as SoLuong_VirtualField
		from HangDat
		group by MaHang
	) as SoLuong_VirtualTable
);


-- Tên mặt hàng ít nhất 3 khách hàng mua
select HangDat.MaHang, TenHang, count(MaKH)
from Hang
inner join HangDat on HangDat.MaHang = Hang.MaHang
group by HangDat.MaHang, TenHang
having count(MaKH) >= 3

-- Tên hàng được khách mua nhiều nhất
select Hang.TenHang, sum(SoLuong)
from Hang
left join HangDat on HangDat.MaHang = Hang.MaHang
group by HangDat.MaHang, Hang.TenHang
having sum(SoLuong) = (
	select max(SoLuong_VirtualField) 
	from (
		select sum(SoLuong) as SoLuong_VirtualField
		from HangDat
		group by MaHang
	) as SoLuong_VirtualTable
)

-- Mã hàng và tên hàng không được khách hàng nào mua
select Hang.MaHang, Hang.TenHang
from Hang
left join HangDat on Hang.MaHang = HangDat.MaHang
where HangDat.NgayGiao is null
--where HangDat.SoLuong is null
