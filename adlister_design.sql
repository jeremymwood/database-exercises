#AdLister: small scale Craigslist clone
#users can post ads for items
#
# Specs:
# Users sign up for the site with:
    # email
    # password

use ymir_jeremy;

CREATE TABLE adUsers (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email  VARCHAR(100) NOT NULL,
    password  VARCHAR(24) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO adUsers(email, password)
VALUES
    ('jeremy@abc.com', 'P@ssw0rd'),
    ('kenzi@abc.com', 'P@ssw0rd'),
    ('nikki@abc.com', 'P@ssw0rd'),
    ('matty@abc.com', 'P@ssw0rd'),
    ('rosie@abc.com', 'P@ssw0rd'),
    ('matt@abc.com', 'P@ssw0rd');

describe adUsers;
select *
from adUsers;

# Users create ads with:
    # title
    # description

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    aduser_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (aduser_id) REFERENCES adUsers (id)
);

# # Seeds
# INSERT INTO quotes (author_id, content)
# VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
#         'I love deadlines. I love the whooshing noise they make as they go by.');
INSERT INTO ads (aduser_id, title, description)
VALUES ((select id from adUsers where email = 'jeremy@abc.com' and password = 'P@ssw0rd'), '1963 Aston Martin DB5, 1.3M OBO', 'No, Mr. Bond, I expect you to drive!');

INSERT INTO ads (aduser_id, title, description)
VALUES ((select id from adUsers where email = 'jeremy@abc.com' and password = 'P@ssw0rd'), 'Box of assorted rocks, $7 FIRM', 'These are some of my favorite rocks and i just need the space in my garage.');

select *
from ads;

# An ad can be in one or more categories
# (for example, "help wanted", "giveaway", or "furniture")

CREATE TABLE adCategories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO adCategories(name) VALUES
#     ('Help wanted'),
#     ('Giveaway'),
#     ('Furniture'),
#     ('Autos')
    ('Hot deals');

describe adCategories;

select *
from adCategories;

DELETE FROM adCategories
WHERE ID > 4;

# doc, how can i renumber from console?
# update adCategories
# set adCategories.id to 5 where = adCategories.id = 9;

CREATE TABLE ads_categories (
    ad_id INTEGER UNSIGNED NOT NULL,
    category_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads(id),
    FOREIGN KEY (category_id) REFERENCES adCategories(id)
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