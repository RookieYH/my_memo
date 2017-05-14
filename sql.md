## 通用


- 列修改
```
ALTER TABLE B_HSKCINFO ADD "MODE" CHAR(1) 
ALTER TABLE B_BULLETIN MODIFY "NUM" VARCHAR2(500) 
comment on column B_HSKCINFO."MODE" is '价格类型 1:按总价 2：按单价' 
```
- 查重
```
select * from tb where name in (select name from tb group by name having count(*)>1)
```

## Oracle


- 分页

将商品id、商品名称、上架时间按日期升序分页显示，每页显示4条记录，查询第3页商品信息
```
SELECT id,name,saledate FROM(SELECT id,name,saledate,ROWNUM rn FROM 
    ( SELECT * FROM es_product ORDER BY saledate)
    WHERE ROWNUM<=12) WHERE rn>=9
或者
SELECT id,name,saledate FROM 
    (SELECT id,name,saledate,ROWNUM rn FROM (SELECT * FROM es_product ORDER BY saledate)) 
    WHERE rn>=9 AND rn<=12
```
- CDB & PDB
```
SELECT * FROM cdb_users
```
查询，切换，查询当前container
```
select con_id,name,open_mode from v$pdbs 
alter session set container=CDB$ROOT
alter session set container=pdborcl
select sys_context('userenv','con_name') from dual
```
启动数据库自动启动pdb
```
CREATE OR REPLACE NONEDITIONABLE TRIGGER open_all_pdbs
       AFTER startup
       ON DATABASE
     BEGIN
       EXECUTE IMMEDIATE 'alter pluggable database all open' 
     END  open_all_pdbs 
```
- 建表空间，建用户，建库
```
create tablespace SGPROPERTYTRADE 
    datafile 'F:\app\RookieYH\oradata\orcl\pdborcl\SGPROPERTYTRADE.dbf' 
    size 50m  
    autoextend on
    next 50m
```
创建用户，赋予/收回/查询角色
```
create user SGRYOA identified by SGRYOA default tablespace SGRYOA  
grant connect,resource,dba to SGRYOA  
revoke connect,resource,dba from C##CDB [container=all] 
SELECT GRANTED_ROLE FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'C##CDB' 
```
设置/修改密码
```
alter user C##CDB identified by C##CDB 
```
删除用户以及表空间
```
drop user username cascade 
drop tablespace tablespacename including contents and datafiles cascade constraints  
```
查询/修改用户表空间
```
select username,default_tablespace from dba_users 
alter user SGPROPERTYTRADE default tablespace SGPROPERTYTRADE
```
- 导入导出dmp,不需要登入
```
imp SGPROPERTYTRADE/SGPROPERTYTRADE@pdborcl fromuser=SGPROPERTYTRADE touser=SGPROPERTYTRADE 
file=d:\SGPROPERTYTRADE20160517.dmp ignore=y
exp SGPROPERTYTRADE/SGPROPERTYTRADE@TSNEI file=d:\daochu2.dmp owner(SGPROPERTYTRADE)
```
 
## MySQL
- `SET FOREIGN_KEY_CHECKS = 0` 不检查外键
- `SET FOREIGN_KEY_CHECKS = 1` 检查外键
- `show variables like 'character%'` 查看默认字符编码
