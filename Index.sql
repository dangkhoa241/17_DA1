use QLBH
go
--Tạo các index cho các câu truy vấn
create nonclustered index index_HD on HoaDon ([NgayLap])
create nonclustered index index_KH on KhachHang ([Tpho])
create nonclustered index index_SPgia on SanPham ([Gia])
create nonclustered index index_SPslt on SanPham ([SoLuongTon])
create nonclustered index index_CTHDs on CT_HoaDon ([SoLuong])
create nonclustered index index_CTHDtt on CT_HoaDon ([ThanhTien])

drop index index_HD on HoaDon 
drop index index_KH on KhachHang 
drop index index_SPgia on SanPham 
drop index index_SPslt on SanPham 
drop index index_CTHDs on CT_HoaDon 
drop index index_CTHDtt on CT_HoaDon 
--a. Cho danh sách các hoá đơn lập trong năm 2020
select *
from HoaDon with(index(index_HD))
where year(NgayLap)=2020
--b. Cho danh sách các khách hàng ở TPHCM
select *
from KhachHang with(index(index_KH))
where Tpho='TPHCM'
--c. Cho danh sách các sản phẩm có giá trong một khoảng từ....đến
select *
from SanPham with(index(index_SPgia))
where Gia between 100000 and 200000
--Cau d. Cho danh sách các sản phẩm có số lượng tồn <100
SELECT * FROM SanPham with(index(index_SPslt))
WHERE SoLuongTon < 100
--Cau e. Cho danh sách các sản phẩm bán chạy nhất (số lượng bán nhiều nhất)
SELECT SP.MaSP, SP.TenSP, SP.MoTa, SP.Gia, CTHD.SoLuong AS SOLUONGBANDUOC
FROM CT_HoaDon as CTHD with(index(index_CTHDs)), SanPham as SP
WHERE CTHD.MaSP = SP.MaSP AND CTHD.SoLuong = (SELECT MAX(SoLuong)
												FROM CT_HoaDon)

--Cau f. Cho danh sách các sản phẩm có doanh thu cao nhất
SELECT SP.MaSP, SP.TenSP, SP.MoTa, SP.Gia, CTHD.ThanhTien AS DOANHTHU
FROM CT_HoaDon as CTHD with(index(index_CTHDtt)), SanPham as SP
WHERE CTHD.MaSP = SP.MaSP AND CTHD.ThanhTien = (SELECT Max(ThanhTien)
												FROM CT_HoaDon)