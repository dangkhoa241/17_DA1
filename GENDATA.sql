USE [master]

IF EXISTS(SELECT * FROM sys.databases WHERE name = 'QLBH')
BEGIN
	DROP DATABASE QLBH
END;

CREATE DATABASE QLBH;

USE [QLBH];
IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('CT_HoaDon')
            AND   TYPE = 'U')
   DROP TABLE CT_HoaDon
GO

IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('SanPham')
            AND   TYPE = 'U')
   DROP TABLE SanPham
GO
IF EXISTS (SELECT 1
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('HoaDon')
            AND   TYPE = 'U')
   DROP TABLE HoaDon
GO
IF EXISTS (SELECT *
            FROM  SYSOBJECTS
           WHERE  ID = OBJECT_ID('KhachHang')
              AND TYPE = 'U')
   DROP TABLE KhachHang
GO

CREATE TABLE KhachHang
(
	MaKH		VARCHAR(20)	NOT NULL,
	Ho		NVARCHAR(15)	NOT NULL, 
	Ten		NVARCHAR(10)	NOT NULL,
	NgaySinh	DATETIME,
	SoNha		NVARCHAR(20),
	Duong		NVARCHAR(20),
	Phuong		NVARCHAR(20),
	Quan		NVARCHAR(20),
	Tpho		NVARCHAR(20),
	DienThoai	VARCHAR(10),

	CONSTRAINT PK_KH PRIMARY KEY (MaKH)
);

CREATE TABLE SanPham
(
	MaSP		VARCHAR(20)		NOT NULL,  
	TenSP		NVARCHAR(100)	NOT NULL, 
	SoLuongTon	INT,
	MoTa	NVARCHAR(100),
	Gia	INT,

	CONSTRAINT PK_SP PRIMARY KEY (MaSP)
);

CREATE TABLE HoaDon
(
	MaHD	VARCHAR(20) NOT NULL,
	MaKH	VARCHAR(20) NOT NULL,  
	NgayLap	DATETIME,
	TongTien INT,
	
	CONSTRAINT PK_HD PRIMARY KEY (MaHD)
);

CREATE TABLE CT_HoaDon
(
	MaHD	VARCHAR(20) NOT NULL,  
	MaSP	VARCHAR(20) NOT NULL,  
	SoLuong	INT,
	GiaBan	INT,
	GiaGiam	INT,
	ThanhTien INT,
	
	CONSTRAINT PK_CTHD PRIMARY KEY (MaHD,MaSP)
);

ALTER TABLE	HoaDon ADD CONSTRAINT FK_KH_HD FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH);
ALTER TABLE CT_HoaDon ADD CONSTRAINT FK_CTHD_HD FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD);
ALTER TABLE CT_HoaDon ADD CONSTRAINT FK_CTHD_SP FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP);


USE QLBH
GO

IF DB_NAME() <> N'QLBH' SET NOEXEC ON
GO

