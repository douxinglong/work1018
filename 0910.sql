select * from teacher t2,title t1 where t2.t_titleid=t1.title_id;

--�½�һ��Ա����
create table dep(
did int not null,
depname varchar2(200)not null
);
create table emp(
empid int not null,
empname varchar2(200)not null,
did int not null

);

--�����������
insert into dep values(1,'�з���');
insert into dep values(2,'���۲�');
insert into dep values(3,'���²�');

insert into emp values(1,'bilel',1);
insert into emp values(2,'bil12l',2);
insert into emp values(3,'bilrl',3);
insert into emp values(4,'biwscll',3);
insert into emp values(5,'bilwerl',2);
commit;

--����ѯ
select * from emp e,dep d where e.did = d.did;


--��Ȼ����:natural join
--1.����Ҫдwhere����
--2.��Ȼ�����������ű���Ѱ����Щ�������ͺ���������ͬ���ֶΣ�Ȼ�������Զ�����������
--���������з��������Ľ��
--3.�����Ȼ���ӵ����������ж��ж���ͬ����Ϊ���ǵĲ�������
--4.��Ȼ���ӻ�ɾ���ظ����У��Զ�ɾ��
--5.���ǿ��԰��Զ��������Ϊһ��������
select * from emp e natural join dep d;



--������
--1.��Ȼ����
--2.��ֵ����
--3.����ֵ����  >=, > ,<,<=,!=

--�����ӵ��﷨��ʽ
select * from dep d inner join emp e on d.did = e.did;--������
--д������ʱ������ʡ��inner
select * from dep d join emp e on d.did = e.did;



--�����ӣ�  �Լ������Լ�

create table testuser(
       tid int not null,
       tname varchar2 (100) not null,
       tadminid int not null

);
insert into testuser values(1,'bill',2);
insert into testuser values(2,'bilel',3);
insert into testuser values(3,'jack',1);
insert into testuser values(4,'tom',5);
insert into testuser values(5,'jarry',3);

select t1.tid,t1.tname,t2.tname from testuser t1,testuser t2
where t1.tadminid=t2.tid;


--������
--����
--���� 
--ȫ������


--��������
insert into emp values (7,'jjz',8);
insert into dep values (4,'���Բ�');
commit;

--���������﷨:left outer join
--��������ʱ��emp��������Ҳ������Ȩ����Ҫȫ����ʾ����dep�����ӱ�Ҳ����ƥ���
--���ӱ���ѡ����������empƥ������ݣ����û�п��Խ���ƥ������ݣ���ʹ��null����ƥ��
--����ʡ��outer
select * from emp e left outer join dep d on e.did= d.did;
select * from emp e left  join dep d on e.did= d.did;
select * from emp e,dep d where e.did = d.did(+);--���мӺ�+����������ƥ����еģ�ʹ�õ�where
--û��left join �ؼ���ȡ��on������ʹ��

--���������﷨:right outer join
--��������ʱ��dep��������Ҳ������Ȩ����Ҫȫ����ʾ����emp�����ӱ�Ҳ����ƥ���
--���ӱ���ѡ����������depƥ������ݣ����û�п��Խ���ƥ������ݣ���ʹ��null����ƥ��
select * from emp e right outer join dep d on e.did= d.did;
select * from emp e,dep d where e.did(+) = d.did;

--��ȫ������ full outer join
--��ȫ�������ǻ�Ϊ������Ϊ������
--��ȫ�������ǲ�֧�֣�+�������ģ���֧������д��
select * from emp e full join dep d on e.did = d.did;

--�����Ľ�����

create table stus(
stuid int not null,
stuname varchar2 (1000) not null,
stusex int not null,
stuage int not null
);

create table player(
       playerid int not null,
       playname varchar2 (1000) not null,
       playsex int not null,
       playage int not null

);

insert into stus values (1,'����',1,20);
insert into stus values (2,'����',2,21);
insert into stus values (3,'����',1,22);
insert into stus values (4,'����',2,23);
insert into stus values (5,'����',1,24);

insert into player values (1,'����',1,20);
insert into player values (2,'����',2,21);
insert into player values (3,'����',1,22);
insert into player values (4,'����',2,23);
insert into player values (5,'����',1,24);
insert into player values (6,'���',1,25);
insert into player values (7,'����',1,26);
commit;


--union,union all
--ʹ��union�����ű�Ľ���ϲ�Ϊһ���±������ظ���¼

delete from stus;
commit;

select * from stus;

--ʹ��union all�����ű�Ľ���ϲ�Ϊһ���±�(�µĽ����)�����ظ���¼


--intersect �������ű��н����Ĳ��ֻ�������ͬ�Ĳ���

--minus,��һ����Ĳ�ѯ����У�ȥ���ڶ������еĲ�ѯ���

--ͬ���
--��һ������һֱ���ڵ����ݿ��ı���
--ͬ��ʷ�Ϊ���֣�һ����˽��ͬ��ʣ���һ���ǹ���ͬ���
--˽��ͬ��ʣ��û��Լ������ģ����ܱ��Լ����Լ�ָ������ʹ��
--����ͬ��ʣ�ϵͳ�е������˶�����ʹ��
create or replace synonym S
  for SYSTEM.STUDENT;
  
  select * from S;



--����











