describe dept_manager;


SELECT *
FROM dept_manager;

SELECT *
FROM departments;

SELECT *
FROM employees;

SELECT dept_name, emp_no
FROM departments as d
     LEFT JOIN dept_manager as m on d.dept_name = m.emp_no;

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees as e
     JOIN dept_manager as m
          ON m.emp_no = e.emp_no
     JOIN departments as d
          ON d.dept_no = m.dept_no
where year(to_date) > year(now());

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees as e
         JOIN dept_manager as m
              ON m.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = m.dept_no
where year(to_date) > year(now()) AND e.gender = 'F';

# mine
SELECT DISTINCT t.title
FROM employees as e
     JOIN titles as t
          ON t.emp_no = e.emp_no
     JOIN departments as d
          ON d.dept_no = 'd009'
WHERE year(to_date) > year(now());

# docs
select t.title, count(e.emp_no) as Total
from titles as t
    inner join employees e on t.emp_no = e.emp_no
    inner join dept_emp de on e.emp_no = de.emp_no
    inner join departments d on de.dept_no = d.dept_no
where t.to_date > now()
and de.to_date > now()
and d.dept_no = 'd009'
group by t.title
order by Total desc;

# mine
# SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.salary
# FROM employees as e
#      JOIN dept_manager as m
#           ON m.emp_no = e.emp_no
#      JOIN departments as d
#           ON d.dept_no = m.dept_no
#      JOIN salaries as s
#           ON s.emp_no = e.emp_no
# WHERE year(s.to_date) > year(NOW())
# ;

select d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager', s.salary
from salaries s
    inner join employees e on s.emp_no = e.emp_no
    inner join dept_manager dm on e.emp_no = dm.emp_no
    inner join departments d on dm.dept_no = d.dept_no
where s.to_date > now()
    and dm.to_date> now();

# SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
# FROM employees as e
#          JOIN dept_manager as m
#               ON m.emp_no = e.emp_no
#          JOIN departments as d
#               ON d.dept_no = m.dept_no
# where year(to_date) > year(now()) AND e.gender = 'F';



#
# +--------------------+--------------------+--------+
# | Department Name    | Department Manager | Salary |
# +--------------------+--------------------+--------+
# | Customer Service   | Yuchang Weedman    |  58745 |
# | Development        | Leon DasSarma      |  74510 |
# | Finance            | Isamu Legleitner   |  83457 |
# | Human Resources    | Karsten Sigstam    |  65400 |
# | Marketing          | Vishwani Minakawa  | 106491 |
# | Production         | Oscar Ghazalie     |  56654 |
# | Quality Management | Dung Pesch         |  72876 |
# | Research           | Hilary Kambil      |  79393 |
# | Sales              | Hauke Zhang        | 101987 |
# +--------------------+--------------------+--------+
use ymir_jeremy;
# doc
# select r.name, count(u.id)
# from users as u
#          inner join roles r on u.role_id = r.id
# group by r.name;

# may be better to join from taget field and up to employee, hight level
select d.dept_name as 'Department Name',
   CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
from departments d
    inner join dept_manager dm on d.dept_no = dm.dept_no
    inner join employees e on dm.emp_no = e.emp_no
where    dm.to_date = '9999-01-01';

use ymir_employees;
select CONCAT(e.first_name, ' ', e.last_name) AS 'Employee'
     , d.dept_name
     , CONCAT(e.first_name, ' ', e.last_name) AS 'Manager'
from employees as e
    inner join dept_emp de on e.emp_no = de.emp_no
    inner join departments d on de.dept_no = d.dept_no
    inner join dept_manager dm on d.dept_no = dm.dept_no
    inner join employees e2 on dm.emp_no = e2.emp_no
where de.to_date > now()
    and dm.to_date > now();