--
-- Inserting data into table dbo.KhachHang
--
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000000', N'Trần', N'Khôi', '1971-07-10 12:06:47.590', N'43', N'Đinh Tiên Hoàng', N'Phường 6', N'Quận 7', N'TPHCM', '0232698545')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000001', N'Trần', N'Duyên', '1996-03-17 22:14:09.320', N'75', N'Hùng Vương', N'Phường 9', N'Quận 10', N'Cà Mau', '0929798858')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000002', N'Trần', N'Huệ', '1992-03-28 01:32:19.500', N'73', N'Phùng Khắc Khoan', N'Phường 17', N'Quận Củ Chi', N'TPHCM', '0160289210')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000003', N'Nguyễn', N'Vũ', '1974-06-10 18:22:30.010', N'38', N'Lê Đại Hành', N'Phường 16', N'Quận 6', N'TPHCM', '0398243835')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000004', N'Nguyễn', N'Khương', '1995-09-30 01:15:35.020', N'47', N'Hoàng Sa', N'Phường 7', N'Quận Thủ Đức', N'TPHCM', '0172910273')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000005', N'Nguyễn', N'Đông', '1992-05-26 20:29:54.290', N'23', N'Lê Văn Việt', N'Phường 11', N'Quận 9', N'TPHCM', '0317823277')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000006', N'Trần', N'Bình', '1987-10-12 03:23:08.090', N'24', N'Huỳnh Thúc Kháng', N'Phường 2', N'Quận 1', N'Nha Trang', '0703787518')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000007', N'Trần', N'Lâm', '2000-08-28 19:50:24.280', N'80', N'Lê Duẩn', N'Phường 8', N'Quận 3', N'TPHCM', '0822722192')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000008', N'Võ', N'Thi', '1975-11-25 15:27:57.520', N'33', N'Thi Sách', N'Phường 5', N'Quận 5', N'TPHCM', '0600159346')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000009', N'Lê', N'Dũng', '1973-12-03 22:45:02.150', N'17', N'Nguyễn Hữu Cảnh', N'Phường 3', N'Quận 2', N'TPHCM', '0858799607')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000010', N'Nguyễn', N'Nhi', '1988-03-13 08:28:27.110', N'38', N'Cộng Hòa', N'Phường 14', N'Quận 8', N'TPHCM', '0260778911')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000011', N'Nguyễn', N'Kim', '1979-05-11 17:59:54.930', N'54', N'Tôn Đức Thắng', N'Phường 1', N'Quận 12', N'TPHCM', '0807789425')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000012', N'Nguyễn', N'Thắng', '1978-06-08 06:06:35.410', N'98', N'Nguyễn Bình Khiêm', N'Phường 4', N'Quận Gò Vấp', N'Long Khánh', '0255418421')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000013', N'Nguyễn', N'Hải', '1986-11-11 05:14:27.220', N'88', N'Trường Sa', N'Phường 12', N'Quận 4', N'Tây Ninh', '0308167522')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000014', N'Nguyễn', N'Bích', '1991-11-25 09:02:18.270', N'73', N'Điện Biên Phủ', N'Phường 15', N'Quận 11', N'TPHCM', '0140127066')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000015', N'Nguyễn', N'Hào', '1997-03-30 11:26:16.550', N'67', N'Lê Quý Đôn', N'Phường 13', N'Quận 10', N'TPHCM', '0894314066')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000016', N'Nguyễn', N'Lan', '1992-04-20 04:52:04.430', N'58', N'Tân Kỳ Tân Quý', N'Phường 16', N'Quận 7', N'Hải Phòng', '0616849633')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000017', N'Trương', N'Nhung', '1994-07-12 16:44:26.300', N'64', N'Nguyễn Du', N'Phường 17', N'Quận Củ Chi', N'TPHCM', '0424044099')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000018', N'Hoàng', N'Mỹ', '1981-10-25 22:35:51.250', N'98', N'Cao Bá Quát', N'Phường 2', N'Quận 12', N'TPHCM', '0722826790')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000019', N'Trần', N'Thành', '1996-05-03 19:08:21.670', N'58', N'Mạc Đĩnh Chi', N'Phường 6', N'Quận 6', N'Hà Tĩnh', '0477636855')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000020', N'Thái', N'Nam', '2000-10-05 09:39:16.810', N'00', N'Phan Xích Long', N'Phường 9', N'Quận 9', N'TPHCM', '0417586152')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000021', N'Trần', N'Hồng', '1984-12-06 19:57:50.110', N'21', N'Nguyễn Huệ', N'Phường 5', N'Quận 5', N'Vinh', '0133542334')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000022', N'Phan', N'Tâm', '1990-09-05 09:51:20.920', N'60', N'Võ Thị Sáu', N'Phường 7', N'Quận Thủ Đức', N'TPHCM', '0388135823')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000023', N'Trần', N'Phong', '1985-12-09 21:04:28.070', N'83', N'Lê Thánh Tôn', N'Phường 14', N'Quận Gò Vấp', N'TPHCM', '0239054254')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000024', N'Nguyễn', N'Duy', '1994-09-01 15:33:46.060', N'94', N'Lý Thái Tổ', N'Phường 3', N'Quận 1', N'Lào Cai', '0201349405')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000025', N'Nguyễn', N'Trang', '1973-08-26 14:20:00.910', N'82', N'Cống Quỳnh', N'Phường 11', N'Quận 3', N'TPHCM', '0254405827')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000026', N'Trần', N'Tuyết', '2000-03-31 11:42:52.910', N'40', N'Phan Đình Phùng', N'Phường 12', N'Quận 11', N'TPHCM', '0615821401')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000027', N'Nguyễn', N'Tiến', '1993-10-30 12:23:13.290', N'47', N'Võ Văn Kiệt', N'Phường 8', N'Quận 2', N'Biên Hòa', '0368675518')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000028', N'Trần', N'Nghĩa', '1990-09-06 12:29:45.580', N'43', N'Hồ Xuân Hương', N'Phường 15', N'Quận 8', N'Quy Nhơn', '0436527233')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000029', N'Trần', N'Loan', '1991-10-04 18:20:02.140', N'32', N'Nguyễn Trãi', N'Phường 13', N'Quận 4', N'Cao Lãnh', '0756648731')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000030', N'Trần', N'Huy', '1984-05-26 04:40:16.950', N'26', N'Cao Thắng', N'Phường 1', N'Quận Củ Chi', N'TPHCM', '0142044973')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000031', N'Phạm', N'An', '1999-06-20 14:19:11.820', N'12', N'An Dương Vương', N'Phường 4', N'Quận 1', N'TPHCM', '0537063603')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000032', N'Trần', N'Trí', '1997-09-30 13:11:24.840', N'35', N'Nguyễn Thiện Thuật', N'Phường 6', N'Quận Thủ Đức', N'TPHCM', '0915372576')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000033', N'Trần', N'Đức', '1977-05-12 12:00:01.420', N'71', N'Lê Hồng Phong', N'Phường 2', N'Quận 6', N'TPHCM', '0662634027')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000034', N'Nguyễn', N'Long', '1974-05-19 20:51:35.550', N'33', N'Tam Kỳ Khởi Nghĩa', N'Phường 5', N'Quận 10', N'TPHCM', '0254107964')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000035', N'Nguyễn', N'Tân', '1984-07-25 18:18:43.580', N'38', N'Nguyễn Cư Trinh', N'Phường 9', N'Quận 5', N'Phú Quốc', '0164197895')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000036', N'Trần', N'Hiếu', '1975-04-30 05:11:19.630', N'92', N'Đồng Khởi', N'Phường 17', N'Quận 7', N'Huế', '0711426719')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000037', N'Trần', N'Anh', '1976-08-25 08:11:57.700', N'81', N'Nguyễn Văn Cừ', N'Phường 3', N'Quận 3', N'TPHCM', '0617028529')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000038', N'Nguyễn', N'Thư', '1985-06-22 01:02:33.510', N'76', N'Trần Cao Vân', N'Phường 7', N'Quận 9', N'TPHCM', '0379026813')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000039', N'Trần', N'Thuận', '1983-01-18 00:57:50.260', N'18', N'Lê Lợi', N'Phường 16', N'Quận 8', N'Thanh Hóa', '0575736775')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000040', N'Nguyễn', N'Tùng', '1991-10-13 10:49:04.530', N'35', N'Hoàng Văn Thụ', N'Phường 1', N'Quận 12', N'TPHCM', '0869936562')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000041', N'Trần', N'Phát', '1998-12-12 15:08:48.240', N'47', N'3 tháng 2', N'Phường 11', N'Quận Gò Vấp', N'TPHCM', '0840438181')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000042', N'Nguyễn', N'Tài', '1998-10-21 02:36:16.640', N'22', N'Lê Lai', N'Phường 8', N'Quận 11', N'TPHCM', '0656148673')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000043', N'Nguyễn', N'Ánh', '1999-11-01 19:22:50.480', N'59', N'Hai Bà Trưng', N'Phường 14', N'Quận 2', N'TPHCM', '0211987043')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000044', N'Trần', N'Trường', '1984-12-11 13:55:28.120', N'43', N'Cách mạng tháng 8', N'Phường 12', N'Quận 4', N'TPHCM', '0344954814')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000045', N'Võ', N'Lân', '1986-07-11 23:13:00.740', N'38', N'Trường Chinh', N'Phường 15', N'Quận 1', N'Bà Rịa', '0271067198')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000046', N'Nguyễn', N'Thiên', '1993-12-26 06:11:50.080', N'74', N'Hàm Nghi', N'Phường 4', N'Quận 10', N'Buôn Ma Thuột', '0502204313')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000047', N'Nguyễn', N'Quang', '1973-03-29 03:07:06.560', N'20', N'Nguyễn Thị Mình Khai', N'Phường 13', N'Quận 6', N'TPHCM', '0389270409')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000048', N'Nguyễn', N'Tín', '1977-07-08 09:49:24.930', N'49', N'Trương Định', N'Phường 2', N'Quận 12', N'TPHCM', '0566479138')
INSERT dbo.KhachHang(MaKH, Ho, Ten, NgaySinh, SoNha, Duong, Phuong, Quan, Tpho, DienThoai) VALUES (N'KH000049', N'Lê', N'Khoa', '1971-01-24 20:11:21.090', N'59', N'Bùi Thị Xuân', N'Phường 5', N'Quận 5', N'TPHCM', '0368203047')
GO

