#!/bin/bash

set -ev

"$ORACLE_HOME/bin/sqlplus" /nolog ${DB_USER}/${DB_PASS} @ut_run -f=ut_documentation_reporter -s -f=ut_sonar_coverage_reporter -o=sonar-coverage.xml
