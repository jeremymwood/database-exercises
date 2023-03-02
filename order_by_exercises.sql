use ymir_employees;

SELECT first_name, last_name
FROM employees
ORDER BY last_name;

SELECT first_name, last_name
FROM employees
ORDER BY last_name DESC, first_name ASC;

# EXERCISES
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
    OR last_name LIKE '%e'
ORDER BY emp_no;

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%e'
ORDER BY emp_no DESC;

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%e'
ORDER BY emp_no DESC;