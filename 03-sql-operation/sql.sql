-- --是单行注释符号 ，也可以用 #号来注释
# 创建数据库
create  database mydatabase charset utf8;

# 使用关键字和保留字
create database `database` charset utf8;

# 设置中文数据库

set names gbk;
create database 中国 charset utf8;

# 查看数据库
show databases;

# 查看匹配的数据库
show databases like 'information%';

# 查看以information_开头的数据库。
show databases like 'information\_%';
