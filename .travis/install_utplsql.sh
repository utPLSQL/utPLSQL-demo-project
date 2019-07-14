#!/bin/bash

set -ev

cd ${UTPLSQL_DIR}/source
echo "sys password is: ${DB_SYS_PASSWORD}"
echo "sys password is: $DB_SYS_PASSWORD"
sql -S -L sys/${DB_SYS_PASSWORD}@//${CONNECTION_STR} AS SYSDBA @install_headless.sql
