use quanlysinhvien;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select
  * 
from 
  student s 
where 
  s.studentname like 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select 
  * 
from 
  class c 
where 
  c.startdate like '%-12-%';
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select 
  * 
from 
  `subject` s 
where 
  s.credit between 3 
  and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set 
  sql_safe_updates = 0;
update 
  student 
set 
  classid = 2 
where 
  studentname = 'hung';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select 
  s.StudentName, 
  sb.SubName, 
  m.Mark 
from 
  student s 
  join mark m on s.studentid = m.studentid 
  join `subject` sb on m.subid = sb.subid 
order by 
  m.mark desc, 
  s.studentname asc;