--
-- Inserting data into table dbo.SanPham
--
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00000', N'Áo thun', 113, N'', 49000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00001', N'Nón', 48, N'', 36000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00002', N'Áo sơmi', 148, N'', 653000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00003', N'Máy in', 13, N'', 49000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00004', N'Bút mực', 135, N'Mô tả ...', 60000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00005', N'Giày', 108, N'', 202000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00006', N'Sách giáo khoa', 121, N'', 548000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00007', N'Quần tây', 20, N'Mô tả ...', 171000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00008', N'Đèn ngủ', 113, N'', 858000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00009', N'Thước kẻ', 112, N'Mô tả ...', 719000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00010', N'Áo khoác', 103, N'', 33000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00011', N'Dép', 51, N'Mô tả ...', 268000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00012', N'Quần short', 5, N'', 688000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00013', N'Nồi cơm', 8, N'', 63000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00014', N'Bút chì', 131, N'', 975000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00015', N'Máy tính', 31, N'', 50000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00016', N'Điện thoại', 0, N'', 91000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00017', N'Laptop', 80, N'', 161000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00018', N'Tủ lạnh', 121, N'Mô tả ...', 146000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00019', N'Xe đạp', 149, N'', 43000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00020', N'Bình nước', 36, N'', 584000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00021', N'Quạt', 82, N'', 92000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00022', N'Quần jean', 8, N'', 662000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00023', N'Gôm', 130, N'', 66000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00024', N'Đèn ngủ', 118, N'Mô tả ...', 79000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00025', N'Bút mực', 132, N'', 283000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00026', N'Thước kẻ', 100, N'', 805000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00027', N'Áo khoác', 3, N'', 598000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00028', N'Áo sơmi', 72, N'Mô tả ...', 56000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00029', N'Quạt', 67, N'Mô tả ...', 318000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00030', N'Máy tính', 84, N'', 55000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00031', N'Áo thun', 102, N'Mô tả ...', 345000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00032', N'Gôm', 95, N'', 606000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00033', N'Máy in', 142, N'Mô tả ...', 487000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00034', N'Sách giáo khoa', 52, N'', 655000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00035', N'Quần short', 66, N'', 370000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00036', N'Điện thoại', 73, N'Mô tả ...', 40000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00037', N'Nồi cơm', 18, N'', 61000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00038', N'Bút chì', 33, N'Mô tả ...', 829000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00039', N'Quần jean', 102, N'Mô tả ...', 888000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00040', N'Nón', 54, N'', 54000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00041', N'Giày', 134, N'', 172000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00042', N'Tủ lạnh', 44, N'', 597000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00043', N'Laptop', 114, N'Mô tả ...', 722000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00044', N'Quần tây', 22, N'', 79000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00045', N'Xe đạp', 6, N'', 898000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00046', N'Dép', 36, N'', 795000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00047', N'Bình nước', 9, N'', 599000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00048', N'Máy tính', 75, N'', 97000)
INSERT dbo.SanPham(MaSP, TenSP, SoLuongTon, MoTa, Gia) VALUES (N'SP00049', N'Đèn ngủ', 13, N'', 983000)
GO

