INSERT category(code, name)
VALUES ('F','Fiction');

INSERT category(code, name)
VALUES ('NF','Non-Fiction');

INSERT category(code, name)
VALUES ('SF','Science Fiction');

INSERT category(code, name)
VALUES ('M','Mystery');

INSERT category(code, name)
VALUES ('R','Romance');

INSERT book(Title,Description,	Price,	Category_id)
VALUES ('M','Mystery');

INSERT book(Title,Description,	Price,	Category_id)
VALUES ('Fahrenheit 451',	'In a far future world, television dominates, and books are outlawed.',	29.95,	3);

INSERT book(Title,Description,	Price,	Category_id)
VALUES ('The Preacher’s Promise',	'The Preacher’s Promise finds newly hired school teacher Amanda Stewart going toe to toe with the small Georgia town’s mayor.',	19.95,	5);

INSERT book(Title,Description,	Price,	Category_id)
VALUES ('The Millionaire Next Door',	'The seven common qualities that appear over and over among this exclusive demographic.', 	18.17,	2);

INSERT book(Title,Description,	Price,	Category_id)
VALUES ('Twisted Crimes',	'Full of twists and turns, this crime thriller will keep you turning the pages',	7.99,	4);

INSERT book(Title,Description,	Price,	Category_id)
VALUES ('For Your Eyes Only',	'Places him in the dangerous company of adversaries of all varieties.' ,9.92,	1);

INSERT book(Title,Description,	Price,	Category_id)
VALUES ('You Only Live Twice',	'The tragic end to James Bond’s last mission',	9.93,	1);

INSERT author(name)
VALUES ('Thomas J. Stanley');

INSERT author(name)
VALUES ('Ray Bradbury');

INSERT author(name)
VALUES ('Piper Huguley');

INSERT author(name)
VALUES ('Michael Hambling');

INSERT author(name)
VALUES ('Ian Fleming');

INSERT book_author(author_id,book_id)
VALUES (2,1);

INSERT book_author(author_id,book_id)
VALUES (1,3);

INSERT book_author(author_id,book_id)
VALUES (3,2);

INSERT book_author(author_id,book_id)
VALUES (4,4);

INSERT book_author(author_id,book_id)
VALUES (5,5);

INSERT book_author(author_id,book_id)
VALUES (5,6);

SELECT * FROM category;

SELECT * FROM book;

SELECT * FROM author;

SELECT * FROM book_author;



