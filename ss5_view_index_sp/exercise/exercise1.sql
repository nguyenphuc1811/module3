create database demo;
use demo;
create table products(
id  int auto_increment primary key,
product_code varchar(50),
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(50), 
product_status bit(1)
);
insert products ( product_code,
product_name,
product_price,
product_amount,
product_description,
product_status) values ('12','xe may', 500,20,'abc',0 ),
 ('22','xe con', 2000,10,'wc',1 ),
 ('42','mo to', 1000,40,'cc',1 );
 -- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
 create unique index i_product_code on products(product_code);
 -- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
 create index i_composite on products(product_name,product_price);
 -- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
 -- So sánh câu truy vấn trước và sau khi tạo index
 explain select product_code from products where id = 1;
 explain select product_name from products where product_name = 'xe may' and product_price = 500;
 drop index i_composite on products;
 -- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view view_product as select product_code,product_name,product_price,product_status from products;
select * from view_product;
-- Tiến hành sửa đổi view
set sql_safe_updates = 0;
update view_product set product_name = 'ax' where product_code = 12;
-- Tiến hành xoá view
drop view view_product;
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter // 
create procedure sp_product () begin
select
  *
from
  products;
  end // delimiter ;
  call sp_product();
  -- Tạo store procedure thêm một sản phẩm mới
  delimiter // 
  create procedure sp_add_product (in a varchar(50),in b varchar(50),in c double,in d int,in e varchar(50),in f bit) begin
insert products ( product_code,
product_name,
product_price,
product_amount,
product_description,
product_status) values (a,b,c,d,e,f); 
end // delimiter ;
 -- Tạo store procedure sửa thông tin sản phẩm theo id
call sp_add_product('18','may bay',50,20,'gay canh',1);
delimiter // 
create procedure sp_set_product (in sp_id int,in a varchar(50),in b varchar(50),in c double,in d int,in e varchar(50),in f bit) begin
update products set  product_code = a,product_name = b,product_price = c , product_amount = d ,product_description = e,product_status = f where id = sp_id ; 
end // delimiter ;
call sp_set_product(1,'50','may cay',10,50,'hu',0);
-- Tạo store procedure xoá sản phẩm theo id
delimiter // 
create procedure sp_delete_product (in sp_id int) begin
delete from products where id = sp_id;
 end // delimiter ;
call sp_delete_product(3);