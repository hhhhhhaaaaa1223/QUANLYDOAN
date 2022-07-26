create database DBQuanLyDeAn
go 

use DBQuanLyDeAn
go

create table Nhom(
	IDNhom int IDENTITY(1,1) primary key,
	TenNhom nvarchar(50) null,
	status int null,
)
go
create table SinhVien(
	IDSinhVien int IDENTITY(1,1) primary key,
	HoTen nvarchar(50) Null,
	MSSV char(50) Null,
	Email char(100) Null,
	SDT char(12) null,
	GioiTinh nchar(10) Null,
	NgaySinh datetime null,
	IDNhom int null,
	FOREIGN KEY (IDNhom) REFERENCES Nhom(IDNhom),
	status int null,
)
go
create table GiaoVien(
	IDGiaoVien int IDENTITY(1,1) primary key,
	username varchar(100),
	pass varchar(100),
	HoTen nvarchar(50) Null,
	BoMon nvarchar(50) Null,
	Email char(100) Null,
	SDT char(12) null,
	GioiTinh nchar(10) Null,
	NgaySinh datetime Null,
	ad int,
	status int null,
)
go

create table DeAn(
	IDDeAn int IDENTITY(1,1) primary key,
	TenDeAn nvarchar(100) null,
	LoaiDeAn nvarchar(100) null,
	NoiDung nvarchar(500) null,
	IDNhom int null,
	FOREIGN KEY (IDNhom) REFERENCES Nhom(IDNhom),
	IDGiaoVien int null,
	FOREIGN KEY (IDGiaoVien) REFERENCES GiaoVien(IDGiaoVien)
	status int null,
)
go

create table TienDo(
	IDTienDo int IDENTITY(1,1) primary key,
	NoiDung nvarchar(500) null,
	HoanThanh int null,
	TaiLieuBaoCao nvarchar(500) null,
	ThoiGianBaoCao datetime null,
	NhanXet nvarchar(500) null,
	IDDeAn int null,
	FOREIGN KEY (IDDeAn) REFERENCES DeAn(IDDeAn),
	IDSinhVien int null,
	FOREIGN KEY (IDSinhVien) REFERENCES SinhVien(IDSinhVien),
	IDNhom int null,
	FOREIGN KEY (IDNhom) REFERENCES Nhom(IDNhom),
	status int null,
)
go

alter table GiaoVien add username varchar(100)
alter table GiaoVien add pass varchar(100)

alter table GiaoVien add status int
alter table DeAn add status int
alter table TienDo add status int
alter table SinhVien add status int
alter table Nhom add status int
insert into SinhVien (HoTen, MSSV, Email, SDT, GioiTinh)
values(N'Nguyễn Tuấn Vũ', '18133064', 'vunguyen22271@gmail.com', '0386232296', 0);
insert into SinhVien (HoTen, MSSV, Email, SDT, GioiTinh)
values(N'Phan Thành Trung', '18133059', '18133059@student.hcmute.edu.vn', '0123456789', 0);
insert into SinhVien (HoTen, MSSV, Email, SDT, GioiTinh)
values(N'Huỳnh Thị Hương Ly', '18133029', '18133029@student.hcmute.edu.vn', '0987654321', 1);

insert into Nhom (TenNhom) values (N'Nhóm 5 - Lập trình Win')

update SinhVien Set IDNhom = (SELECT IDNhom FROM Nhom WHERE TenNhom = N'Nhóm 5 - Lập trình Win')
WHERE HoTen IN(N'Nguyễn Tuấn Vũ', N'Phan Thành Trung', N'Huỳnh Thị Hương Ly')
--WHERE IDSinhVien IN (1,2,3)

insert into GiaoVien (HoTen, BoMon, Email, SDT, GioiTinh)
values (N'Huỳnh Xuân Phụng', N'Lập trình windows', 'phx@hcmute.edu.vn', '0123456789', 0)

insert into DeAn (TenDeAn, NgayBaoCao, HoanThanh, LoaiDeAn)
values (N'Quản lý sinh viên', '2020-06-30', 0, 1)

update DeAn 
Set IDGiaoVien = (SELECT IDGiaoVien FROM GiaoVien WHERE HoTen = N'Huỳnh Xuân Phụng'), 
IDNhom = (SELECT IDNhom FROM Nhom WHERE TenNhom = N'Nhóm 5 - Lập trình Win')
WHERE TenDeAn = N'Quản lý sinh viên'

insert into TienDo (NoiDung, HoanThanh, IDDeAn, IDSinhVien)
values (N'Tạo Form', 10, 1, 1)
insert into TienDo (NoiDung, HoanThanh, IDDeAn, IDSinhVien)
values (N'Viết Controllers', 10, 1, 2)
insert into TienDo (NoiDung, HoanThanh, IDDeAn, IDSinhVien)
values (N'Viết Database', 10, 1, 3)


insert into SinhVien (HoTen, MSSV, Email, SDT, GioiTinh)
values(N'Nguyễn Văn A', '18133064', 'vunguyen22271@gmail.com', '0386232296', 0);
insert into SinhVien (HoTen, MSSV, Email, SDT, GioiTinh)
values(N'Trần Văn B', '18133059', '18133059@student.hcmute.edu.vn', '0123456789', 0);
insert into SinhVien (HoTen, MSSV, Email, SDT, GioiTinh)
values(N'Trương Thị C', '18133029', '18133029@student.hcmute.edu.vn', '0987654321', 1);

insert into Nhom (TenNhom) values (N'Nhóm 6 - Mạng máy tính')

update SinhVien Set IDNhom = (SELECT IDNhom FROM Nhom WHERE TenNhom = N'Nhóm 6 - Mạng máy tính')
WHERE HoTen IN(N'Nguyễn Văn A', N'Trần Văn B', N'Trương Thị C')

insert into GiaoVien (HoTen, BoMon, Email, SDT, GioiTinh)
values (N'Huỳnh Xuân Chinh', N'Mạng máy tính', 'phx@hcmute.edu.vn', '0123456789', 0)

insert into DeAn (TenDeAn, NgayBaoCao, HoanThanh, LoaiDeAn)
values (N'Mạng công ty', '2020-06-30', 0, 1)

update DeAn 
Set IDGiaoVien = (SELECT IDGiaoVien FROM GiaoVien WHERE HoTen = N'Huỳnh Xuân Chinh'), 
IDNhom = (SELECT IDNhom FROM Nhom WHERE TenNhom = N'Nhóm 6 - Mạng máy tính')
WHERE TenDeAn = N'Mạng công ty'

insert into TienDo (NoiDung, HoanThanh, IDDeAn, IDSinhVien)
values (N'Tạo Form', 10, 2, 4)
insert into TienDo (NoiDung, HoanThanh, IDDeAn, IDSinhVien)
values (N'Viết Controllers', 10, 2, 5)
insert into TienDo (NoiDung, HoanThanh, IDDeAn, IDSinhVien)
values (N'Viết Database', 10, 2, 6)