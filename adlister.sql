#AdLister: small scale Craigslist clone
# Specs:
# adUsers
    # id
    # email
    # password
# ads
    # id
    # title
    # description
    # user id
    # foreign key
# category ("help wanted", "giveaway", or "furniture")
    # id

# ads_categories
    # ad_id
    # category_id
    # foreign key
    # foreign key

use ymir_jeremy;

CREATE TABLE adUsers (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email  VARCHAR(100) NOT NULL,
    password  VARCHAR(24) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO adUsers(email, password)
VALUES
    ('jeremy@abc.com', 'P@ssw0rd1'),
    ('kenzi@abc.com', 'P@ssw0rd2'),
    ('nikki@abc.com', 'P@ssw0rd3')
;

describe adUsers;
select *
from adUsers;

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description text NOT NULL,
    aduser_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (aduser_id) REFERENCES adUsers (id)
);

# # Seeds
# INSERT INTO quotes (author_id, content)
# VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
#         'I love deadlines. I love the whooshing noise they make as they go by.');
INSERT INTO ads (aduser_id, title, description)
VALUES ((
    select id
    from adUsers
    where email = 'jeremy@abc.com'
    and password = 'P@ssw0rd1'),
        '1963 Aston Martin DB5, 1.3M OBO',
        'No, Mr. Bond, I expect you to drive!  Pristine condition, 20k miles, original engine, restored interior.');

INSERT INTO ads (aduser_id, title, description)
VALUES ((
    select id
    from adUsers
    where email = 'jeremy@abc.com'
    and password = 'P@ssw0rd1'),
        'Box of assorted rocks, $7 FIRM',
        'These are some of my favorite rocks and i just need the space in my garage.');

INSERT INTO ads (aduser_id, title, description)
VALUES ((
    select id
    from adUsers
    where email = 'kenzi@abc.com'
    and password = 'P@ssw0rd2'),
        'Prom dress, $200 OBO',
        'Budget conscious option.');

INSERT INTO ads (aduser_id, title, description)
VALUES ((
    select id
    from adUsers
    where email = 'nikki@abc.com'
    and password = 'P@ssw0rd3'),
        'Labradoodle puppies, AKC/full vax, $400 M/F',
        'Great birthday present, AKC certified, fully vaccinated and spayed/neutered.');

select *
from ads;

# An ad can be in one or more categories
# (for example, "help wanted", "giveaway", or "furniture")

CREATE TABLE categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    ad_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_id) REFERENCES ads (id)
);

INSERT INTO categories(name) VALUES
    ('Cars and trucks'),
    ('Furniture'),
    ('Giveaway'),
    ('Hot deals'),
    ('Housing'),
    ('Jobs')
    ;

describe categories;

select *
from categories;

# DELETE FROM categories
# WHERE ID > 4;

# doc, how can i renumber from console?
# update categories
# set categories.id to 5 where = categories.id = 9;

CREATE TABLE ads_categories (
    ad_id INTEGER UNSIGNED NOT NULL,
    category_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

INSERT INTO ads_categories(ad_id, category_id)
VALUES (1, 4), (2, 5);

select *
from ads_categories;

# displaying kenzi for rocks, not jeremy
select au.id, au.email, ads.title, ads.description
from adUsers au
         inner join ads on au.id = ads.id
#          inner join ads_categories ac on au.id = ac.category_id
# order by au.id
;

# Queries:
# Write SQL queries to answer the following questions:
#
# For a given ad:
    #what is the email address of the user that created it?
    #what category, or categories, does it belong to?
# For a given category, show all the ads that are in that category.
#     For a given user, show all the ads they have posted.


#Bonus: Quiz Application
#     Design a database for a quiz-taking application.
#
#     Specifications
#
#     Administrators create questions
# Administrators create answers for each question
# Each question should have one correct answer
# Administrators create quizzes
# Quizzes have one or more questions associated with them
# Students (users) take quizzes
# The application should record a student's answers for each question on the quiz
# Queries
#
# For a given student, calculate their score on a given quiz.
# For a given quiz, find how many students have taken it.
# Bonus
#
# Allow questions to have multiple correct answers