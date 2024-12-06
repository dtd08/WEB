drop table tbl_patient_202004;
drop table tbl_lab_test_202004;
drop table tbl_result_202004;

create table tbl_patient_202004(
	p_no char(4) primary key,
	p_name varchar2(20),
	p_birth char(8),
	p_gender char(1),
	p_tel1 char(3),
	p_tel2 char(4),
	p_tel3 char(4),
	p_city char(2)
);

create table tbl_lab_test_202004(
	t_code char(4) primary key,
	t_name varchar2(20)
);

create table tbl_result_202004(
	p_no char(4) not null,
	t_code char(4),
	t_sdate date,
	t_status char(1),
	t_ldate date,
	t_result char(1),
	primary key(p_no, t_code, t_sdate)
);


insert into tbl_patient_202004 values('1001', '김환자', '19850301', 'M', '010', '2222', '0001', '10');
insert into tbl_patient_202004 values('1002', '이환자', '19900301', 'M', '010', '2222', '0002', '20');
insert into tbl_patient_202004 values('1003', '박환자', '19770301', 'F', '010', '2222', '0003', '30');
insert into tbl_patient_202004 values('1004', '조환자', '19650301', 'F', '010', '2222', '0004', '10');
insert into tbl_patient_202004 values('1005', '황환자', '19400301', 'M', '010', '2222', '0005', '40');
insert into tbl_patient_202004 values('1006', '양환자', '19440301', 'F', '010', '2222', '0006', '40');
insert into tbl_patient_202004 values('1007', '허환자', '19760301', 'F', '010', '2222', '0007', '10');
select * from tbl_patient_202004;


insert into tbl_lab_test_202004 values('T001', '결핵');
insert into tbl_lab_test_202004 values('T002', '장티푸스');
insert into tbl_lab_test_202004 values('T003', '수두');
insert into tbl_lab_test_202004 values('T004', '홍역');
insert into tbl_lab_test_202004 values('T005', '콜레라');
select * from tbl_lab_test_202004;


insert into tbl_result_202004 values('1001', 'T001', '2020-01-01', '1', '2020-01-02', 'X');
insert into tbl_result_202004 values('1002', 'T002', '2020-01-01', '2', '2020-01-02', 'P');
insert into tbl_result_202004 values('1003', 'T003', '2020-01-01', '2', '2020-01-02', 'N');
insert into tbl_result_202004 values('1004', 'T004', '2020-01-01', '2', '2020-01-02', 'P');
insert into tbl_result_202004 values('1005', 'T005', '2020-01-01', '2', '2020-01-02', 'P');
insert into tbl_result_202004 values('1006', 'T001', '2020-01-01', '2', '2020-01-02', 'N');
insert into tbl_result_202004 values('1007', 'T002', '2020-01-01', '2', '2020-01-02', 'P');
insert into tbl_result_202004 values('1005', 'T003', '2020-01-01', '2', '2020-01-02', 'P');
insert into tbl_result_202004 values('1006', 'T004', '2020-01-01', '2', '2020-01-02', 'N');
select * from tbl_result_202004;

delete from tbl_result_202004 where p_no = '1007' and t_code = 'T005'; 


select p_no, p_name, (substr(p_birth, 1, 4) || '년' || substr(p_birth, 5, 2) || '월' || substr(p_birth, 7, 2) || '일') as p_birth
	, case p_gender when 'M' then '남' when 'F' then '여' end as p_gender, (p_tel1 || '-' || p_tel2 || '-' || p_tel3) as p_tel
	, case p_city when '10' then '서울' when '20' then '경기' when '30' then '강원' when '40' then '대구' end as p_city
from tbl_patient_202004;


select P.p_no, P.p_name, T.t_name, to_char(R.t_sdate, 'yyyy-mm-dd') as t_sdate
	, case R.t_status when '1' then '검사중' when '2' then '검사완료' end as t_status
	, to_char(R.t_ldate, 'yyyy-mm-dd') as t_ldate
	, case R.t_result when 'X' then '미입력' when 'P' then '양성' when 'N' then '음성' end as t_result
from tbl_patient_202004 P, tbl_lab_test_202004 T, tbl_result_202004 R
where P.p_no = R.p_no and T.t_code = R.t_code
order by P.p_no;


select P.p_city, case P.p_city when '10' then '서울' when '20' then '경기' when '30' then '강원' when '40' then '대구' end as p_city_name, count(R.p_no) as l_cnt
from tbl_patient_202004 P, tbl_result_202004 R
where P.p_no = R.p_no
group by P.p_city
order by p_city;
























