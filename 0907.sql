--1.�ʼ���Ϣ�����ظ�
--2.Ҫɾ���ظ���Ϣ
--3.Ҫ�����ظ���Ϣ�б����С����
create table t_emp(
empid int primary key,
email varchar2(200)not null
);

--�����������
insert into t_emp values (1,'bill@iss.com');
insert into t_emp values (2,'rose@iss.com');
insert into t_emp values (3,'tom@iss.com');
insert into t_emp values (4,'bill@iss.com');
insert into t_emp values (5,'bill@iss.com');
insert into t_emp values (6,'tom@iss.com');
insert into t_emp values (7,'bill@iss.com');
insert into t_emp values (8,'bill@iss.com');
insert into t_emp values (9,'rose@iss.com');
insert into t_emp values (10,'bill@iss.com');
insert into t_emp values (11,'bill@iss.com');
commit;
select * from t_emp;

--����
--1.����2.����С��min(empid)
delete from t_emp where empid not in (select min(empid) from t_emp group by email);

delete from t_emp where empid not in(select min(empid) from t_emp group by email);


-------------------------------------------------------------------------------------------------------------------------------

--���ú���

--1.�ַ�������
--   1.1  sys_guid():����GUID����
select sys_guid() from dual;--dual����һ��û���κ����õı�������һ��һ��ֵ��x

--   1.2  initcap():��������ĸ��д
select initcap('hello') from dual;
--   1.3  lower():����д���ʱ��Сд
select lower('HELLo') from dual;
--   1.4  upper():��Сд���ʱ�ɴ�д
select upper('hello') from dual;
--   1.5  ltrim():ɾ���ַ������Ŀո�
--        ɾ������ָ���ַ�
select ltrim(' hello world 123') from dual;
select ltrim('������hello world 123','������') from dual;
--   1.6  rtrim():ɾ���ַ����Ҳ�Ŀո�
--        ɾ������ָ���ַ�
select rtrim(' hello world 123  ') from dual;
select rtrim(' hello world 123','123') from dual;

--   1.7  trim():ɾ���ַ�����������Ŀո�
--        ɾ��ָ���ַ�:ֻ��ɾ���ַ������ߵ��ַ������ܴ���һ���ַ�
select trim(' hello world 123  ') from dual;
select trim('x'from'xxxabcxxxdefegxxx') from dual;

--   1.8.translate/replace:��������������һ��������ԭ�ַ������ڶ��������в����ַ�����������ɾ�����滻�ַ���
--     ���ã��ڵ�һ���������ҵ��󣬵����������滻�ڶ�������
select translate ('jackma','j','bc') from dual;--����ڶ���������һλ���滻�Ĳ�������λ����ֻ���滻�����������ĵ�һλ

select replace ('jackma','j','bc') from dual;

--   1.10.instr�����صڶ��������ڵ�һ�������е�λ�ã�����ֵ��1��ʼ�����û���ҵ�����0
--               �����������Ǵ��Ǹ�λ�ÿ�ʼ��y���ֵĵڼ���
select instr ('jackma','j') from dual;
--   1.11 substr����ȡ�ַ������ӵ�һ�������н�ȡ�ַ������ڶ�����������ʼλ�ã�������������Ҫ��ȡ�ĸ���
select substr ('abcdefjhi',1,3) from dual;

--   1.12 concat:�����ַ���,����һ�������͵ڶ���������������
select concat('hello',' world ') from dual;
--   1.13 chr:��ASCII��ת�����ַ�
select chr(65) from dual;
--   1.14 ascii:���ַ�ת����ASCII��
select ascii ('A')from dual;
--   1.15 lpad:���ַ�������ߣ���������Զ��ַ���û��ָ���ַ����ո����������еڶ����������һ�������Ĳ����
select lpad ('tech',7,0)from dual;
--   1.16 lpad:���ַ������ұߣ���������Զ��ַ���û��ָ���ַ����ո����������еڶ����������һ�������Ĳ����
select rpad ('tech',7,0)from dual;
--   1.17 length�����ص����ַ�����һ�������ַ�����һλ
select length('ADC') from dual;
--   1.18 lengthb�����ص����ַ�����һ�������ַ�����Ϊ3����b��ʾbyte
--Oracle ����һ����������UTF-8����Ϊ3
select lengthb('����') from dual;
--2.��ѧ����
--2.1.abs:����ֵ    
select abs (-15)from dual;
--2.2.ceil���ڲ�������С����
select ceil (44.15)from dual;
--2.3.floorС�ڲ�������������
select floor(100.2) from dual;

