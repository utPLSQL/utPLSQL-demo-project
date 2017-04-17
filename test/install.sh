#!/bin/bash

set -ev

#adding sonar test reporter
sqlplus -L -S / <<SQL
alter session set current_schema=ut3;

@@test/ut_sonar_test_reporter.tps
@@test/ut_sonar_test_reporter.tpb
create public synonym ut_sonar_test_reporter for ut_sonar_test_reporter;
grant execute on ut_sonar_test_reporter to public;

exit
SQL

sqlplus -L -S ${DB_USER}/${DB_PASS} <<SQL
whenever sqlerror exit failure rollback
whenever oserror  exit failure rollback

@test/award_bonus/test_award_bonus.pks
@test/award_bonus/test_award_bonus.pkb

@test/between_string/test_betwnstr.pks
@test/between_string/test_betwnstr.pkb

@test/remove_rooms_by_name/test_remove_rooms_by_name.pks
@test/remove_rooms_by_name/test_remove_rooms_by_name.pkb

exit
SQL
