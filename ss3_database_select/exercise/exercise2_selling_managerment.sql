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
  order_total_price int, 
  foreign key (customer_id) references Customer(customer_id)
);

create table product(
  product_id int auto_increment primary key, 
  product_name varchar(25), 
  product_price int
);

create table orderdetail(
  order_id int, 
  product_id int, 
  od_qty int, 
  primary key (order_id, product_id), 
  foreign key (order_id) references `order`(order_id), 
  foreign key (product_id) references product (product_id)
);

INSERT INTO `sellingmanagerment`.`customer` (
  `customer_id`, `customer_name`, `customer_age`
) 
VALUES 
  ('1', 'Minh Quan', '10'), 
  ('2', 'Ngoc Oanh', '20'), 
  ('3', 'Hong Ha', '50');
  
INSERT INTO `sellingmanagerment`.`order` (
  `order_id`, `customer_id`, `order_date`
) 
VALUES 
  ('1', '1', '2006-3-21'), 
  ('2', '2', '2006-3-23'), 
  ('3', '1', '2006-3-16');
  
INSERT INTO `sellingmanagerment`.`product` (
  `product_id`, `product_name`, `product_price`
) 
VALUES 
  ('1', 'May Giat', '3'), 
  ('2', 'Tu Lanh', '5'), 
  ('3', 'Dieu Hoa', '7'), 
  ('4', 'Quat', '1'), 
  ('5', 'Bep Dien', '2');
  
INSERT INTO `sellingmanagerment`.`orderdetail` (
  `order_id`, `product_id`, `od_qty`
) 
VALUES 
  ('1', '1', '3'), 
  ('1', '3', '7'), 
  ('1', '4', '2'), 
  ('2', '1', '1'), 
  ('3', '1', '8'), 
  ('2', '5', '4'), 
  ('2', '3', '3');
  
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select 
  order_id, 
  order_date, 
  order_total_price 
from 
  `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select 
  c.customer_name, 
  c.customer_age, 
  p.product_name 
from 
  customer c 
  join `order` o on c.customer_id = o.customer_id 
  join orderdetail od on od.order_id = o.order_id 
  join product p on p.product_id = od.product_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select 
  c.customer_name, 
  c.customer_age 
from 
  customer c 
where 
  c.customer_id not in (
    select 
      o.customer_id 
    from 
      `order` o
  );
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select 
  o.order_id, 
  o.order_date, 
  p.product_price, 
  od.od_qty, 
  (p.product_price * od.od_qty) as tongtien 
from 
  customer c 
  join `order` o on c.customer_id = o.customer_id 
  join orderdetail od on od.order_id = o.order_id 
  join product p on p.product_id = od.product_id;