--2.4.power����һ�Ĳ������η�
select power(4.5,2.7) from dual;

--2.5mod ������
select mod(9,4) from dual;

--2.6round�������룬��������������һ������ֵ���ڶ�������ָ����С��λ��
--��ָ��С��λ��Ĭ��ȡ����ָ��С��λ��С��λ������������
select round(100.256,2) from dual;

--2.7trunc,��ȡ�������ǽ�λ����
select trunc(100.256) from dual;
--���ɽ�ȡ����
select trunc(sysdate,'yyyy') from dual;--��
select trunc(sysdate,'mm') from dual;--��
select trunc(sysdate,'dd') from dual;--��
select trunc(sysdate,'hh') from dual;--Сʱ
select trunc(sysdate,'yyyy')from dual;
--2.8sqrt��������
select sqrt(9) from dual;

--2.9sign,ȡ�����ֵķ��ţ�����0����1��С��0����-1������0����0
select sign(100) ,sign(-100) ,sign(0) from dual;

--2.10 to_number���ַ�ת��Ϊ����
select to_number('88878') from dual;
select to_number('8852') from dual;

--3.���ں���
--3.1 sysdate ��ʾ��ǰϵͳʱ��
select sysdate from dual; --Oracle�Դ���ʽ07-9��-18

--3.2extract ��ȡ�ض�ʱ��Ĳ���
select extract(year from date'2017-05-17') year from dual;
select extract(month from date'2017-05-17') month from dual;
select extract(day from date'2017-05-17') day from dual;

select extract(year from date'2017-03-13')��� from dual;
--3.3next_day ָ��ʱ�����һ�����ڼ�
select next_day(sysdate,'������') from dual;

--3.4last_dayָ���µ����һ�죬��һ��ʾһ���µĵ�һ��
select last_day(sysdate) from dual;
select last_day(sysdate) + 1 from dual;

--3.5 add_months,��ָ���½��м��㣬
--�ڶ��������������������ƶ�������Ǹ����൱�ڼ�ȥ����ǰ�ƶ�
select add_months(sysdate ,3) from dual;
select add_months(sysdate ,-3) from dual;

--3.6 months_between(x,y)
--����x��y֮����˼����£����x����y,�������������򷵻ظ���
select trunc(months_between(sysdate,to_date('2019-06-07','yyyy-mm-dd'))) from dual;

--3.7 ��������������֮�����������磺����߿�����139��
select 'ddd' || concat(to_char(abs(trunc((to_date('2018-06-7','yyyy-mm-dd')-sysdate)))),'��') from dual;

select (to_date('2018-06-7','yyyy-mm-dd')-sysdate) from dual;


--4.��������
--4.1 nvl ������if�ж�,�����һ������Ϊ�գ�������ڶ�������
select * from student;
select nvl(s_duty,'ľ��ְ��') from student;
select nvl(s_duty,'��ְ��')from student;

--4.2 nvl2 �����һ���������ǿգ�������ڶ����������ǿ��������������
select nvl2(s_duty,s_duty,'ľ��ְ��') from student;

--4.3 nullif �����Ƚ��������ʽ ������������ʽ��ͬ,����null,���ʽ��ͬ�����ص�һ�����ʽ
select nullif(s_duty,null) from student;
select nullif('ab','a') from dual;

--4.4 decode ����һ���������ڵڶ�������ʱ�����ص�������������ͬ���ص��ĸ�����
select decode(s.s_gender,'Ů','����','�ͺ�') from student s;




