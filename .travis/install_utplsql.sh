#!/bin/bash

set -ev

cd $UTPLSQL_FILE/source

sqlplus -S -L sys/oracle@xe AS SYSDBA @install_headless.sql



