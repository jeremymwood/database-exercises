use ymir_jeremy;

CREATE TABLE authors (
     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
     first_name VARCHAR(50),
     last_name  VARCHAR(100) NOT NULL,
     PRIMARY KEY (id)
);

INSERT INTO authors(first_name, last_name)
VALUES    ('Douglas', 'Adams'),
    ('Mark', 'Twain'),
    ('Kurt', 'Vonnegut');

drop table authors;

describe authors;

select *
from authors;

CREATE TABLE quotes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    content TEXT NOT NULL,
    author_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES authors (id)
);

drop table quotes;

describe quotes;

select *
from quotes;

# Seeds
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
        'I love deadlines. I love the whooshing noise they make as they go by.');
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
        'Time is an illusion. Lunchtime doubly so.');
INSERT INTO quotes (author_id, content)
values ((select id from authors where first_name = 'Mark' and last_name = 'Twain'),
        'Clothes make the man. Naked people have little or no influence on society.');
INSERT INTO quotes (author_id, content)
values ((select id from authors where first_name = 'Kurt' and last_name = 'Vonnegut'),
        'The universe is a big place, perhaps the biggest.');
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'), 'Don''t Panic.');


select a.id, concat(a.first_name, ' ', a.last_name) 'full_name', q.content 'quote'
from authors a
    inner join quotes q on a.id = q.author_id
order by a.id;

CREATE TABLE topics (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO topics(name) VALUES
    ('Space and Time'),
    ('Humor'),
    ('Office Life'),
    ('Hitchiker''s Guide to the Galaxy');

describe topics;
select *
from topics;

CREATE TABLE quote_topic (
    quote_id INTEGER UNSIGNED NOT NULL,
    topic_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY (quote_id) REFERENCES quotes(id),
    FOREIGN KEY (topic_id) REFERENCES topics(id)
);

INSERT INTO quote_topic(quote_id, topic_id)
VALUES (1, 2), (1, 3), (2, 4), (3, 1),
       (3, 2), (3, 3), (3, 4), (4, 2), (5, 1);

select a.id, concat(a.first_name, ' ', a.last_name) 'full name', q.content 'quote', t.name 'genre'
from authors a
     inner join quotes q on a.id = q.author_id
     inner join topics t on a.id = t.id
order by a.id;