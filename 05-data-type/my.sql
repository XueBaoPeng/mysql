-- 创建整形表
create table my_int(
int_1 tinyint,
int_2 smallint,
int_3 mediumint,
int_4 int,
int_5 bigint
)charset utf8;

-- 插入数据
-- 正常插入
insert into my_int values(100,100,100,100,100);
-- 无效数据类型限定
insert into my_int values('a','b',100,'f');
-- 超出范围
insert into my_int values(255,10000,1000,100,10000);

-- 给表增加一个无符号类型。
alter table my_int add int_6 tinyint unsigned;
-- 插入数据
insert into my_int values(127,100,100,1000,10000,255);

alter table my_int add int_7 tinyint(1) unsigned;
alter table my_int	add int_8 tinyint(2) zerofill;


-- 创建浮点数表
create table my_float(
f1 float,
f2 float(10,2), -- 10位在精度范围之外
f3 float(6,2)	-- 6位精度范围之内。
)charset utf8;

-- 插入数据。
insert into my_float values(1000.10,1000.10,1000.10);
insert into my_float values(9999999999,99999999.99,9999.99); -- 最大值。
insert into my_float values(3e38,3.01e7,1234.56); -- 最大值。

insert into my_float values(10.323232,31,314321.10);

-- 创建定点表
create table my_decimal(
f1 float(10,2),
d1 decimal(10,2)
) charset utf8;

-- 插入数据 定点数整数部分不能超出范围。小数部分可以。
insert into my_decimal values(12345678.90,12345678.90); -- 有效数据
insert into my_decimal values(1234.123456,1234.123456789); -- 小数不封超出，可以。
insert into my_decimal values(12345678.99,12345678.99);
insert into my_decimal values(99999999.99,9999999.99); -- 没有问题
insert into my_decimal values(99999999.99,99999999.999); -- 进位 超出范围
-- 查看warings 
show warnings;

-- 创建时间日期表
create table my_date(
d1 datetime,
d2 date,
d3 time,
d4 timestamp,
d5 year
)charset utf8;

-- 插入数据
insert into my_date values
	('2016-10-04 15:46:55',
	'2016-10-04','15:47:25',
	'2016-10-04 15:47:48',
	'2016');
-- 时间改成负数
insert into my_date values
	('2016-10-04 15:46:55',
	'2016-10-04','-215:47:25',
	'2016-10-04 15:47:48',
	'2016');

-- 创建枚举表
create table my_enum(
  gender enum('男','女','不男不女','妖','保密')
)charset utf8;
insert into my_enum values('男')；
insert into my_enum values('male');

-- 增加主键

create table my_pri(
name varchar(20) not null,
id char(10) primary key comment '学号：itcast + 0000，不能重复'
)charset utf8;

-- 创建复合主键。
create table my_pri2(
id char(10) comment '学号 itcast+ 0000',
course char(10) comment '课程代码 3901+0000',
score tinyint unsigned default 0 comment '成绩',
-- 增加主键 学号和课程号是对应的，应该唯一。
primary key(id,course)
)charset utf8

-- 追加主键
create table my_pri3(
course  char(10) not null comment '课程编号',
name varchar(10) not null comment '课程编号'
)charset utf8;

--
alter table my_pri3 modifiy course char(10) primary key;













