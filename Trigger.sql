use QLBH
go
--Trigger a.Thành tiền CTHD= (Số lượng * (Giá bán-Giá giảm))
Create trigger trg_CTHD On CT_HoaDon
For insert, update
As
Begin
update CT_HoaDon set ThanhTien=(Select SoLuong*(GiaBan-GiaGiam) 
								from inserted )
End



GO
--Trigger b.Tổng tiền (mahd) = sum (ThanhTien) cthd(mahd)

alter trigger t_HD On CT_HoaDon
For insert, update, delete
As
Begin
update HoaDon set TongTien=(Select Sum(CT_HoaDon.ThanhTien)
							from  CT_HoaDon
							where HoaDon.MaHD=CT_HoaDon.MaHD
							group by CT_HoaDon.MaHD)
End
go