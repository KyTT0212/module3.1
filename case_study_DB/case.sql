create database case_study_DB;
use case_study_DB;

-------------------------------------------------------------------------
create table kieu_thue (
ma_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(50)
);

--------------------------------------------------------------------------
create table loai_dich_vu (
ma_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar (50)
);

-----------------------------------------------------------------------------
create table dich_vu (
ma_dich_vu int primary key auto_increment,
ten_dich_vu varchar(50) not null,
dien_tich int ,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int,
foreign key (ma_kieu_thue) references kieu_thue (ma_kieu_thue),
ma_loai_dich_vu int,
foreign key (ma_loai_dich_vu) references loai_dich_vu (ma_loai_dich_vu),
tieu_chuan_phong varchar(50),
mo_ta_tien_nghi_khac varchar(50),
dien_tich_ho_boi double,
so_tang int,
dich_vu_mien_phi_di_kem varchar(50)
);

------------------------------------------------------------------------
create table vi_tri(
ma_vi_tri int primary key auto_increment,
ten_vi_tri varchar(50)
);

-------------------------------------------------------------------------
create table trinh_do(
ma_trinh_do int primary key auto_increment,
ten_trinh_do varchar(50)
);

-------------------------------------------------------------------------
create table bo_phan (
ma_bo_phan int primary key auto_increment,
ten_bo_phan varchar(50)
);

-------------------------------------------------------------------------
create table nhan_vien (
ma_nhan_vien varchar(10) primary key ,
ho_ten varchar(50) not null,
ngay_sinh date not null,
so_cmnd varchar(50) not null,
luong double not null,
sdt varchar(50) not null,
email varchar(50),
dia_chi varchar(50),
ma_vi_tri int,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
ma_trinh_do int,
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
ma_bo_phan int,
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);

--------------------------------------------------------------------------
create table loai_khach(
ma_loai_khach int primary key auto_increment,
ten_loai_khach varchar(50)
);

---------------------------------------------------------------------------
create table khach_hang (
ma_khach_hang varchar(10) primary key,
ma_loai_khach int,
foreign key (ma_loai_khach) references loai_khach(ma_loai_khach),
ho_ten varchar(50) not null,
ngay_sinh date not null,
gioi_tinh bit not null,
so_cmnd varchar(50) not null,
sdt varchar(50) not null,
email varbinary(50),
dia_chi varchar (50)
);

-----------------------------------------------------------------------
create table hop_dong (
ma_hop_dong int primary key auto_increment,
ngay_lam_hop_dong date not null,
ngay_ket_thuc date not null,
ten_dat_coc double not null,
ma_nhan_vien varchar(10),
foreign key (ma_nhan_vien) references nhan_vien (ma_nhan_vien),
ma_khach_hang varchar(10),
foreign key (ma_khach_hang) references khach_hang (ma_khach_hang),
ma_dich_vu int,
foreign key (ma_dich_vu) references dich_vu (ma_dich_vu)
);

--------------------------------------------------------------------------
create table dich_vu_di_kem (
ma_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(50) not null,
gia double not null,
don_vi varchar(50) not null,
trang_thai varchar(50)
);

------------------------------------------------------------------------
create table hop_dong_chi_tiet (
ma_hop_dong_chi_tiet int primary key auto_increment,
ma_hop_dong int,
foreign key (ma_hop_dong) references hop_dong (ma_hop_dong),
ma_dich_vu_di_kem int,
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem (ma_dich_vu_di_kem),
so_luong int not null
);