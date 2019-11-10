create or replace package body test_award_bonus as

  gc_test_employee constant integer := -1;
  gc_salary        constant number  := 4500;
  gc_commision_pct constant number  := 0.2;

  procedure update_employee_salary is
    results      sys_refcursor;
    expected     sys_refcursor;
    not_affected sys_refcursor;
    c_sales_amount constant number := 1000;
  begin
    --Arrange
    open expected for
      select (salary + c_sales_amount * gc_commision_pct) as new_salary
        from employees_test where employee_id = gc_test_employee;

    open not_affected for
      select * from employees_test where employee_id <> gc_test_employee;

    --Act
    award_bonus(emp_id => gc_test_employee, sales_amt => c_sales_amount);

    --Assert
    open results for
      select salary as new_salary
        from employees_test where employee_id = gc_test_employee;

    ut.expect( results ).to_equal( expected );

    open results for
      select * from employees_test where employee_id != gc_test_employee;

    ut.expect( results ).to_equal( not_affected );
  end;

  procedure fail_on_null_bonus is
  begin
    --Arrange done in --%beforetest
    --Act
    award_bonus(emp_id => gc_test_employee, sales_amt => null);
    --Assert done through --%throws annotation
  end;

  procedure add_employee( emp_id number, comm_pct number, sal number ) is
  begin
    insert into employees_test (employee_id, commission_pct, salary)
    values (emp_id, comm_pct, sal);
  end;

  procedure add_test_employee is
  begin
    add_employee(gc_test_employee, 0.2, gc_salary);
  end;

  procedure add_employee_with_null_comm is
  begin
    add_employee(gc_test_employee, null, gc_salary);
  end;

end;
/
