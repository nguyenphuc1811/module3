create database quanlidathang;
use quanlidathang;
create table SDT(
  sdt varchar(20) primary key, 
  ma_ncc_sdt varchar(60)
);
create table NHA_CC(
  ma_ncc int auto_increment primary key, 
  ten_ncc varchar(60), 
  dia_chi varchar(60), 
  sdt varchar(20), 
  foreign key (sdt) references SDT(sdt)
);
create table DON_DH(
  so_dh int auto_increment primary key, 
  ngay_dh date, 
  ma_ncc int, 
  constraint cung_cap foreign key (ma_ncc) references NHA_CC(ma_ncc)
);
create table PHIEU_XUAT(
  so_px int auto_increment primary key, 
  ngay_xuat date
);
create table PHIEU_NHAP(
  so_pn int auto_increment primary key, 
  ngay_nhap date
);
create table VATTU(
  ma_vtu int auto_increment primary key, 
  ten_vt varchar(60)
);
create table CHI_TIET_PHIEU_XUAT(
  so_px int, 
  ma_vtu int, 
  DG_xuat double, 
  SL_xuat int, 
  primary key(so_px, ma_vtu), 
  foreign key (so_px) references PHIEU_XUAT(so_px), 
  foreign key (ma_vtu) references VATTU(ma_vtu)
);
create table CHI_TIET_PHIEU_NHAP(
  so_pn int,
  ma_vtu int,
  DG_nhap double,
  SL_nhap int, 
  foreign key (so_pn) references PHIEU_NHAP(so_pn), 
  foreign key (ma_vtu) references VATTU(ma_vtu)
);
create table CHI_TIET_DON_DH(
  ma_vtu int, 
  so_dh int, 
  primary key (ma_vtu, so_dh), 
  foreign key (ma_vtu) references VATTU(ma_vtu), 
  foreign key (so_dh) references DON_DH(so_dh)
)
