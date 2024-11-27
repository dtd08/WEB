drop table tbl_vote_202005;
drop table tbl_member_202005;
drop table tbl_party_202005;

create table tbl_party_202005(
	p_code char(2) primary key,
	p_name varchar2(20),
	p_idate date,
	p_reader varchar2(20),
	p_tel1 char(3),
	p_tel2 char(4),
	p_tel3 char(4)
);

create table tbl_member_202005(
	m_no char(1) primary key,
	m_name varchar2(20),
	p_code char(2),
	p_school char(1),
	m_jumin char(13),
	m_city varchar2(20),
	foreign key(p_code) references tbl_party_202005(p_code)
);

create table tbl_vote_202005(
	v_jumin char(13) primary key,
	v_name varchar2(20),
	m_no char(1),
	v_time char(4),
	v_area char(20),
	p_v_confirm char(1),
	foreign key(m_no) references tbl_member_202005(m_no)
);

alter table tbl_vote_202005 rename column p_v_confirm to v_confirm;

insert into tbl_party_202005 values('P1','A정당','2010-01-01','위대표','02','1111','0001');
insert into tbl_party_202005 values('P2','B정당','2010-02-01','명대표','02','1111','0002');
insert into tbl_party_202005 values('P3','C정당','2010-03-01','기대표','02','1111','0003');
insert into tbl_party_202005 values('P4','D정당','2010-04-01','옥대표','02','1111','0004');
insert into tbl_party_202005 values('P5','E정당','2010-05-01','임대표','02','1111','0005');
select * from tbl_party_202005;

insert into tbl_member_202005 values('1','김후보','P1','1','6603011999991','수선화동');
insert into tbl_member_202005 values('2','이후보','P2','3','5503011999992','민들래동');
insert into tbl_member_202005 values('3','박후보','P3','2','7703011999993','나팔꽃동');
insert into tbl_member_202005 values('4','조후보','P4','2','8803011999994','진달래동');
insert into tbl_member_202005 values('5','최후보','P5','3','9903011999995','개나리동');
select * from tbl_member_202005;

insert into tbl_vote_202005 values('9901011000011','김유권','1','0930','제1투표장','N');
insert into tbl_vote_202005 values('8901012000021','이유권','2','0930','제1투표장','N');
insert into tbl_vote_202005 values('6901011000031','박유권','3','0930','제1투표장','Y');
insert into tbl_vote_202005 values('5901012000041','홍유권','4','0930','제1투표장','Y');
insert into tbl_vote_202005 values('7901011000051','조유권','5','0930','제1투표장','Y');
insert into tbl_vote_202005 values('8901012000061','최유권','1','0930','제1투표장','Y');
insert into tbl_vote_202005 values('5901011000071','지유권','1','0930','제1투표장','Y');
insert into tbl_vote_202005 values('4901012000081','장유권','3','0930','제1투표장','Y');
insert into tbl_vote_202005 values('7901011000091','정유권','3','0930','제1투표장','Y');
insert into tbl_vote_202005 values('8901012000101','강유권','4','0930','제1투표장','Y');
insert into tbl_vote_202005 values('9901011000111','신유권','5','0930','제1투표장','Y');
insert into tbl_vote_202005 values('7901012000121','오유권','1','1330','제1투표장','Y');
insert into tbl_vote_202005 values('6901011000131','현유권','4','1330','제2투표장','Y');
insert into tbl_vote_202005 values('8901011000141','왕유권','2','1330','제2투표장','Y');
insert into tbl_vote_202005 values('9901011000151','유유권','3','1330','제2투표장','Y');
insert into tbl_vote_202005 values('7901011000161','한유권','2','1330','제2투표장','Y');
insert into tbl_vote_202005 values('8901011000171','문유권','4','1330','제2투표장','Y');
insert into tbl_vote_202005 values('9901011000181','양유권','2','1330','제2투표장','Y');
insert into tbl_vote_202005 values('9901011000191','구유권','4','1330','제2투표장','Y');
insert into tbl_vote_202005 values('7901011000201','황유권','5','1330','제2투표장','Y');
insert into tbl_vote_202005 values('6901011000211','배유권','3','1330','제2투표장','Y');
insert into tbl_vote_202005 values('7901011000221','전유권','3','1330','제2투표장','Y');
insert into tbl_vote_202005 values('9901011000231','고유권','1','1330','제2투표장','Y');
insert into tbl_vote_202005 values('5901011000241','권유권','3','1330','제2투표장','Y');
select * from tbl_vote_202005;


select m.m_no, m.m_name, p.p_name
	, case m.p_school
		when '1' then '고졸'
		when '2' then '학사'
		when '3' then '석사'
		when '4' then '박사'
	end as p_school
	, ( substr(m.m_jumin,1,6) || '-' || substr(m.m_jumin,7,7) ) as m_jumin, m.m_city
	, ( p.p_tel1 || '-' || p.p_tel2 || '-' || p.p_tel3 ) as p_tel
from tbl_member_202005 m, tbl_party_202005 p
where m.p_code = p.p_code;


delete from tbl_vote_202005 where v_name in ('이서영', '이서현');


select v_name
	, ('19' || substr(v_jumin, 1, 2) || '년' || substr(v_jumin, 3, 2) || '월' || substr(v_jumin, 5, 2) || '일생' )as v_birth
	, (TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_DATE('19' || (substr(v_jumin, 1, 6)),'YYYYMMDD')) / 12)) as v_age
	, case substr(v_jumin,7,1) when '1' then '남' when '2' then '여' end as v_gender
	, m_no, (substr(v_time, 1,2) || ':' || substr(v_time, 3,2)) as v_time
	, case v_confirm when 'N' then '미확인' when 'Y' then '확인' end as v_confirm
from tbl_vote_202005
where v_area = '제1투표장'
order by m_no;

select to_char(to_number(v_time,'9999'), 'hh:mm') from tbl_vote_202005;


select m.m_no, m.m_name, count(v.v_jumin) as m_rank
from tbl_vote_202005 v, tbl_member_202005 m
where v.m_no = m.m_no and v.v_confirm = 'Y'
group by m.m_no, m.m_name
order by m_rank desc, m_no;


