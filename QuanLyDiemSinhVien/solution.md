# Thông tin sinh viên không bị điểm nào dưới 5
```sql
select * 
from SV ,KQ
where SV.MaSV not in (
	select SV.MaSV 
	from SV, KQ
	where SV.MaSV = KQ.MaSV and KQ.Diem < 5
```