--
-- Inserting data into table dbo.HoaDon
--
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000000', 'KH000000', '2020-06-05 21:37:31.000', 474000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000001', 'KH000001', '2020-05-01 00:00:07.000', 9537000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000002', 'KH000002', '2020-05-01 00:00:09.000', 5046000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000003', 'KH000003', '2020-05-01 00:31:40.000', 4207000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000004', 'KH000004', '2020-05-01 00:00:01.000', 1000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000005', 'KH000005', '2020-07-15 15:59:32.000', 364000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000006', 'KH000006', '2020-05-11 22:49:55.000', 1088000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000007', 'KH000007', '2021-01-23 06:35:39.000', 11781000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000008', 'KH000008', '2020-11-24 14:32:58.000', 325000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000009', 'KH000009', '2020-08-10 17:00:47.000', 1445000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000010', 'KH000010', '2021-03-03 02:38:10.000', 3032000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000011', 'KH000011', '2020-10-06 20:32:09.000', 5644000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000012', 'KH000012', '2020-12-11 18:07:29.000', 2475000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000013', 'KH000013', '2020-12-11 09:18:20.000', 108000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000014', 'KH000014', '2021-02-11 13:32:23.000', 2236000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000015', 'KH000015', '2020-05-01 00:12:43.000', 10242000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000016', 'KH000016', '2021-02-28 20:09:51.000', 390000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000017', 'KH000017', '2020-05-01 00:00:03.000', 2219000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000018', 'KH000018', '2020-05-31 22:04:53.000', 3860000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000019', 'KH000019', '2020-10-12 02:25:24.000', 735000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000020', 'KH000020', '2021-06-15 07:13:49.000', 832000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000021', 'KH000021', '2020-05-01 00:00:05.000', 252000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000022', 'KH000022', '2020-05-01 00:00:02.000', 54000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000023', 'KH000023', '2021-06-28 16:08:40.000', 10170000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000024', 'KH000024', '2021-01-30 00:08:40.000', 377000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000025', 'KH000025', '2021-01-30 05:33:23.000', 1805000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000026', 'KH000026', '2020-05-01 00:14:48.000', 40000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000027', 'KH000027', '2020-05-01 00:00:02.000', 1146000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000028', 'KH000028', '2020-05-01 00:09:08.000', 1260000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000029', 'KH000029', '2020-07-25 06:05:14.000', 16060000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000030', 'KH000030', '2021-03-03 17:07:57.000', 475000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000031', 'KH000031', '2020-12-05 16:22:30.000', 380000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000032', 'KH000032', '2020-05-01 00:08:45.000', 8694000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000033', 'KH000033', '2020-11-26 02:55:52.000', 2644000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000034', 'KH000034', '2020-05-01 00:00:54.000', 440000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000035', 'KH000035', '2020-05-01 00:14:52.000', 5115000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000036', 'KH000036', '2020-11-25 13:55:04.000', 290000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000037', 'KH000037', '2020-05-01 00:00:07.000', 312000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000038', 'KH000038', '2020-11-16 01:05:56.000', 816000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000039', 'KH000039', '2020-05-01 00:01:38.000', 13622000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000040', 'KH000040', '2021-03-14 08:30:30.000', 590000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000041', 'KH000041', '2020-06-26 04:44:50.000', 1076000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000042', 'KH000042', '2020-05-01 00:08:52.000', 7940000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000043', 'KH000043', '2021-05-25 08:40:48.000', 10764000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000044', 'KH000044', '2021-01-09 22:01:00.000', 4112000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000045', 'KH000045', '2021-01-29 01:27:50.000', 3396000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000046', 'KH000046', '2020-05-01 00:05:05.000', 2481000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000047', 'KH000047', '2021-04-01 09:26:49.000', 672000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000048', 'KH000048', '2020-10-06 01:14:41.000', 11180000)
INSERT dbo.HoaDon(MaHD, MaKH, NgayLap, TongTien) VALUES (N'HD000049', 'KH000049', '2021-06-08 14:59:59.000', 608000)
GO

