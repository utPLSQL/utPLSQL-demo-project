#!/bin/bash

set -ev

utPLSQL-cli/bin/utplsql run ut3_demo/ut3_demo@//127.0.0.1:1521/XE?oracle.net.disableOob=true \
  -source_path=source -regex_expression="(\w+)/(\w+)/(R__)(\w+)\.(\w+)\.(\w+)$" \
  -owner_subexpression=4 \
  -name_subexpression=5 \
  -type_subexpression=6 \
  -test_path=test -regex_expression="(\w+)/(\w+)/(\w+)\.(\w+)\.(\w+)$" \
  -owner_subexpression=1 \
  -type_subexpression=5 \
  -name_subexpression=4 \
  -f=ut_documentation_reporter  -c \
  -f=ut_coverage_sonar_reporter     -o=coverage.xml \
  -f=ut_sonar_test_reporter         -o=test_results.xml \
  -f=ut_coverage_cobertura_reporter -o=cobertura.xml \
  -f=ut_junit_reporter              -o=junit_test_results.xml \
  --failure-exit-code=0