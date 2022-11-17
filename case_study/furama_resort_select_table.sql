use furama_resort;
-- 2 Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select 
  * 
from 
  nhan_vien nv 
where 
  substring_index(nv.ho_ten, ' ',-1) like 'h%' 
  or substring_index(nv.ho_ten, ' ',-1) like 't%' 
  or substring_index(nv.ho_ten, ' ',-1) like 'k%' 
  and length(nv.ho_ten) <= 15;
-- 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select 
  * 
from 
  khach_hang kh 
where 
  (
    year(
      curdate()
    )- year(ngay_sinh) between 18 
    and 50
  ) 
  and (
    dia_chi like '%Đà Nẵng' 
    or dia_chi like '%Quảng Trị'
  );
-- 4 Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select 
  kh.ma_khach_hang, 
  kh.ho_ten, 
  count(dv.ma_dich_vu) 
from 
  khach_hang kh 
  join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang 
  join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu 
  join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach 
where 
  lk.ten_loai_khach = 'diamond' 
group by 
  hd.ma_khach_hang 
order by 
  count(dv.ma_dich_vu);
-- 5 Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select 
  kh.ma_khach_hang, 
  kh.ho_ten, 
  lk.ten_loai_khach, 
  hd.ma_hop_dong, 
  dv.ten_dich_vu, 
  hd.ngay_lam_hop_dong, 
  hd.ngay_ket_thuc, 
  (
    ifnull(dv.chi_phi_thue, 0) + sum(
      ifnull(dvdk.gia, 0) * ifnull(hdct.so_luong, 0)
    )
  ) as Tong_tien 
from 
  loai_khach lk 
  right join khach_hang kh on lk.ma_loai_khach = kh.ma_loai_khach 
  left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang 
  left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu 
  left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
  left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
group by 
  hd.ma_hop_dong , kh.ma_khach_hang;
-- 6 Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select  dv.ma_dich_vu ,  dv.dien_tich,dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu dv left join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu left join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu where not hd.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31' group by dv.ma_dich_vu