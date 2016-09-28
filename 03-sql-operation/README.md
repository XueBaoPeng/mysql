# SQL基本操作

基本操作:CRUD

根据操作对象将数据库操作分为三类：库操作、表操作（字段）、数据操作

## 库操作

对数据库的增删改查。

### 新增数据库

基本语法： 

```Sql
create database 数据库名称 库选项
```

>库选项：用来约束数据库，分为两个选项。
>
>1. 字符集设定 charset/character，具体字符集（数据存储编码），常用:GBK，UTF8
>2. 校对集设定：collate 具体校对集合（数据比较的规则）

**数据库名字不能用关键字和保留字**

如果非要使用保留字和关键字。则使用反引号。

```sql
create database `database` charset utf8;
```

设置中文数据库

```sql
set names gbk;
create database 中国 utf8;
```

**创建数据库的sql执行之后，发生了什么？**

1. 在数据库系统中，增加了相应的数据库信息。

    ![QQ20160928-0](QQ20160928-0.png)

2. 在保存数据库的文件夹下，保存了相应数据库的文件夹。

    ![QQ20160928-1](QQ20160928-1.png)

3. 每个数据库下都有一个opt（option）文件。保存了库选项

 ![QQ20160928-2](QQ20160928-2.png)

字符集：utf8

校对集：utf8_general_ci,校对集依赖字符集。



### 查看数据库

1. 查看所有数据库

```Sql
show databases;
```

 ![QQ20160928-3](QQ20160928-3.png)

2. 查看指定数据库：模糊查询

```sql
show databases like 'pattern';		pattern是匹配模式
```

%：匹配多个字符

_:匹配单个字符

```sql
# 查看以information_开头的数据库。
show databases like 'information\_%';
```

 ![QQ20160928-4](QQ20160928-4.png)

3. 查看数据库创建语句

```Sql
show create database mydatabase;
```

 ![QQ20160928-5](QQ20160928-5.png)

与创建时的语句有所不同是因为mysql进行了优化。

### 更新数据库

数据库名字不可以修改

数据库修改仅限库选项（字符集和校对集）

```
alter database 数据库名 字符集/校对集 库选项;
```

```Sql
alter database informationtest charset GBK
```

### 删除数据库

删除是最简单的

```
drop database 数据库名;
```

```
drop database informationtest;
```

 ![QQ20160928-6](QQ20160928-6.png)

发生了什么。

1. 数据库系统中没了该数据库的信息。
2. 文件系统中没了该数据库的相关文件。
3. 重要的数据应该先备份，再删除。