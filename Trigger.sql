use QLBH
go
--Trigger a.Thành tiền CTHD= (Số lượng * (Giá bán-Giá giảm))
IF OBJECTPROPERTY(OBJECT_ID('dbo.trg_CTHD'), N'IsTrigger') = 1 
    DROP TRIGGER [dbo].[trg_CTHD]
GO
Create trigger trg_CTHD On CT_HoaDon
For insert, update
As
Begin
update CT_HoaDon set ThanhTien=(Select SoLuong*(GiaBan-GiaGiam) 
								from inserted )
End



GO
--Trigger b.Tổng tiền (mahd) = sum (ThanhTien) cthd(mahd)
IF OBJECTPROPERTY(OBJECT_ID('dbo.t_CTHD'), N'IsTrigger') = 1 
    DROP TRIGGER [dbo].[t_CTHD]
GO
Create trigger t_CTHD On CT_HoaDon
For insert, update, delete
As
Begin
update HoaDon set TongTien=(Select Sum(CT_HoaDon.ThanhTien)
							from  CT_HoaDon
							where HoaDon.MaHD=CT_HoaDon.MaHD
							group by CT_HoaDon.MaHD)
End
go