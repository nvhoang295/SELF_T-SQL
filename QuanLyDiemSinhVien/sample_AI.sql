-- Thông tin sinh viên không bị điểm nào dưới 5
SELECT SV.*
FROM SV
LEFT JOIN KQ ON SV.MaSV = KQ.MaSV AND KQ.Diem < 5
WHERE KQ.MaSV IS NULL;

-- Thông tin môn học không có sinh viên nào đạt điểm 10
SELECT MON.*
FROM MON
LEFT JOIN KQ ON MON.MaMH = KQ.MaMH AND KQ.Diem = 10
WHERE KQ.MaMH IS NULL;

-- Đưa ra thông tin sinh viên có điểm tất cả các môn > 7
SELECT SV.*
FROM SV
WHERE EXISTS (
	SELECT 1
	FROM KQ kq1
	INNER JOIN KQ kq2 ON kq1.MaSV = kq2.MaSV AND kq1.MaMH = 'IT6035' AND kq1.Diem > 7 AND kq2.MaMH = 'IT6015' AND kq2.Diem > 7
	WHERE SV.MaSV = kq1.MaSV
);

-- Đưa ra danh sách sinh viên thi lại tất cả các môn học (điểm < 4 tất cả các môn)
SELECT SV.*
FROM SV
WHERE NOT EXISTS (
	SELECT 1
	FROM KQ
	WHERE SV.MaSV = KQ.MaSV AND KQ.Diem >= 4
);

-- Đưa ra danh sách sinh viên không bị điểm nào dưới 5
SELECT SV.*
FROM SV
WHERE NOT EXISTS (
	SELECT 1
	FROM KQ
	WHERE SV.MaSV = KQ.MaSV AND KQ.Diem < 5
);