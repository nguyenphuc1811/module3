create database `student-management`;
use `student-management`;
create table class(
  `id` int auto_increment primary key, 
  `name` varchar(50)
);
create table teacher(
  `id` int auto_increment primary key, 
  `name` varchar(50), 
  `age` int, 
  `country` varchar(50)
)
