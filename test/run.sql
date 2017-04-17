set echo off
set verify off
set trimspool on
set feedback off
set linesize 32767
set pagesize 0
set long 200000000
set longchunksize 1000000
set serveroutput on size unlimited format truncated
set arraysize 50


var sonar_test_reporter_id  varchar2(32);
var sonar_coverage_reporter_id varchar2(32);
declare
  l_reporter  ut_reporter_base;
  l_reporters ut_reporters := ut_reporters();
begin

  l_reporter := ut_coverage_sonar_reporter(
    a_file_paths => ut_varchar2_list(
        'source/award_bonus/award_bonus.prc',
        'source/remove_rooms_by_name/remove_rooms_by_name.prc',
        'source/between_string/betwnstr.fnc'
      ));
  l_reporters.extend;
  l_reporters(l_reporters.last) := l_reporter;
  :sonar_coverage_reporter_id := l_reporter.reporter_id;

  l_reporter := ut_sonar_test_reporter(
    a_file_paths => ut_varchar2_list(
        'test/award_bonus/test_award_bonus.pkb',
        'test/remove_rooms_by_name/test_remove_rooms_by_name.pkb',
        'test/between_string/test_betwnstr.pkb'
      ) );
  l_reporters.extend;
  l_reporters(l_reporters.last) := l_reporter;
  :sonar_test_reporter_id := l_reporter.reporter_id;

  ut_runner.run(user,l_reporters);
end;
/

set termout off

spool sonar-coverage.xml
select * from table( ut_output_buffer.get_lines(:sonar_coverage_reporter_id));
spool off

spool sonar-test-results.xml
select * from table( ut_output_buffer.get_lines(:sonar_test_reporter_id));
spool off

exit
