**SupplyChainDB**
- Suppliers (**SuID**, SuName, SuStkAvail, SuCity)
- Products (**PdID**, PdName, PdColor, PdWeight)
- Projects (**PjID**, PjName, PjCity)
- SupplyChainManagement (**SuID, PdID, PjID,** ReqQty)

| Propertiy field | Data type    |
| --------------- | ------------ |
| <u>SuID</u>     | char(10)     |
| SuName          | nvarchar(50) |
| SuStkAvail      | int          |
| SuCity          | nvarchar(50) |

| Propertiy field | Data type    |
| --------------- | ------------ |
| <u>PdID</u>     | char(10)     |
| PdName          | nvarchar(50) |
| PdColor         | nvarchar(30) |
| PdWeight        | float        |

| Propertiy field | Data type    |
| --------------- | ------------ |
| <u>PjID</u>     | char(10)     |
| PjName          | nvarchar(50) |
| PjCity          | nvarchar(50) |

| Propertiy field | Data type |
| --------------- | --------- |
| <u>SuID</u>     | char(10)  |
| <u>PdID</u>     | char(10)  |
| <u>PjID</u>     | char(10)  |
| ReqQty          | int       |


Giải thích:
- Suppliers
  - SuID: Mã hãng cung ứng
  - SuName: Tên hãng cung ứng
  - SuStkAvail: Số lượng hàng còn lại trong kho của hãng cung ứng (SuStockAvailability)
  - SuCity: Thành phố hãng cung ứng đặt trụ sở
- Products
  - PdID: Mã hàng hoá
  - PdName: Tên hàng hoá
  - PdColor: Màu sắc hàng hoá
  - PdWeight: Trọng lượng hàng hoá
- Projects
  - PjID: Mã dự án
  - PjName: Tên dự án
  - PjCity: Thành phố thực hiện dự án

Kịch bản:
