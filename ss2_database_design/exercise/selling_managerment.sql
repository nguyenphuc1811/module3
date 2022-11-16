create database sellingmanagerment;
use sellingmanagerment;
create table customer(
  customer_id int auto_increment primary key, 
  customer_name varchar(25), 
  customer_age int
);
create table `order`(
  order_id int auto_increment primary key, 
  customer_id int, 
  order_date date, 
  oder_total_price int, 
  foreign key (customer_id) references Customer(customer_id)
);
create table product(
  product_id int auto_increment primary key, 
  product_name varchar(25), 
  product_price int
);
create table orderDetail(
  order_id int, 
  product_id int, 
  od_qty int, 
  primary key (order_id, product_id), 
  foreign key (order_id) references `order`(order_id), 
  foreign key (product_id) references product (product_id)
);
