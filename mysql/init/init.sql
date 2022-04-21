create user root@'%' identified by '123456';
grant all privileges on *.* to root@'%' with grant option;
FLUSH PRIVILEGES;