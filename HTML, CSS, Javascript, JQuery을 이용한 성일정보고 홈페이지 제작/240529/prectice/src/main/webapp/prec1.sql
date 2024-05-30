drop table class_211;
drop table it_sungil;

create table it_sungil(
	it_code number(2) primary key,
	it_name varchar(20) unique,
	school varchar(20) not null
);

create table class_211 (
	cl_num number(5),
	cl_name varchar2(10),
	gender char(2) constraint gn_notnull not null,
	phone varchar(20) constraint phone_uni unique,
	city char(2),
	it_code number(2) references it_sungil(it_code),
	primary key(cl_num, cl_name)
);


select constraint_name, constraint_type, table_name from user_constraints
where table_name in ('CLASS_211', 'IT_SUNGIL') order by TABLE_NAME;


drop sequence seq_211;
create sequence seq_211
start with 21101;

	
insert into it_sungil values(1, 'SMART_WEB', '성일정보');
insert into it_sungil values(2, 'SOFTWARE', '성일정보');
select * from it_sungil;

insert into CLASS_211 values(seq_211.nextval, '김하나', 'F', '010-1111-2222', 1, 02);
insert into CLASS_211 values(seq_211.nextval, '김두울', 'M', '010-1111-1111', 2, 02);
insert into CLASS_211 values(seq_211.nextval, '김세엣', 'M', '010-1111-1234', 3, 02);
insert into CLASS_211 values(seq_211.nextval, '김네엣', 'M', '010-1111-3333', 4, 02);
insert into CLASS_211 values(seq_211.nextval, '김다섯', 'F', '010-1111-4444', 5, 02);
insert into CLASS_211 values(seq_211.nextval, '김여섯', 'M', '010-1111-5555', 3, 01);
insert into CLASS_211 values(seq_211.nextval, '김일곱', 'M', '010-1111-6666', 4, 01);
insert into CLASS_211 values(seq_211.nextval, '김여덟', 'F', '010-1111-7777', 5, 01);
select * from class_211;


select cl_num, cl_name, 
case gender when 'M' then '남자' else '여자' end as gender,
case city
	when '1' then '성남'
	when '2' then '광주'
	when '3' then '하남'
	when '4' then '안양'
	when '5' then '수원'
end as city,
it_name, school
from class_211 C, it_sungil I
where C.it_code = I.it_code;
