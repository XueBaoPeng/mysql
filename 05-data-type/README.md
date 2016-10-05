# 数据类型

所谓的数据类型是对数据进行统一的分类。从系统的角度出发，是为了能够使用统一的方式进行管理，更好的利用空间。

SQL数据类型：数值类型，字符串类型，时间日期类型。

## 数值型

数值型数据都是数值。

系统又分为整形和小数型。

### 整形

整形又分为5类。

1. __Tinyint__  ：一个字节存储，表示的状态有256种
2. **_Smallint_** ：2个字节存储。表示状态65536中。
3. **_Medium_** ：3个字节存储。
4. **_Int_** ：标准整形。4个字节存储。
5. **_Biting_** ：8个字节存储。

**创建一张整形表**

```mysql
-- 创建整形表
create table my_int(
int_1 tinyint,
int_2 smallint,
int_3 mediumint,
int_4 int,
int_5 bigint
)charset utf8;
```

 ![QQ20161004-0](QQ20161004-0.png)

**插入数据**

```mysql
-- 插入数据
-- 正常插入
insert into my_int values(100,100,100,100,100);
-- 无效数据类型限定
insert into my_int values('a','b',100,'f');
-- 超出范围
insert into my_int values(255,10000,1000,100,10000);
```

 ![QQ20161004-1](QQ20161004-1.png)

**SQL中数据默认都是有符号的**。

**_给表增加一个无符号类型_**

```mysql
-- 给表增加一个无符号类型。
alter table my_int add int_6 int unsigned;
```

```Mysql
-- 插入数据
insert into my_int values(127,100,100,1000,10000,255);
```

 ![QQ20161004-2](QQ20161004-2.png)

 **显示宽度**:没有特别的含义。不能改变数据大小。当数据不够显示宽度时，会自动让数据变成对应的显示宽度。零填充会让数值变成无符号数。

 ![QQ20161004-3](QQ20161004-3.png)

零填充的意义： 保证数据的格式。

### 小数型

带有小数点或者说超出整形的表示范围的类型。

sql中：浮点型和定点型。

浮点型：小数点浮动。精度有限，丢失精度。

定点型：小数点固定。精度固定，不会丢失精度。

#### 浮点型

精度型数据类型。超出范围会丢失精度（4舍去5入）

浮点型又分为两种。

① float :单精度，占用4个字节精度范围大概为7位左右。

② double：双精度。占用8个字节，精度范围为15位左右。 

**创建浮点数表**。float(M,D),m代表总长度。d代表小数长度。

```mysql
-- 创建浮点数表
create table my_float(
f1 float,
f2 float(10,2), -- 10位在精度范围之外
f3 float(6,2)	-- 6位精度范围之内。
)charset utf8;
```

插入数据：可以是直接小数，也可以用科学技术。

```mysql
-- 插入数据。
insert into my_float values(1000.10,1000.10,1000.10);
insert into my_float values(9999999999,99999999.99,9999.99); -- 最大值。
insert into my_float values(3e38,3.01e7,1234.56); -- 最大值。
```

浮点型数据插入。整形部分不能超出长度。而小数部分可以超出。

 ![QQ20161004-4](QQ20161004-4.png)

 ![QQ20161004-5](QQ20161004-5.png)

#### 定点型

绝对地保证整数部分不丢失精度。理论上小数部分也不丢失精度。

创建定点表。

```mysql
-- 创建定点表
create table my_decimal(
f1 float(10,2),
d1 decimal(10,2)
) charset utf8;
```

-- 插入数据 定点数整数部分不能超出范围。小数部分可以。

```Mysql
insert into my_decimal values(12345678.90,12345678.90); -- 有效数据
insert into my_decimal values(1234.123456,1234.123456789); -- 小数不封超出，可以。
insert into my_decimal values(12345678.99,12345678.99);
insert into my_decimal values(99999999.99,9999999.99); -- 没有问题
insert into my_decimal values(99999999.99,99999999.999); -- 进位 超出范围
```

```mysql
-- 查看warings 
show warnings;
```

![QQ20161004-6](QQ20161004-6.png)

### 时间日期格式 ![QQ20161004-7](QQ20161004-7.png) 

 ![QQ20161004-8](QQ20161004-8.png)

创建时间日期表

