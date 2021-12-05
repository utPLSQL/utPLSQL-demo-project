create user ut3_demo identified by ut3_demo quota unlimited on USERS default tablespace USERS;

grant create session, create procedure,create trigger, create type, create table, create sequence, create view to ut3_demo;
grant select any dictionary to ut3_demo;

exit
