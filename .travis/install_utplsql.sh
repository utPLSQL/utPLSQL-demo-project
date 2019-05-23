#!/bin/bash

set -ev

cd ${UTPLSQL_DIR}/source

sql -S -L sys/${ORACLE_SYS_PASS}@//${CONNECTION_STR} AS SYSDBA @install_headless.sql
