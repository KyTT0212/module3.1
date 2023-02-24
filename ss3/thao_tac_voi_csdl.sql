create database bai_3;
use bai_3;

create table Category(
id_c int primary key auto_increment,
name_c varchar(50) not null
);

insert into Category values 
(1,"Tự nhiên"),
(2,"Xã hội"),
(3,"Truyện"),
(4,"Truyền thuyết"),
(5,"Khác");

create table Authors(
id_a int primary key auto_increment,
name_a varchar(50) not null
);
insert into Authors values 
(1,"Nguyễn Thái Học"),
(2,"Trần Mình Hoàng"),
(3,"Dương Trung QUốc"),
(4,"Lê Văn Hiến"),
(5,"Hà Văn Minh");

create table Students(
id_s int primary key auto_increment,
name_s varchar(50),
birthday date,
class_name varchar(7)
);

insert into Students values
(1,"Nguyễn Văn A",'1999-12-12',"C0822G1"),
(2,"Nguyễn Văn B",'1999-12-13',"C0822G1"),
(3,"Nguyễn Văn C",'1999-12-14',"C0822G1"),
(4,"Nguyễn Văn D",'1999-12-15',"C0922G1"),
(5,"Nguyễn Văn E",'1999-12-15',"C1022G1");

create table Books(
id_b int primary key auto_increment,
name_b varchar(50),
page_size int,
id_a int,
foreign key (id_a) references Authors(id_a),
id_c int,
foreign key (id_c) references Category(id_c)
);

insert into Books values 
(1,"Toán",45,1,1),
(2,"Văn",34,2,2),
(3,"Sử",56,3,2),
(4,"Địa",76,4,2),
(5,"Hóa",32,5,1);

create table Borrows(
id_br int primary key auto_increment,
id_s int,
foreign key (id_s) references Students(id_s),
id_b int,
foreign key(id_b) references Books(id_b),
borrow_date date,
return_date date
);

insert into Borrows values
(1,1,1,"2022-12-12","2022-12-13"),
(2,2,2,"2022-12-12","2022-12-15"),
(3,3,3,"2022-12-12","2022-12-15"),
(4,4,4,"2022-12-12","2022-12-12"),
(5,1,5,"2022-12-13","2022-12-15"),
(6,1,5,"2022-12-14","2022-12-14"),
(7,3,4,"2022-12-15","2022-12-29"),
(8,3,4,"2022-12-8","2022-12-14"),
(9,1,2,"2022-12-6","2022-12-30");

-- Lấy toàn bộ sách có trong thư viện, cùng với tên thể loại và tác giả
select * from Books 
 join Category on Books.id_c = Category.id_c
 join Authors on Books.id_a = Authors.id_a ;

-- id_b,name_b,page_size,Category.id_c,Authors.id_a 
-- Lấy ra danh sách học viên đã từng mượn sách và sắp xếp danh sách theo tên từ a-z
select * from Students 
join Borrows on Students.id_s = Borrows.id_s
order by name_s; 


-- Lấy ra 2 quyển sách được mượn nhiều nhất
select name_b, count(Borrows.id_b) as count from Borrows 
join Books on Books.id_b = Borrows.id_b
group by Books.name_b
order by count(Borrows.id_b) desc limit 2;

