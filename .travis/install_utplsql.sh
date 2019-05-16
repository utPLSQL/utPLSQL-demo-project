#!/bin/bash

set -ev

cd $UTPLSQL_DIR/source

${SQLCLI} -S -L oracle/${ORACLE_PWD} AS SYSDBA @install_headless.sql

${SQLCLI} -L -S oracle/${ORACLE_PWD} AS SYSDBA <<SQL
grant select any dictionary to ut3;
exit
SQL
