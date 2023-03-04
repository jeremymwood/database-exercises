use ymir_employees;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
) LIMIT 10;

SELECT *
FROM employees as e
WHERE e.hire_date in (
    SELECT e.hire_date
    FROM employees as e
    WHERE e.emp_no = 101010
) ORDER BY emp_no;

select title, COUNT(*)
from titles as t
where t.emp_no in (
    select e.emp_no
    from employees e
    where e.first_name = 'Aamod'
    )
group by title
order by COUNT(*);

#current department managers, female.
#join
# select e.first_name, e.last_name
# from dept_manager dm
# inner join employees e on dm.emp_no = e.emp_no
# WHERE dm.to_date > now()
# AND e.gender = 'F';

select e.first_name, e.last_name
from employees e
where e.emp_no in (
    select dm.emp_no
    from dept_manager dm
    where dm.to_date > now()
      and e.gender = 'F'
    );

select *
from departments d
where d.dept_no in (
    select dm.dept_no
    from dept_manager dm
    where dm.to_date > now()
#       and e.gender = 'F'
    );

select e.first_name, e.last_name
from employees e
where e.emp_no in (
    select dm.emp_no
    from dept_manager dm
    where dm.to_date > now()
      and e.gender = 'F'
        and dm.dept_no in (
            select d.dept_no
            from departments d
        )
);

select d.dept_name
from departments d
where d.dept_no in (
    select dm.dept_no
    from dept_manager dm
    where dm.emp_no in (
        select e.emp_no
        from employees e
        where e.gender = 'F'
          and dm.to_date > now()
        )
    );
# Find the first and last name of the employee with the highest salary.
# +------------+-----------+
# | first_name | last_name |
# +------------+-----------+
# | Tokuyasu   | Pesch     |
# +------------+-----------+
select e.first_name, e.last_name
from employees e
where e.emp_no in (
    select s.emp_no
    from salaries s
    where salary in (
        select max(salary)
        ));

select e.first_name, e.last_name
from employees e
where e.emp_no = (
    select s.emp_no
    from salaries s
    where s.salary in (
        select max(salary)
        from salaries
        )
    );