```mysql
create table my_date(
d1 datetime,
d2 date,
d3 time,
d4 timestamp,
d5 year
)charset utf8;
```

![QQ20161004-9](QQ20161004-9.png)

time可以是负数，表示时间段。

```mysql
-- 插入数据
insert into my_date values
	('2016-10-04 15:46:55',
	'2016-10-04','15:47:25',
	'2016-10-04 15:47:48',
	'2016');
```

 ![QQ20161004-10](QQ20161004-10.png)

Timestamp 特点：只要当条记录被修改。则timestamp会修改为当前时间（数据修改时的时间）。

 ![QQ20161004-11](QQ20161004-11.png)

真正的时间戳。

```mysql
select unix_timestamp();
```

 ![QQ20161004-12](QQ20161004-12.png)

## 字符串类型

sql中有6中字符串类型。

 Char,varchar,text,blog,enum,set。

1. char：定长字符串 char(L),L length, char(4) 在utf-8下需要4x3=12个字节。

2. varchar: 变长字符串。在分配空间时，按照最大的空间分配。但是具体用了多少，要根据具体的数值确定。varchar(L) L表示长度，最多存储65536 个字符。会多出1到2个字节来确定实际存储的长度。

   ![QQ20161004-13](QQ20161004-13.png)![QQ20161004-14](QQ20161004-14.png)

   ![QQ20161004-15](QQ20161004-15.png)

![QQ20161004-16](QQ20161004-16.png)

**创建枚举表**

```mysql
create table my_enum(
  gender enum('男','女','不男不女','妖','保密')
)charset utf8;
```

插入数据，数据只能是规定数据中的一个。

```mysql
insert into my_enum values('男')；
insert into my_enum values('male');
```

![QQ20161004-17](QQ20161004-17.png)

 ![QQ20161004-18](QQ20161004-18.png)

 ![QQ20161004-19](QQ20161004-19.png)

枚举存储的实际内容是数值。 ![QQ20161004-20](QQ20161004-20.png)

#### 集合字符串

集合和枚举很类似。实际存储的是数值。而不是字符串。它是多选。

set(元素字符串)

创建集合表

```mysql
create table my_set(
hobby set('篮球','足球','乒乓球','台球','羽毛球')
)charset utf8;
```

插入数据，可以用多个字符串。也可以直接插入数值。

```mysql
insert into my_set values(3); -- 3=1+2 等于篮球+足球
insert into my_set values('篮球,羽毛球');
```

 ![QQ20161004-21](QQ20161004-21.png)

 ![QQ20161004-22](QQ20161004-22.png)

集合中每一个二进制位，被选中为1，为选中为0。 ![QQ20161004-23](QQ20161004-23.png)

 ![QQ20161004-24](QQ20161004-24.png)

集合无关顺序。

### 记录长度

mysql规定任何一条记录最长不能超过65535个字节。(varchar永远达不到理论值)

 ![QQ20161004-25](QQ20161004-25.png)

 ![QQ20161004-26](QQ20161004-26.png)

![QQ20161004-27](QQ20161004-27.png)

## 列属性

真正约束字段的数据类型。约束很单一，需要一些额外的约束来保证数据的意义。

列属性有很多

null，not null，default，primary key，unique key，auto_increment,comment.

1. Null (默认为空) ，not null（不为空）

#### 列描述

Comment 专门用来描述字段的。但不是注释。会根据表创建语句保存。

```mysql
create or replace table my_teacher(
  name varchar(20) not null comment '姓名',
  money decimal(10,2) not null comment '工资'
)charset utf8;
```

 ![QQ20161004-28](QQ20161004-28.png)

##### 默认值

```mysql
create table my_default(
name varchar(20) not null,
age tinyint unsigned default 0,
gender enum('男','女','保密') default '男'
)charset utf8;
```

```mysql
insert into my_default(name) values('高强');
insert into my_default values('呵呵',18,default);
```

 ![QQ20161004-29](QQ20161004-29.png)

#### 主键

**Primary key**：**主键**。主要的键。一张表中只能有一个字段使用对应的键，用来唯一的约束该字段里的数据。不能重复。

一张表只能有一个主键。

**增加主键**

多种方式。

1. 创建表时直接在字段之后primary key。

```mysql
create table my_pri(
name varchar(20) not null,
id char(10) primary key comment '学号：itcast + 0000，不能重复'
)charset utf8;
```

