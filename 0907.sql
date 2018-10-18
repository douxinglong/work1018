--1.邮件信息存在重复
--2.要删除重复信息
--3.要保留重复信息中编号最小的行
create table t_emp(
empid int primary key,
email varchar2(200)not null
);

--插入测试数据
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

--答题
--1.分组2.求最小的min(empid)
delete from t_emp where empid not in (select min(empid) from t_emp group by email);

delete from t_emp where empid not in(select min(empid) from t_emp group by email);


-------------------------------------------------------------------------------------------------------------------------------

--内置函数

--1.字符串函数
--   1.1  sys_guid():生成GUID编码
select sys_guid() from dual;--dual表是一个没有任何作用的表，里面存放一行一列值是x

--   1.2  initcap():单词首字母大写
select initcap('hello') from dual;
--   1.3  lower():将大写单词变成小写
select lower('HELLo') from dual;
--   1.4  upper():将小写单词变成大写
select upper('hello') from dual;
--   1.5  ltrim():删除字符串左侧的空格
--        删除左侧的指定字符
select ltrim(' hello world 123') from dual;
select ltrim('阿道夫hello world 123','阿道夫') from dual;
--   1.6  rtrim():删除字符串右侧的空格
--        删除左侧的指定字符
select rtrim(' hello world 123  ') from dual;
select rtrim(' hello world 123','123') from dual;

--   1.7  trim():删除字符串左右两侧的空格
--        删除指定字符:只能删除字符串两边的字符，仅能处理一个字符
select trim(' hello world 123  ') from dual;
select trim('x'from'xxxabcxxxdefegxxx') from dual;

--   1.8.translate/replace:有三个参数：第一个参数是原字符串，第二个参数叫查找字符串，第三个删除是替换字符串
--     作用：在第一个参数中找到后，第三个参数替换第二个参数
select translate ('jackma','j','bc') from dual;--如果第二个参数有一位，替换的参数有两位，则只能替换第三个参数的第一位

select replace ('jackma','j','bc') from dual;

--   1.10.instr：返回第二个参数在第一个参数中的位置，索引值从1开始，如果没有找到返回0
--               第三个参数是从那个位置开始，y出现的第几次
select instr ('jackma','j') from dual;
--   1.11 substr：截取字符串，从第一个参数中截取字符串，第二个参数是起始位置，第三个参数是要截取的个数
select substr ('abcdefjhi',1,3) from dual;

--   1.12 concat:连接字符串,将第一个参数和第二个参数进行连接
select concat('hello',' world ') from dual;
--   1.13 chr:将ASCII码转换成字符
select chr(65) from dual;
--   1.14 ascii:将字符转换成ASCII码
select ascii ('A')from dual;
--   1.15 lpad:在字符串的左边，填充特殊自定字符，没有指定字符填充空格，填充个数，有第二个参数与第一个参数的差决定
select lpad ('tech',7,0)from dual;
--   1.16 lpad:在字符串的右边，填充特殊自定字符，没有指定字符填充空格，填充个数，有第二个参数与第一个参数的差决定
select rpad ('tech',7,0)from dual;
--   1.17 length：返回的是字符个数一个中文字符代表一位
select length('ADC') from dual;
--   1.18 lengthb：返回的是字符长度一个中文字符长度为3个，b表示byte
--Oracle 中有一部分数据中UTF-8长度为3
select lengthb('您好') from dual;
--2.数学函数
--2.1.abs:绝对值    
select abs (-15)from dual;
--2.2.ceil大于参数的最小整数
select ceil (44.15)from dual;
--2.3.floor小于参数的最大的整数
select floor(100.2) from dual;

--2.4.power参数一的参数二次方
select power(4.5,2.7) from dual;

--2.5mod 求余数
select mod(9,4) from dual;

--2.6round四舍五入，有两个参数，第一参数是值，第二参数是指定的小数位，
--不指定小数位，默认取整，指定小数位按小数位进行四舍五入
select round(100.256,2) from dual;

--2.7trunc,截取，不考虑进位问题
select trunc(100.256) from dual;
--还可截取日期
select trunc(sysdate,'yyyy') from dual;--年
select trunc(sysdate,'mm') from dual;--月
select trunc(sysdate,'dd') from dual;--日
select trunc(sysdate,'hh') from dual;--小时
select trunc(sysdate,'yyyy')from dual;
--2.8sqrt：开根号
select sqrt(9) from dual;

--2.9sign,取得数字的符号，大于0返回1，小于0返回-1，等于0返回0
select sign(100) ,sign(-100) ,sign(0) from dual;

--2.10 to_number将字符转变为数字
select to_number('88878') from dual;
select to_number('8852') from dual;

--3.日期函数
--3.1 sysdate 显示当前系统时间
select sysdate from dual; --Oracle自带格式07-9月-18

--3.2extract 截取特定时间的部分
select extract(year from date'2017-05-17') year from dual;
select extract(month from date'2017-05-17') month from dual;
select extract(day from date'2017-05-17') day from dual;

select extract(year from date'2017-03-13')年份 from dual;
--3.3next_day 指定时间的下一个星期几
select next_day(sysdate,'星期五') from dual;

--3.4last_day指定月的最后一天，加一表示一个月的第一天
select last_day(sysdate) from dual;
select last_day(sysdate) + 1 from dual;

--3.5 add_months,对指定月进行计算，
--第二个参数如果是正数向后移动，如果是负数相当于减去，向前移动
select add_months(sysdate ,3) from dual;
select add_months(sysdate ,-3) from dual;

--3.6 months_between(x,y)
--计算x与y之间差了几个月，如果x大于y,返回正数，否则返回负数
select trunc(months_between(sysdate,to_date('2019-06-07','yyyy-mm-dd'))) from dual;

--3.7 计算日期与日期之间的天数差，例如：距离高考还有139天
select 'ddd' || concat(to_char(abs(trunc((to_date('2018-06-7','yyyy-mm-dd')-sysdate)))),'天') from dual;

select (to_date('2018-06-7','yyyy-mm-dd')-sysdate) from dual;


--4.其他函数
--4.1 nvl 类似于if判断,如果第一个参数为空，则输出第二个参数
select * from student;
select nvl(s_duty,'木有职务') from student;
select nvl(s_duty,'空职务')from student;

--4.2 nvl2 如果第一个参数不是空，就输出第二个参数，是空输出第三个参数
select nvl2(s_duty,s_duty,'木有职务') from student;

--4.3 nullif 用来比较连个表达式 ，如果两个表达式相同,返回null,表达式不同，返回第一个表达式
select nullif(s_duty,null) from student;
select nullif('ab','a') from dual;

--4.4 decode 当第一个参数等于第二个参数时，返回第三个参数，不同返回第四个参数
select decode(s.s_gender,'女','软妹','猛汉') from student s;




