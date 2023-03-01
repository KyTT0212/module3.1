use case_study_DB;

-- ================================== SQL 6-10 =============================================
-- Task 6.Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
-- chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select
	dich_vu.ma_dich_vu,
	dich_vu.ten_dich_vu,
	dich_vu.dien_tich,
	dich_vu.chi_phi_thue,
	loai_dich_vu.ten_loai_dich_vu
from
loai_dich_vu 
left join dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where
	(month(hop_dong.ngay_lam_hop_dong) between 4 and 12
		and year(hop_dong.ngay_lam_hop_dong)=2021)
group by 
	dich_vu.ma_dich_vu;
    

-- Task 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select
dich_vu.ma_dich_vu,
dich_vu.ten_dich_vu,
dich_vu.dien_tich,
dich_vu.so_nguoi_toi_da,
dich_vu.chi_phi_thue,
loai_dich_vu.ten_loai_dich_vu
from
loai_dich_vu
left join dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where 
(year(hop_dong.ngay_lam_hop_dong) = 2020
and year(hop_dong.ngay_lam_hop_dong) != 2021)
group by dich_vu.ma_dich_vu;


-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- Cách 1
select ho_ten from khach_hang
group by ho_ten;

-- Cách 2
select distinct ho_ten from khach_hang;

-- Cách 3
select t.ho_ten
from (select ho_ten, row_number() over (partition by ho_ten) as rownumber from khach_hang) t
where t.rownumber < 2;


-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hop_dong.ngay_lam_hop_dong) as thang ,count(hop_dong.ma_hop_dong) as so_luong_khach_hang
from hop_dong
join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
where year(hop_dong.ngay_lam_hop_dong) = 2021
group by thang
order by month(hop_dong.ngay_lam_hop_dong);


-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, ten_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select 
hop_dong.ma_hop_dong,
hop_dong.ngay_lam_hop_dong,
hop_dong.ngay_ket_thuc,
hop_dong.ten_dat_coc,
ifnull(sum(hop_dong_chi_tiet.so_luong),0) as so_luong_dich_vu_di_kem
from
hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
group by hop_dong.ma_hop_dong;

 
 -- ================================== SQL 11-15 =============================================

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select
dich_vu_di_kem.ma_dich_vu_di_kem,
dich_vu_di_kem.ten_dich_vu_di_kem
from
dich_vu_di_kem
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where
loai_khach.ten_loai_khach like 'Diamond'
and (khach_hang.dia_chi like  '%Vinh' 
or khach_hang.dia_chi like '%Quảng Ngãi')
group by dich_vu_di_kem.ma_dich_vu_di_kem ;


-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), ten_dat_coc của tất cả các dịch vụ đã từng được khách 
select * from hop_dong;
select hop_dong.ma_hop_dong,
    nhan_vien.ho_ten,
    khach_hang.ho_ten,
    khach_hang.sdt,
    dich_vu.ten_dich_vu,
    IFNULL(SUM(hop_dong_chi_tiet.so_luong), 0) AS so_luong_dich_vu_di_kem,
    hop_dong.ten_dat_coc
FROM
    hop_dong
        left JOIN
    nhan_vien ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
        LEFT JOIN
    khach_hang ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
        LEFT JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
WHERE
    (quarter(ngay_lam_hop_dong)=4
    and year (ngay_lam_hop_dong)=2020)
    and hop_dong.ma_hop_dong not in (month(ngay_lam_hop_dong) between 1 and 6
    and year(ngay_lam_hop_dong) = 2021)
    group by hop_dong.ma_hop_dong;
    
    -- (YEAR(hop_dong.ngay_lam_hop_dong) = 2020
--         AND MONTH(hop_dong.ngay_lam_hop_dong) > 9)
--         AND (YEAR(hop_dong.ngay_lam_hop_dong) != 2021
--         AND MONTH(hop_dong.ngay_lam_hop_dong) < 7))
-- GROUP BY hop_dong.ma_hop_dong;


