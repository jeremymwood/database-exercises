use ymir_employees;

SELECT *
FROM employees
WHERE year(birth_date) BETWEEN 1950 AND 1959
  AND month(birth_date) = 7
  AND day(birth_date) = 4
ORDER BY first_name;

SELECT CURDATE();
SELECT CURTIME();

SELECT CONCAT(
               'Teaching people to code for ',
               UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'),
               ' seconds'
           );


# EXERCISES
SELECT emp_no, CONCAT(first_name,' ', last_name) AS full_name
FROM employees
WHERE first_name LIKE 'E%'
  AND first_name LIKE '%e'
ORDER BY emp_no
LIMIT 10 OFFSET 50;

SELECT min(emp_no)
FROM employees;

SELECT *
FROM employees
WHERE DAY(birth_date) = 25
AND MONTH(birth_date) = 12;

SELECT *
FROM employees
WHERE YEAR(hire_date) > 1989
    AND DAY(birth_date) = 25
    AND MONTH(birth_date) = 12;

SELECT *
FROM employees
WHERE YEAR(hire_date) > 1989
  AND DAY(birth_date) = 25
  AND MONTH(birth_date) = 12
ORDER BY hire_date DESC, birth_date DESC;

SELECT *, DATEDIFF(NOW(), hire_date + 1) AS days_worked
FROM employees
WHERE YEAR(hire_date) > 1989
  AND DAY(birth_date) = 25
  AND MONTH(birth_date) = 12
ORDER BY hire_date DESC, birth_date DESC;