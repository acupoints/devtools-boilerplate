-- 创建查询权限的MySQL用户,%可以换成IP地址或localhost等
-- mysql -uroot -p
create user 'tmpQ'@'%' identified by '#!2021Qpmt';
grant select on pd.* to 'tmpQ'@'%';
flush privileges;
