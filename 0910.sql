select * from teacher t2,title t1 where t2.t_titleid=t1.title_id;

--新建一个员工表
create table dep(
did int not null,
depname varchar2(200)not null
);
create table emp(
empid int not null,
empname varchar2(200)not null,
did int not null

);

--插入测试数据
insert into dep values(1,'研发部');
insert into dep values(2,'销售部');
insert into dep values(3,'人事部');

insert into emp values(1,'bilel',1);
insert into emp values(2,'bil12l',2);
insert into emp values(3,'bilrl',3);
insert into emp values(4,'biwscll',3);
insert into emp values(5,'bilwerl',2);
commit;

--多表查询
select * from emp e,dep d where e.did = d.did;


--自然连接:natural join
--1.不需要写where条件
--2.自然连接是在两张表中寻找那些数据类型和列名都相同的字段，然后将它们自动连接起来，
--并返回所有符合条件的结果
--3.如果自然连接的两个表中有多列都相同，作为他们的并列条件
--4.自然连接会删除重复的列，自动删除
--5.我们可以吧自动连接理解为一种内联接
select * from emp e natural join dep d;



--内联接
--1.自然连接
--2.等值连接
--3.不等值连接  >=, > ,<,<=,!=

--内联接的语法格式
select * from dep d inner join emp e on d.did = e.did;--内联接
--写内联接时，可以省略inner
select * from dep d join emp e on d.did = e.did;



--自连接：  自己连接自己

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


--外链接
--左外
--右外 
--全外连接


--补充数据
insert into emp values (7,'jjz',8);
insert into dep values (4,'测试部');
commit;

--左外连接语法:left outer join
--左外连接时，emp表是主表，也就是特权表，需要全部显示，而dep表是子表，也就是匹配表
--从子表中选出所有能与emp匹配的数据，如果没有可以进行匹配的数据，则使用null进行匹配
--可以省略outer
select * from emp e left outer join dep d on e.did= d.did;
select * from emp e left  join dep d on e.did= d.did;
select * from emp e,dep d where e.did = d.did(+);--带有加号+的列是属于匹配表中的，使用的where
--没有left join 关键字取消on条件的使用

--右外连接语法:right outer join
--左外连接时，dep表是主表，也就是特权表，需要全部显示，而emp表是子表，也就是匹配表
--从子表中选出所有能与dep匹配的数据，如果没有可以进行匹配的数据，则使用null进行匹配
select * from emp e right outer join dep d on e.did= d.did;
select * from emp e,dep d where e.did(+) = d.did;

--完全外连接 full outer join
--完全外连接是互为主表，互为关联表
--完全外连接是不支持（+）操作的，不支持这种写法
select * from emp e full join dep d on e.did = d.did;

--表与表的交并补

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

insert into stus values (1,'张三',1,20);
insert into stus values (2,'李四',2,21);
insert into stus values (3,'王五',1,22);
insert into stus values (4,'赵六',2,23);
insert into stus values (5,'周七',1,24);

insert into player values (1,'张三',1,20);
insert into player values (2,'李四',2,21);
insert into player values (3,'王五',1,22);
insert into player values (4,'赵六',2,23);
insert into player values (5,'周七',1,24);
insert into player values (6,'孙二',1,25);
insert into player values (7,'六七',1,26);
commit;


--union,union all
--使用union将两张表的结果合并为一张新表，不含重复记录

delete from stus;
commit;

select * from stus;

--使用union all将两张表的结果合并为一张新表(新的结果表)，含重复记录


--intersect 返回两张表中交集的部分或者是相同的部分

--minus,从一个表的查询结果中，去掉第二个表中的查询结果

--同义词
--是一个可以一直存在的数据库表的别名
--同义词分为两种：一种是私有同义词，另一种是公有同义词
--私有同义词：用户自己创建的，仅能被自己和自己指定的人使用
--公有同义词：系统中的所有人都可以使用
create or replace synonym S
  for SYSTEM.STUDENT;
  
  select * from S;



--序列











