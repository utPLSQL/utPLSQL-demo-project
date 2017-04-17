#!/bin/bash

set -ev

sqlplus -L -S ${DB_USER}/${DB_PASS} <<SQL
whenever sqlerror exit failure rollback
whenever oserror  exit failure rollback

@source/award_bonus/employees_test.sql
@source/award_bonus/award_bonus.prc

@source/between_string/betwnstr.fnc

@source/remove_rooms_by_name/rooms.sql
@source/remove_rooms_by_name/remove_rooms_by_name.prc

exit
SQL