--
-- Inserting data into table dbo.CT_HoaDon
--
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000046', N'SP00046', 3, 858000, 31000, 2481000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000008', N'SP00008', 13, 43000, 18000, 325000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000017', N'SP00017', 7, 318000, 1000, 2219000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000003', N'SP00003', 7, 606000, 5000, 4207000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000027', N'SP00027', 2, 606000, 33000, 1146000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000049', N'SP00049', 8, 79000, 3000, 608000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000044', N'SP00044', 16, 283000, 26000, 4112000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000047', N'SP00047', 16, 54000, 12000, 672000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000045', N'SP00045', 4, 858000, 9000, 3396000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000022', N'SP00022', 1, 79000, 25000, 54000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000012', N'SP00012', 15, 172000, 7000, 2475000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000018', N'SP00018', 5, 805000, 33000, 3860000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000041', N'SP00041', 4, 283000, 14000, 1076000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000013', N'SP00013', 3, 66000, 30000, 108000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000019', N'SP00019', 15, 61000, 12000, 735000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000048', N'SP00048', 13, 888000, 28000, 11180000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000014', N'SP00014', 4, 598000, 39000, 2236000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000036', N'SP00036', 5, 92000, 34000, 290000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000042', N'SP00042', 10, 829000, 35000, 7940000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000020', N'SP00020', 16, 54000, 2000, 832000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000028', N'SP00028', 9, 146000, 6000, 1260000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000037', N'SP00037', 8, 49000, 10000, 312000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000009', N'SP00009', 17, 97000, 12000, 1445000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000015', N'SP00015', 18, 584000, 15000, 10242000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000004', N'SP00004', 1, 33000, 32000, 1000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000010', N'SP00010', 4, 795000, 37000, 3032000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000023', N'SP00023', 15, 688000, 10000, 10170000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000029', N'SP00029', 20, 805000, 2000, 16060000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000024', N'SP00024', 13, 36000, 7000, 377000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000021', N'SP00021', 9, 40000, 12000, 252000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000043', N'SP00043', 13, 858000, 30000, 10764000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000005', N'SP00005', 1, 370000, 6000, 364000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000030', N'SP00030', 19, 50000, 25000, 475000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000038', N'SP00038', 16, 54000, 3000, 816000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000025', N'SP00025', 19, 97000, 2000, 1805000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000031', N'SP00031', 5, 91000, 15000, 380000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000016', N'SP00016', 13, 60000, 30000, 390000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000011', N'SP00011', 17, 345000, 13000, 5644000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000000', N'SP00000', 6, 92000, 13000, 474000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000033', N'SP00033', 4, 688000, 27000, 2644000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000039', N'SP00039', 14, 983000, 10000, 13622000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000026', N'SP00026', 1, 54000, 14000, 40000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000032', N'SP00032', 14, 653000, 32000, 8694000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000006', N'SP00006', 8, 172000, 36000, 1088000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000034', N'SP00034', 11, 43000, 3000, 440000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000040', N'SP00040', 10, 66000, 7000, 590000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000035', N'SP00035', 15, 370000, 29000, 5115000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000001', N'SP00001', 17, 584000, 23000, 9537000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000007', N'SP00007', 17, 719000, 26000, 11781000)
INSERT dbo.CT_HoaDon(MaHD, MaSP, SoLuong, GiaBan, GiaGiam, ThanhTien) VALUES (N'HD000002', N'SP00002', 6, 858000, 17000, 5046000)
GO

--
-- Set NOEXEC to off
--

SET NOEXEC OFF
GO

