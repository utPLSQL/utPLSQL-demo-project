create or replace procedure award_bonus (p_employee_id number, p_sales_amount number) as
--https://docs.oracle.com/database/sql-developer-4.2/RPTUG/sql-developer-unit-testing.htm#RPTUG45065
  commission    real;
  comm_missing  exception;
begin
  select commission_pct into commission
    from employees_test
      where employee_id = p_employee_id;

  if commission is null then
    raise comm_missing;
  else
    update employees_test
      set salary = nvl(salary,0) + p_sales_amount*commission
        where employee_id = p_employee_id;
  end if;
end;
/
