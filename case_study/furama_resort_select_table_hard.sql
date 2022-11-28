use furama_resort;
insert into nhan_vien(
  ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd,
  luong, so_dien_thoai, email, dia_chi,
  ma_vi_tri, ma_trinh_do, ma_bo_phan
)
values
  (
    '11', 'Nguyễn Văn Cường', '1970-11-07',
    '456231786', '10000000', '0901234121',
    'annguyen@gmail.com', '295 Nguyễn Tất Thành, Hải Châu',
    '1', '3', '1'
  ),
  (
    '12', 'Võ Công Sỹ', '1980-04-04',
    '123231365', '17000000', '0374443232',
    'toan0404@gmail.com', '77 Hoàng Diệu, Hải Châu',
    '1', '4', '4'
  );
  set foreign_key_checks = 0;
  insert into hop_dong(
  ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc,
  tien_dat_coc, ma_nhan_vien, ma_khach_hang,
  ma_dich_vu
)
values
  (
    '15', '2019-12-12', '2020-12-12', '0',
    '11', '1', '3'
  ),
  (
    '14', '2019-12-12', '2020-01-21', '0',
    '12', '3', '1'
  );
  -- 21. Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả 
  -- các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho 
  -- một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
  create or replace view v_nhan_vien as select nv.* from nhan_vien nv 
  join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
  where nv.dia_chi like '% Hải Châu' and hd.ngay_lam_hop_dong = '2019-12-12';
  drop view v_nhan_vien;
  select * from v_nhan_vien;
  
  -- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
  -- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
  set sql_safe_updates = 0;
  update v_nhan_vien set dia_chi = 'Liên Chiểu';
  
  -- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng 
  -- nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
  delimiter //
  create procedure sp_xoa_khach_hang(in id int )
  begin
  delete from khach_hang where ma_khach_hang = id;
  end // delimiter ;
  call sp_xoa_khach_hang(5);
  
  -- 24. Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong 
  -- với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
  -- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
  delimiter //
  create procedure sp_them_moi_hop_dong(  in sp_ma_hop_dong int,in sp_ngay_lam_hop_dong date,in sp_ngay_ket_thuc date, 
 in sp_tien_dat_coc double,in sp_ma_nhan_vien int,in sp_ma_khach_hang int, 
  in sp_ma_dich_vu int)
  begin
  
  if sp_ma_hop_dong not in (select ma_hop_dong from hop_dong) 
  and sp_ma_nhan_vien in (select ma_nhan_vien from nhan_vien)
  and sp_ma_khach_hang in (select ma_khach_hang from khach_hang) 
  and sp_ma_dich_vu in (select ma_dich_vu from dich_vu) then
  insert into hop_dong() values (  sp_ma_hop_dong, sp_ngay_lam_hop_dong , sp_ngay_ket_thuc , 
  sp_tien_dat_coc , sp_ma_nhan_vien,sp_ma_khach_hang,sp_ma_dich_vu);
  end if;
  end // delimiter ;
  drop procedure sp_them_moi_hop_dong;
  call sp_them_moi_hop_dong (16,'2020-09-10','2021-02-10', 500, 2,2,5);
  
  -- 25. Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong 
  -- thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database
  