# Postgres Bookstore Database 

# Table create statements...
````SQL
CREATE TABLE author (author_id SERIAL PRIMARY KEY, name varchar(255) NOT NULL);
CREATE TABLE book (book_id SERIAL PRIMARY KEY, author_id INTEGER REFERENCES author(author_id), title varchar(255) NOT NULL);
````

# Insert Author records...
````SQL
INSERT INTO author (name) VALUES ('J. R. R. Tolkien');
INSERT INTO author (name) VALUES ('Marion Zimmer-Bradley');
INSERT INTO author (name) VALUES ('Dan Brown');
INSERT INTO author (name) VALUES ('Jack London');
INSERT INTO author (name) VALUES ('Paulo Cohelo');
````

# Insert Book records.
````SQL
INSERT INTO book (author_id,title) VALUES (1,'The Lord of the Rings');
INSERT INTO book (author_id,title) VALUES (2,'The Mists of Avalon');
INSERT INTO book (author_id,title) VALUES (2,'The Firebrand');
INSERT INTO book (author_id,title) VALUES (3,'The Davinci Code');
INSERT INTO book (author_id,title) VALUES (3,'Demons and Angels');
INSERT INTO book (author_id,title) VALUES (4,'Call of the Wild');
````

# Inner Joins
Selects all records from table1 (author) where there is a match in table2 (book).

````SQL
SELECT name FROM author INNER JOIN book ON author.author_id = book.book_id;
SELECT author.name, book.title FROM author INNER JOIN book ON author.author_id = book.author_id;
````

# Left outer Join
Selects all records from table1 (author) where there is a match in table2 (book), and returns a null for table2 for non-matches.

````SQL
SELECT author.name, book.title FROM author LEFT OUTER JOIN book ON author.author_id = book.author_id;
````

# Right outer Join
Selects all records from table1 (author) where there is a match in table2 (book), and returns a null for table1 for non-matches. If Table2 is a FK relation, data will not exist for this join.

````SQL
SELECT author.name, book.title FROM author RIGHT OUTER JOIN book ON author.author_id = book.author_id;
````

https://www.tutorialspoint.com/postgresql/postgresql_using_joins.htm

