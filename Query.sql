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
--Cau d. Cho danh sách các sản phẩm có số lượng tồn <100
SELECT * FROM SanPham
WHERE SoLuongTon < 100
--Cau e. Cho danh sách các sản phẩm bán chạy nhất (số lượng bán nhiều nhất)
SELECT SP.MaSP, SP.TenSP, SP.MoTa, SP.Gia, CTHD.SoLuong AS SOLUONGBANDUOC
FROM CT_HoaDon as CTHD, SanPham as SP
WHERE CTHD.MaSP = SP.MaSP AND CTHD.SoLuong = (SELECT MAX(SoLuong)
												FROM CT_HoaDon)

--Cau f. Cho danh sách các sản phẩm có doanh thu cao nhất
SELECT SP.MaSP, SP.TenSP, SP.MoTa, SP.Gia, CTHD.ThanhTien AS DOANHTHU
FROM CT_HoaDon as CTHD, SanPham as SP
WHERE CTHD.MaSP = SP.MaSP AND CTHD.ThanhTien = (SELECT Max(ThanhTien)
												FROM CT_HoaDon)