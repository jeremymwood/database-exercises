# use ymir_jeremy;
# use ymir_employees;

# create table foo
# (
#     id int auto_increment,
#     author  varchar(50)  not null,
#     content varchar(240) not null,
#     constraint `PRIMARY`
#     primary key (id)
# );

# CREATE TABLE quotes (
#     id INT NOT NULL AUTO_INCREMENT,
#     author VARCHAR(50) NOT NULL,
#     content VARCHAR(240) NOT NULL,
#     PRIMARY KEY (id)
# );
#
#
#
# ALTER TABLE foo
#     ADD UNIQUE (content);

# EXERCISES
# Explore the indexes in the employees database
# Add a unique constraint to our test database
# USE your employees database.
#
# DESCRIBE each table and inspect the keys and see which columns have indexes and keys.
#
# USE your codeup_test_db database.
#
# Add an index to make sure all album names combined with the artist are unique. Try to add duplicates to test the constraint.

# DESCRIBE quotes;
# DESCRIBE foo;
# ALTER TABLE foo
#     ADD UNIQUE ();

# add column
# alter table ymir_jeremy.foo
#     add stuff int null;

describe ymir_employees.employees;

SELECT *
FROM albums;

ALTER TABLE albums
    ADD UNIQUE (album_name);

describe ymir_jeremy.albums;

# right click ymir_jeremy, new query console, paste and run
# CREATE TABLE roles (
#                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#                        name VARCHAR(100) NOT NULL,
#                        PRIMARY KEY (id)
# );
#
# CREATE TABLE users (
#                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#                        name VARCHAR(100) NOT NULL,
#                        email VARCHAR(100) NOT NULL,
#                        role_id INT UNSIGNED DEFAULT NULL,
#                        PRIMARY KEY (id),
#                        FOREIGN KEY (role_id) REFERENCES roles (id)
# );
#
# INSERT INTO roles (name) VALUES ('admin');
# INSERT INTO roles (name) VALUES ('author');
# INSERT INTO roles (name) VALUES ('reviewer');
# INSERT INTO roles (name) VALUES ('commenter');
#
# INSERT INTO users (name, email, role_id) VALUES
#      ('bob', 'bob@example.com', 1),
#      ('joe', 'joe@example.com', 2),
#      ('sally', 'sally@example.com', 3),
#      ('adam', 'adam@example.com', 3),
#      ('jane', 'jane@example.com', null),
#      ('mike', 'mike@example.com', null);

describe users;

SELECT *
FROM users;
# foreign key is inherited from roles below

SELECT *
FROM users
WHERE role_id IS NOT NULL;

SELECT *
FROM users
         JOIN roles ON users.role_id = roles.id;

select *
from users as u
    inner join users as r on u.role_id = r.id;

select u.id, u.name, u.email, roles.name
from users as u
    JOIN roles ON u.role_id = roles.id
    inner join users as r on u.role_id = r.id;

SELECT *
FROM users as u
    LEFT JOIN roles as r on u.role_id = r.id;

SELECT *
FROM users as u
    LEFT JOIN roles as r on u.role_id = r.id
where role_id is null;

# exclusive left join
SELECT *
FROM users as u
    LEFT JOIN roles as r on u.role_id = r.id
where u.role_id is null;

# multiple roles
# SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
# FROM employees as e
#          JOIN dept_emp as de
#               ON de.emp_no = e.emp_no
#          JOIN departments as d
#               ON d.dept_no = de.dept_no
# WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;


# Insert 4 new users into the database. One should have a NULL role. The other three should be authors.
#
#     Use JOIN, LEFT JOIN, and RIGHT JOIN to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
#
#     Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use COUNT and the appropriate join type to get a list of roles along with the number of users that have a given role. Hint: You will also need to use GROUP BY in the query.
#

SELECT *
FROM users;

# INSERT INTO users (name,email)
# #     VALUES ('jeremy','jeremy@jeremy.com')
#     VALUES ('kenzi','kenzi@kenzi.com'),
#     ('matty','matty@matty.com'),
#     ('rosie','rosie@rosie.com')
# ;

# UPDATE users (role_id)
# SET roles = 'Samuel', author_last_name = 'Clemens'
# WHERE id = 4;
#
# DROP *
#     FROM users
#     WHERE id > 11;
