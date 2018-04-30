#!/bin/bash

set -ev

utPLSQL-cli/bin/utplsql run ${DB_USER}/${DB_PASS}@127.0.0.1:1521:${ORACLE_SID} \
-source_path=source -test_path=test \
-f=ut_documentation_reporter  -c \
-f=ut_coverage_sonar_reporter -o=coverage.xml \
-f=ut_sonar_test_reporter     -o=test_results.xml \
--failure-exit-code=0
