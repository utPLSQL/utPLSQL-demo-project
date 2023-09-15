create or replace package test_award_bonus as

  -- %suite
  -- %displayname(Award bonus)

  -- %test
  -- %displayname(Sets new salary as pct commision * sales amount)
  -- %beforetest(add_test_employee)
  procedure update_employee_salary;

  -- %test
  -- %displayname(Raises exception if null bonus is passed)
  -- %beforetest(add_employee_with_null_comm)
  procedure fail_on_null_bonus;

  procedure add_test_employee;

  procedure add_employee_with_null_comm;

end;
/
