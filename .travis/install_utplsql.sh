#!/bin/bash

set -ev

cd $UTPLSQL_DIR/source

${SQLCLI} -S -L sys/${ORACLE_PWD}@//${CONNECTION_STR} AS SYSDBA @install_headless.sql

#${SQLCLI} -L -S sys/${ORACLE_PWD}@//${CONNECTION_STR} AS SYSDBA <<SQL
#grant select any dictionary to ut3;
#exit
#SQL
