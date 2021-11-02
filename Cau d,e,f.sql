USE QLBH
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