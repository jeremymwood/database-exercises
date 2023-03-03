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
