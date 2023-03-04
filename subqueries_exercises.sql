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
select e2.first_name, e2.last_name
from dept_manager dm2
inner join employees e2 on dm2.emp_no = e2.emp_no
WHERE dm2.to_date > now()
AND e2.gender = 'F';



# Find the first and last name of the employee with the highest salary.
#
# +------------+-----------+
# | first_name | last_name |
# +------------+-----------+
# | Tokuyasu   | Pesch     |
# +------------+-----------+
SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;

# select e.first_name, e.last_name
# from employees e
# where e.emp_no = (
#     select s.emp_no
#     from salaries s
#     order by s.salary desc
#     limit 5 );
