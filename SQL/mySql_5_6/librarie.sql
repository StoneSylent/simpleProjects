CREATE TABLE book (`issn` varchar(20) NOT NULL, PRIMARY KEY (`issn`), `book_title` varchar(20), `date_of_publication` varchar(20));

CREATE TABLE Books_by_Category (`category_id` int NOT NULL, PRIMARY KEY (`category_id`), `issn` varchar(20) NOT NULL, FOREIGN KEY(`issn`) REFERENCES book(issn));

RENAME TABLE book TO Books;

CREATE TABLE Categories (`category_id` int NOT NULL, PRIMARY KEY(`category_id`), `category_name` varchar(20));

CREATE TABLE Books_by_Author (`author_id` int NOT NULL, PRIMARY KEY(`author_id`), `issn` varchar(20) NOT NULL, FOREIGN KEY(`issn`) REFERENCES Books(issn));

CREATE TABLE Authors (`author_id` int NOT NULL, PRIMARY KEY(`author_id`) ,`author_first_name` varchar(20), `author_last_name` varchar(20));

ALTER TABLE Books_by_Author DROP PRIMARY KEY;

ALTER TABLE Books_by_Author ADD FOREIGN KEY(`author_id`) REFERENCES Authors(author_id);


