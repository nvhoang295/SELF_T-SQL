**QUANLYDIEMSV**
- KQ(**MaSV,** MaMH, Diem)
- MON(**MaMH,** TenMH, SoTC)
- SV(**MaSV, TenSV,** Que)

**Kịch bản:**
- Sinh viên có mã: 2020603080 và 2020606097 có điểm dưới 5, các sinh viên còn lại điểm trên 5 tất cả các môn học
- Chỉ có duy nhất môn kỹ thuật lập trình có sinh viên đạt điểm 10
- Chỉ có 2 sinh viên: 2021605634 và 2021608538 có điểm **tất cả** các môn > 7
- Chỉ có duy nhất sinh viên: 2019601032 có điểm tất cả các môn < 4
- Chỉ có 3 sinh viên: 2021605634, 2021607515 và 2021608538 không có điểm môn nào dưới 5 (>=5 tất cả môn học)

# Lý thuyết
## Sử dụng join để kết nối
Use explicit JOINs instead of implicit joins: Instead of using the WHERE clause to join tables, use explicit JOIN clauses. This makes the code more readable and can improve performance.
```sql
-- Thông tin sinh viên không bị điểm nào dưới 5
select * 
from SV ,KQ
where SV.MaSV not in (
	select SV.MaSV 
	from SV, KQ
	where SV.MaSV = KQ.MaSV and KQ.Diem < 5
)
```

```sql
-- Thông tin sinh viên không bị điểm nào dưới 5
SELECT SV.*
FROM SV
LEFT JOIN KQ ON SV.MaSV = KQ.MaSV AND KQ.Diem < 5
WHERE KQ.MaSV IS NULL;
```


# Thay đổi kiểu dữ liệu cho trường TenMH của bảng MON thành kiểu dl nvarchar(50)
```sql
alter table MON
alter column TenMH nvarchar(50)
```

# Chèn thông tin vào bảng
Cho biết bảng MON có các kiểu dữ liệu như sau:
| field | datatype     |
| ----- | ------------ |
| MaMH  | char(10)     |
| TenMH | nvarchar(35) |
| SoTC  | int          |
Câu lệnh chèn dữ liệu là: IT6015, Kỹ thuật lập trình, 3
```sql
insert into MON values('IT6015', N'Kỹ thuật lập trình', 3);
```

# Sửa lại quê quán cho sinh viên có mã '2021605634' thành Hà Nội (kiểu nvarchar)
```sql
update SV
set Que = N'Hà Nội'
where MaSV = '2021605634'
```
# Đánh đố?
## Ques 1: Câu lệnh trên có chạy được không, giải thích?
```sql
select MON.MaMH, TenMH
from MON
left join KQ on KQ.MaMH = MON.MaMH
group by MON.MaMH, TenMH
having Diem < 5
```
> Câu lệnh này không chạy được, khi đã nhóm thành 1 cụm theo MaMH, TenMH thì sẽ có rất nhiều giá trị Diem, nên SQL sẽ không biết so sánh với cái Diem nào


# Ôn tập:

## Thông tin sinh viên không bị điểm nào dưới 5
```sql
-- Thông tin sinh viên không bị điểm nào dưới 5
select * 
from SV ,KQ
where SV.MaSV not in (
	select SV.MaSV 
	from SV, KQ
	where SV.MaSV = KQ.MaSV and KQ.Diem < 5
)
```
> Có dùng group by SV.MaSV having min(diem) được không? -> Không

## Thông tin môn học không có sinh viên nào đạt điểm 10
```sql
select *
from MON
where MON.MaMH not in(
	select MON.MaMH
	from MON, KQ
	where MON.MaMH = KQ.MaMH and KQ.Diem = 10
)
```

## Đưa ra thông tin sinh viên có điểm tất cả các môn > 7
### Cách 1 đưa ra thông tin sinh viên có điểm tất cả các môn > 7
```sql
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
```

### Cách 2 đưa ra thông tin sinh viên có điểm tất cả các môn > 7 **????????**
```sql
SELECT *
FROM SV
INNER JOIN KQ kq1 ON SV.MaSV = kq1.MaSV AND kq1.MaMH = 'IT6035' AND kq1.Diem > 4
INNER JOIN KQ kq2 ON SV.MaSV = kq2.MaSV AND kq2.MaMH = 'IT6015' AND kq2.Diem > 7;
```


## Đưa ra danh sách sinh viên thi lại tất cả các môn học (điểm < 4 tất cả các môn)
```sql
select * 
from SV
where MaSV in (
	select MaSV
	from KQ
	group by MaSV
	having max(Diem) < 4
)
```

## Đưa ra danh sách sinh viên không bị điểm nào dưới 5
```sql
select * from SV
where SV.MaSV in(
	select MaSV
	from KQ
	group by MaSV
	having min(diem)>=5
)
```

## Đưa ra tên môn học có sinh viên thi được điểm dưới 5
```sql
select MON.TenMH
from MON
where MaMH in (
	select distinct MON.MaMH
	from MON
	left join KQ on KQ.MaMH = MON.MaMH
	where Diem < 5
);
```
> Dùng DISTINCT để giảm thiểu phép so sánh trong list này

## Đưa ra tên môn học có sinh viên đạt điểm 10
Ý tưởng: Vì sau khi nhóm lại thì sẽ có nhiều giá trị, nên ta lấy max (mục đích đơn trị) rồi so sánh với 10

```sql
-- Đưa ra tên môn học có sinh viên đạt điểm 10
select TenMH
from MON
where MaMH in (
	select MaMH
	from KQ
	group by MaMH
	having max(Diem) = 10
);
```