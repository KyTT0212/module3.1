use bai_3;

-- Tạo index cho cột  title của bảng books--
create index index_name_b on books(name_b);
drop index index_name_b on books;

-- Tạo 1 view để lấy ra danh sách các quyển sách đã được mượn, có hiển thị thêm cột số lần đã được mượn--
create view view_borows_book as select books.name_b, count(id_br) as sl
from books
join borrows on books.id_b= borrows.id_b
group by books.id_b
order by sl asc;

-- Viết 1 stored procedure thêm mới book trong database với tham số kiểu IN--
delimiter //
create procedure add_books(in id int, name_book varchar(50),in page_size int,in author_id int,in category_id int
)
begin
insert into books(id_b, name_b, page_size,id_a, id_c) values (id,name_book,page_size,author_id,category_id);
end // 
delimiter ;

-- insert into books(id_b, name_b, page_size, id_a, id_c) values (6,'Tat',44,4,2);
call add_books(7,'Cam',45,3,2);


