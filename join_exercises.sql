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

SELECT DISTINCT t.title
FROM employees as e
     JOIN titles as t
          ON t.emp_no = e.emp_no
     JOIN departments as d
          ON d.dept_no = 'd009'
WHERE year(to_date) > year(now());
#
# +--------------------+-------+
# | title              | Total |
# +--------------------+-------+
# | Senior Staff       | 11268 |
# | Staff              |  3574 |
# | Senior Engineer    |  1790 |
# | Engineer           |   627 |
# | Technique Leader   |   241 |
# | Assistant Engineer |    68 |
# | Manager            |     1 |
# +--------------------+-------+

# Find the current salary of all current managers.
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, s.salary
FROM employees as e
     JOIN dept_manager as m
          ON m.emp_no = e.emp_no
     JOIN departments as d
          ON d.dept_no = m.dept_no
     JOIN salaries as s
          ON s.emp_no = e.emp_no
WHERE year(s.to_date) > year(NOW())
;

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