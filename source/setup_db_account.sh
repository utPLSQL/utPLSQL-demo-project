#!/bin/bash

set -ev

sql -L -S sys/${ORACLE_SYS_PASS}@//${CONNECTION_STR} AS SYSDBA <<SQL
create user ${DB_USER} identified by ${DB_PASS} quota unlimited on USERS default tablespace USERS;

grant create session, create procedure, create type, create table, create sequence, create view to ${DB_USER};
grant select any dictionary to ${DB_USER};

exit
SQL
