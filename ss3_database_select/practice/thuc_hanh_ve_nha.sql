create database qlsv;
use qlsv;
create table class(
id int auto_increment primary key,
classname varchar(50));
create table student(
id int auto_increment primary key,
studentname varchar(50),
gender bit(1),
birthday date,
email varchar(50) default null,
point double,
username varchar(50),
class_id int,
foreign key(class_id) references class(id));
insert into class (classname) value ('c1121g1');
insert into class (classname) value ('c1221g1');
insert into class (classname) value ('a0821l1');
insert into class (classname) value ('a0921l1');
select * from class;
insert into student (id,studentname,gender,birthday,email,point,username,class_id) values(8,'nguyen ngoc ga', 1,'1981/12/12',null,1,'cunn',1);
insert into student (id,studentname,gender,birthday,email,point,username,class_id) values(5,'le hai heo', 1,'1990/12/12',null,8,'chunng',2);
insert into student (id,studentname,gender,birthday,email,point,username,class_id) values(6,'hoang huu cho', 1,'1987/12/12',null,4,'doann',1);
insert into student (id,studentname,gender,birthday,email,point,username,class_id) values(9,'nguyen ngoc vit', 1,'1981/12/12',null,9,null,null);
select * from student;
select student.*,class.classname from student join class on student.class_id = class.id;
select * from student inner join class on student.class_id = class.id;
select * from student where studentname = '%heo' or studentname ='%ga';
select * from student where studentname like 'nguyen%' ;
SELECT point, count(point) FROM student where point > 5 GROUP BY point ;
SELECT point, count(point) FROM student where point > 5 GROUP BY point having count(point) >=2;
select student.*,class.classname from student join class on student.class_id = class.id where classname = 'c1121g1'  order by studentname;