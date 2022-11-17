use quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select 
  * 
from 
  `subject` 
where 
  credit = (
    select 
      max(credit) 
    from 
      subject
  );
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select 
  s.*, 
  max(m.mark) as max_mark 
from 
  subject s 
  join mark m on s.SubId = m.SubId 
group by 
  s.subid;
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select 
  s.*, 
  avg(m.mark) 
from 
  student s 
  join mark m on m.StudentId = s.StudentId 
group by 
  m.StudentId 
order by 
  avg(m.mark) desc;
