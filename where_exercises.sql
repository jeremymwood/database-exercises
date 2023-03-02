use ymir_employees;

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');

SELECT *
FROM employees
WHERE last_name LIKE 'E%';

SELECT *
FROM employees
WHERE last_name LIKE '%q%';

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya') OR first_name IN ('Maya');

SELECT * FROM employees WHERE (first_name IN ('Irena', 'Vidya') OR first_name IN ('Maya')) AND gender = 'M';

SELECT *
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%e';

SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e';

SELECT *
FROM employees
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%';