主键本身就不能为空，所以不加not null。

 ![QQ20161005-30](QQ20161005-30.png)

有点，快捷，缺点，只能使用一个字段作为主键。

2. 在创建表之后，在所有字段之后加上primary key(主键字段列表)来创建。

   ```mysql
   -- 创建复合主键。
   create table my_pri2(
   id char(10) comment '学号 itcast+ 0000',
   course char(10) comment '课程代码 3901+0000',
   score tinyint unsigned default 0 comment '成绩',
   -- 增加主键 学号和课程号是对应的，应该唯一。
   primary key(id,course)
   )charset utf8
   ```

 ![QQ20161005-31](QQ20161005-31.png)

3. 当表创建好之后。追加主键。 

```mysql
alter table 表名 add primary key(字段列表);
```

```mysql
create table my_pri3(
course  char(10) not null comment '课程编号',
name varchar(10) not null comment '课程编号'
)charset utf8;
```

```mysql
alter table my_pri3 modify course char(10) primary key comment '课程编号';
```

```mysql
alter table my_pri3 add primary key(course);
```

##### 删除更新主键

```mysql
alter table 表名 drop primary key;
```

```Mysql
alter table 表名 add primary key(字段列表);
```

```mysql
alter table 表名 modify 字段名 primary key;
```

**主键只能删除再建**

#### 主键分类

业务主键：实实在在存在的。 

逻辑主键：逻辑字段。值是什么都没有关系。

#### 自动增长 auto_increment

当该字段不给值或给默认值时，系统会从当前系统中的该值+1得到一个不同的数据。填入到该字段中。自增长通常和主键搭配。

1. 任何一个字段要自增长，本身要是一个索引。

   ```mysql
   create table my_auto(
     id int auto_increment,
     name varchar(10) not null
   )charset utf8; 
   ```

   ![QQ20161005-32](QQ20161005-32.png)

2. 自增长字段必须是数字。而且必须是整数。

   ```mysql
   create table my_auto(
     id varchar(1) primary key auto_increment,
     name varchar(10) not null
   )charset utf8; 
   ```

    ![QQ20161005-33](QQ20161005-33.png)

3. 一张表最多只能有一个自增长。

   ```mysql
   create table my_auto(
     id int(1) primary key auto_increment,
     name varchar(10) not null
   )charset utf8; 
   ```

 ![QQ20161005-34](QQ20161005-34.png)

出发自增长。

```Mysql
insert into my_auto(name) values('hehe'),('xixi'),('haha');
```

 ![QQ20161005-35](QQ20161005-35.png)

自增长第一个元素默认是1，每次自增1.

如果自增长输入了值，下一次还是能正确增长（从最大值+1)。

**修改自增长**。

修改只能比当前已有的值大，

```mysql
alter table 表名 auto_increment = 值;
```

```mysql
alter table my_auto auto_increment = 10;
```

 ![QQ20161005-36](QQ20161005-36.png)

```mysql
show variables like 'auto_increment';
```

 ![QQ20161005-37](QQ20161005-37.png)

```mysql
set auto_increment_increment = 5;
```

![QQ20161005-38](QQ20161005-38.png)

**删除自增长**。

```mysql
alter table 表名 modify 字段 类型; -- 去掉自增长
```

```mysql
alter table my_auto modify id char(10);
```

#### 唯一键

增加唯一键。

1. 在创建表的字段之后直接跟unique。

```Mysql
create table my_unique1(
number char(10) unique comment '学号，可以为空'
)charset utf8;
```

 ![QQ20161005-39](QQ20161005-39.png)

2. 复合唯一键。

   ```mysql
   create table my_unique1(
   number char(10) comment '学号，可以为空'
   name varchar(20) not null;
   unique key(number)
   )charset utf8;
   ```

3. 追加唯一键。

   ```mysql
   create table my_unique1(
   number char(10) comment '学号，可以为空'
   name varchar(20) not null;
   )charset utf8;
   ```

   ```mysql
   alter table my_unique1 add unique key(number);
   ```

   如果唯一键也不能为空，那么他的作用和主键一样。

##### 删除更新唯一键

```mysql
alter table 表名 drop index 索引名字。
```

```mysql
alter table my_unique1 drop number;
```

