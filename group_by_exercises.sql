use ymir_employees;

SELECT DISTINCT first_name
FROM employees;

SELECT first_name
FROM employees
GROUP BY first_name;

SELECT last_name, first_name
FROM employees
GROUP BY last_name, first_name;

SELECT COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%';

SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name;

SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;

SELECT DISTINCT title
FROM titles
GROUP BY title;

SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%e'
GROUP BY last_name;
# Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'. You should get 846 rows.
#
#     Find the unique last names with a 'q' but not 'qu'. Your results should be:
#
#
#     Chleq
#     Lindqvist
#     Qiwen
#     Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
#
#
# 189 Chleq
# 190 Lindqvist
# 168 Qiwen
# Update your query for 'Irena', 'Vidya', or 'Maya'. Use count(*) and GROUP BY to find the number of employees for each gender with those names. Your results should be:
#
#
#     441 M
#     268 F


