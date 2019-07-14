#!/bin/bash

set -ev

cd ${UTPLSQL_DIR}/source

sql -S -L sys/${DB_SYS_PASSWORD}@//${CONNECTION_STR} AS SYSDBA @install_headless.sql
