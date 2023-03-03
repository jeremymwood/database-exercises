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
FROM users
WHERE role_id IS NOT NULL;