create database bai_4;
use bai_4;

create table category(
id_c int primary key auto_increment,
name_c varchar(50) not null
);

insert into category values 
(1,"Tự nhiên"),
(2,"Xã hội"),
(3,"Truyện"),
(4,"Truyền thuyết"),
(5,"Khác");

create table authors(
id_a int primary key auto_increment,
name_a varchar(50) not null
);
insert into authors values 
(1,"Nguyễn Thái Học"),
(2,"Trần Mình Hoàng"),
(3,"Dương Trung QUốc"),
(4,"Lê Văn Hiến"),
(5,"Hà Văn Minh");

create table students(
id_s int primary key auto_increment,
name_s varchar(50),
birthday date,
clasname_s varchar(7)
);

insert into students values
(1,"Nguyễn Văn A",'1999-12-12',"C0822G1"),
(2,"Nguyễn Văn B",'1999-12-13',"C0822G1"),
(3,"Nguyễn Văn C",'1999-12-14',"C0822G1"),
(4,"Nguyễn Văn D",'1999-12-15',"C0922G1"),
(5,"Nguyễn Văn E",'1999-12-15',"C1022G1");

create table books(
id_b int primary key auto_increment,
name_b varchar(50),
page_size int,
id_a int,
foreign key (id_a) references authors(id_a),
id_c int,
foreign key (id_c) references category(id_c)
);

insert into books values 
(1,"Toán",45,1,1),
(2,"Văn",34,2,2),
(3,"Sử",56,3,2),
(4,"Địa",76,4,2),
(5,"Hóa",32,5,1);

create table borrows(
id_br int primary key auto_increment,
id_s int,
foreign key (id_s) references students(id_s),
id_b int,
foreign key(id_b) references books(id_b),
borrow_date date,
return_date date
);

insert into borrows values
(1,1,5,"2022-12-12","2022-12-13"),
(2,2,2,"2022-12-12","2022-12-15"),
(3,3,3,"2022-12-12","2022-12-15"),
(4,4,4,"2022-12-12","2022-12-12"),
(5,1,5,"2022-12-13","2022-12-15"),
(6,1,5,"2022-12-14","2022-12-14"),
(7,3,4,"2022-12-15","2022-12-29"),
(8,3,4,"2022-12-8","2022-12-14"),
(9,1,2,"2022-12-6","2022-12-30");


-- Thống kê các đầu sách được mượn nhiều nhất
select name_b, count(borrows.id_b) as sl from borrows
join books on books.id_b = borrows.id_b
group by books.name_b 
having sl = (
select count(borrows.id_b) as sl from borrows
join books on books.id_b = borrows.id_b
group by books.name_b 
order by sl desc limit 1
);


-- Thống kê các đầu sách chưa được mượn
select books.name_b,books.id_b
from borrows
join books on books.id_b = borrows.id_b
where  not exists (select books.id_b where curdate() between borrows.borrow_date and borrows.return_date)
group by books.id_b;


-- Lấy ra danh sách các học viên đã từng mượn sách và sắp xếp theo số lượng mượn sách từ lớn đến nhỏ					
select name_s, count(borrows.id_b) as `sl` 
from students 
join borrows on students.id_s = borrows.id_s
where students.id_s
group by students.name_s
order by `sl` desc;


-- Lấy ra các học viên mượn sách nhiều nhất của thư viện				
select name_s, count(borrows.id_b) as `sl`
from students 
join borrows on students.id_s = borrows.id_s
group by students.name_s
order by `sl` desc limit 2;








