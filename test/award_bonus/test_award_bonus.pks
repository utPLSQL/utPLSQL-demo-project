create or replace package test_award_bonus as

  -- %suite( Award bonus )

  -- %test( Sets new salary as pct commision * sales amount )
  -- %beforetest( add_test_employee )
  procedure update_employee_salary;

  --%test( Raises exception if null bonus is passed )
  --%beforetest( add_employee_with_null_comm )
  --%throws( -06510 )
  procedure fail_on_null_bonus;

  procedure add_test_employee;

  procedure add_employee_with_null_comm;

end;
/
