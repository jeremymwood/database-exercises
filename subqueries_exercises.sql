use ymir_employees;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
) LIMIT 10;


SELECT *
FROM employees as e
WHERE e.birth_date = (
    SELECT e.birth_date
    FROM employees as e
    WHERE e.emp_no = 101010
);

SELECT *
FROM employees as e
WHERE e.hire_date = (
    SELECT e.hire_date
    FROM employees as e
    WHERE e.birth_date = (
        SELECT e.birth_date
        FROM e
        WHERE e.emp_no = 101010
    )
);
# 1st
select e2.hire_date
from employees as e2
where e2.emp_no = 101010;

select *
from employees as e
where e.hire_date in (
    select e2.hire_date
    from employees as e2
    where e2.emp_no = '101010'
    );

select *
from employees as e
where e.emp_no in (
    select e2.emp_no
    from employees e2
    where e2.first_name = 'Aamod'
    );

# select e.first_name, e.last_name
# from employees e
# where e.emp_no = (
#     select s.emp_no
#     from salaries s
#     order by s.salary desc
#     limit 5 );

# first part
select dm2.dept_no
from dept_manager dm2
inner join employees e2 on dm2.emp_no = e2.emp_no
WHERE dm2.to_date > now()
AND e2.gender = 'F';

SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;
