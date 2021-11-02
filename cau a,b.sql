use QLBH
go
--Query
--a. Cho danh sách các hoá đơn lập trong năm 2020
select *
from HoaDon
where year(NgayLap)=2020
--b. Cho danh sách các khách hàng ở TPHCM
select *
from KhachHang
where Tpho='TPHCM'
--c. Cho danh sách các sản phẩm có giá trong một khoảng từ....đến
select *
from SanPham
where Gia between 100000 and 200000