-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
create view v_dich_vu_di_kem as 
select sum(ifnull(v_dich_vu_di_kemv_dich_vu_di_kemv_dich_vu_di_kemso_luong,0)) as so_luong_dich_vu_di_kem
from hop_dong_chi_tiet
group by ma_dich_vu_di_kem;

-- k

select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, dich_vu_di_kem.gia, dich_vu_di_kem.don_vi, dich_vu_di_kem.trang_thai, 
sum(ifnull(hop_dong_chi_tiet.so_luong,0)) as so_luong_dich_vu_di_kem
from hop_dong_chi_tiet
join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem = (select max(v_dich_vu_di_kem.so_luong_dich_vu_di_kem) from v_dich_vu_di_kem);

-- k

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select 
hop_dong.ma_hop_dong,
loai_dich_vu.ten_loai_dich_vu,
dich_vu_di_kem.ten_dich_vu_di_kem,
count(dich_vu_di_kem.ma_dich_vu_di_kem) as so_lan_su_dung
from
hop_dong
join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join loai_dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join dich_vu_di_kem on dich_vu_di_kem. ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong.ma_hop_dong;


-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select 
nhan_vien.ma_nhan_vien,
nhan_vien.ho_ten,
trinh_do.ten_trinh_do,
bo_phan.ten_bo_phan,
nhan_vien.sdt,
nhan_vien.dia_chi
from
 nhan_vien
left join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
left join trinh_do on trinh_do.ma_trinh_do = nhan_vien.ma_trinh_do
left join bo_phan on bo_phan.ma_bo_phan = nhan_vien.ma_bo_phan
where (year(ngay_lam_hop_dong) between 2020 and 2021)
group by nhan_vien.ma_nhan_vien
having count(hop_dong.ma_hop_dong) <= 3
order by nhan_vien.ma_nhan_vien;


-- ================================== SQL 16-20 =============================================

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET SQL_SAFE_UPDATES = 0;
delete from nhan_vien
where nhan_vien.ma_nhan_vien not in (
	select hop_dong.ma_nhan_vien from hop_dong 
    where year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021
);
select * from nhan_vien;

-- DELETE FROM nhan_vien 
-- WHERE
--     ma_nhan_vien IN (SELECT 
--         cid
--     FROM
--         (SELECT DISTINCT
--             nv.ma_nhan_vien AS cid
--         FROM
--             nhan_vien AS nv
--         JOIN hop_dong AS hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
--         
--         WHERE
--             YEAR(ngay_lam_hop_dong) BETWEEN 2019 AND 2021
--         GROUP BY nv.ma_nhan_vien
--         HAVING COUNT(hd.ma_hop_dong) < 1) AS c);
-- SELECT * FROM nhan_vien;        



-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng
--  đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.


-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set foreign_key_checks = 0;
delete from khach_hang
where khach_hang.ma_khach_hang in(
select hop_dong.ma_khach_hang
from hop_dong
where year (hop_dong.ngay_lam_hop_dong) < 2021
);
select khach_hang.ma_khach_hang, khach_hang.ho_ten 
from khach_hang ;


-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem 
set gia = gia*2
where dich_vu_di_kem.ma_dich_vu_di_kem in (
	select hop_dong_chi_tiet.ma_dich_vu_di_kem
    from hop_dong
    where ma_hop_dong in 
    (select ma_hop_dong from hop_dong where year(ngay_lam_hop_dong) = 2020)
    group by hop_dong_chi_tiet.ma_dich_vu_di_kem
	having sum(ifnull(hop_dong_chi_tiet.so_luong,0)) > 10 
);
-- l

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị 
-- bao gồm id (ma_nhan_vien, ma_khach_hangach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 
khach_hang.ma_khach_hang as id,
khach_hang.ho_ten,
khach_hang.email,
khach_hang.sdt,
khach_hang.dia_chi
from khach_hang
union all
select 
nhan_vien.ma_nhan_vien as id,
nhan_vien.ho_ten,
nhan_vien.email,
nhan_vien.sdt,
nhan_vien.dia_chi
from nhan_vien
group by id;
