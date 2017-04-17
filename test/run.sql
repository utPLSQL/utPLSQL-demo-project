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
set termout off
spool sonar-coverage.xml

select *
  from table(ut.run(
    ut_coverage_sonar_reporter(
      a_file_paths => ut_varchar2_list(
        'source/award_bonus/award_bonus.prc',
        'source/remove_rooms_by_name/remove_rooms_by_name.prc',
        'source/between_string/betwnstr.fnc'
      )
    )
  ));

spool off

exit
