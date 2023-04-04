# Change field's datatype

[Thay đổi kiểu dữ liệu cho trường TenMH của bảng MON thành kiểu dl nvarchar(50)](/QLDIEMSINHVIEN/README.md#thay-đổi-kiểu-dữ-liệu-cho-trường-tenmh-của-bảng-mon-thành-kiểu-dl-nvarchar50)



---
# Insert values into table

[Chèn thông tin vào bảng](/QLDIEMSINHVIEN/README.md#chèn-thông-tin-vào-bảng)



---
# Change record's value

[Sửa lại quê quán cho sinh viên có mã '2021605634' thành Hà Nội (kiểu nvarchar)](/QLDIEMSINHVIEN/README.md#sửa-lại-quê-quán-cho-sinh-viên-có-mã-2021605634-thành-hà-nội-kiểu-nvarchar)


---
# **IS NULL**

[Đưa ra giảng viên không dạy tiết nào](/QUANLYGIANGDAY/README.md#đưa-ra-giảng-viên-không-dạy-tiết-nào)



---
# **LEFT JOIN**

[Đưa ra giảng viên không dạy tiết nào](/QUANLYGIANGDAY/README.md#đưa-ra-giảng-viên-không-dạy-tiết-nào)

[Tìm mã và tên hàng không có khách hàng nào mua](/QUANLYBANHANG/README.md#tìm-mã-và-tên-hàng-không-có-khách-hàng-nào-mua)



---
# Thoả mãn một lúc 2 điều kiện cùng trường thuộc tính -> **INTERSECT**

[Cách 1 đưa ra thông tin sinh viên có điểm tất cả các môn > 7](/QLDIEMSINHVIEN/README.md#cách-1-đưa-ra-thông-tin-sinh-viên-có-điểm-tất-cả-các-môn--7)

[Đưa ra thông tin đơn vị có giảng viên dạy số tiết tháng 3 và tháng 4 năm 2023 đều lớn hơn 300 (>300)](/QUANLYGIANGDAY/README.md#đưa-ra-thông-tin-đơn-vị-có-giảng-viên-dạy-số-tiết-tháng-3-và-tháng-4-năm-2023-đều-lớn-hơn-300-300)




---
# "Tất cả đều nhỏ hơn/lớn hơn" -> **MAX/MIN**

[Đưa ra danh sách sinh viên thi lại tất cả các môn học (điểm < 4 tất cả các môn)](/QLDIEMSINHVIEN/README.md#đưa-ra-danh-sách-sinh-viên-thi-lại-tất-cả-các-môn-học-điểm--4-tất-cả-các-môn)

[Đưa ra danh sách sinh viên không bị điểm nào dưới 5](/QLDIEMSINHVIEN/README.md#đưa-ra-danh-sách-sinh-viên-không-bị-điểm-nào-dưới-5)

[Đưa ra thông tin giảng viên hàng tháng đều có số tiết dưới 60 (<60)](/QUANLYGIANGDAY/README.md#đưa-ra-thông-tin-giảng-viên-hàng-tháng-đều-có-số-tiết-dưới-60-60)


# **AVG()**
[Số lượng đặt hàng lớn nhất, nhỏ nhất, trung bình của mặt hàng 'Laptop ASUS Zenbook 14 OLED' do hãng 'ASUS' sản xuất](/QUANLYBANHANG/README.md#số-lượng-đặt-hàng-lớn-nhất-nhỏ-nhất-trung-bình-của-mặt-hàng-laptop-asus-zenbook-14-oled-do-hãng-asus-sản-xuất)

# **SUM()**
[Mã hàng, tên hàng, tổng số lượng hàng được khách đặt](/QUANLYBANHANG/README.md#mã-hàng-tên-hàng-tổng-số-lượng-hàng-được-khách-đặt)

# **COUNT()**
[Tên mặt hàng ít nhất 3 khách hàng mua](/QUANLYBANHANG/README.md#tên-mặt-hàng-ít-nhất-3-khách-hàng-mua)


---
# IN/NOT IN with subquery
[Thông tin sinh viên không bị điểm nào dưới 5](/QLDIEMSINHVIEN/README.md#thông-tin-sinh-viên-không-bị-điểm-nào-dưới-5)

[Thông tin môn học không có sinh viên nào đạt điểm 10](/QLDIEMSINHVIEN/README.md#thông-tin-môn-học-không-có-sinh-viên-nào-đạt-điểm-10)

[Đưa ra thông tin giảng viên có ít nhất 1 tháng dạy dưới 60 tiết](/QUANLYGIANGDAY/README.md#đưa-ra-thông-tin-giảng-viên-có-ít-nhất-1-tháng-dạy-dưới-60-tiết)

[Đưa ra tên môn học có sinh viên đạt điểm 10](/QLDIEMSINHVIEN/README.md#đưa-ra-tên-môn-học-có-sinh-viên-đạt-điểm-10)

# DISTINCT
[Đưa ra tên môn học có sinh viên thi được điểm dưới 5](/QLDIEMSINHVIEN/README.md#đưa-ra-tên-môn-học-có-sinh-viên-thi-được-điểm-dưới-5)

# Có được ném hàm trả về như: min(), max(), avg(), datetime(), ... vào trong SELECT không?
Vì hàm đó trả về thuộc tính đơn trị nên có thể ném vào

Những gì là thuộc tính đa trị thì không ném được vào select

# Có được ném hàm trả về như: min(), max(), avg(), datetime(), ... vào trong VALUES không?
Vì hàm đó trả về thuộc tính đơn trị nên có thể ném vào

Những gì là thuộc tính đa trị thì không ném được vào values

# **MIN(SUM(...))**, **MAX(SUM(...))**
[Đưa ra mã hàng có số lượng đặt hàng nhỏ nhất](/QUANLYBANHANG/README.md#mã-hàng-có-số-lượng-đặt-hàng-nhỏ-nhất-không-sử-dụng-sort)

[Tên hàng được mua nhiều nhất](/QUANLYBANHANG/README.md#tên-hàng-được-mua-nhiều-nhất)

# GROUP BY vs SELECT quan hệ là gì???
[Click me!](/QUANLYBANHANG/README.md#quan-hệ-giữa-select-và-group-by-là-gì)