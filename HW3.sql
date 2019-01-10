CREATE DATABASE movie_tracker;

CREATE TABLE movies
(
movie_id INT  NOT NULL AUTO_INCREMENT,
title VARCHAR(200) NOT NULL,
release_date DATETIME NOT NULL,
plot_description VARCHAR(4000) NOT NULL,
PRIMARY KEY (movie_id)
);

CREATE TABLE actors
(
actor_id INT AUTO_INCREMENT NOT NULL,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
birth_date DATETIME NOT NULL,
biography VARCHAR(1000) NOT NULL,
 PRIMARY KEY (actor_id)
);

CREATE TABLE locations
(
location_id INT AUTO_INCREMENT NOT NULL,
location_name VARCHAR(100) NOT NULL,
street_address VARCHAR(150) NOT NULL,
city VARCHAR(100) NOT NULL,
state CHAR(2) NOT NULL,
zip VARCHAR(5) NOT NULL,
 PRIMARY KEY (location_id)
);

CREATE TABLE  movies_actors
(
movie_id INT NOT NULL,
actor_id INT NOT NULL,
FOREIGN KEY (actor_id) 
REFERENCES actors(actor_id),
FOREIGN KEY (movie_id) 
REFERENCES movies(movie_id)
);

CREATE TABLE  movies_locations
(
movie_id INT NOT NULL,
location_id INT NOT NULL,
FOREIGN KEY (location_id) 
REFERENCES locations(location_id),
FOREIGN KEY (movie_id) 
REFERENCES movies(movie_id)
);


INSERT movies (title ,release_date,plot_description)
VALUES ('This movie','', 'A series of events in a sequence');
INSERT movies (title ,release_date,plot_description)
VALUES ('This movie2:again','2012-10-1', 'A series of events in a sequence again');
INSERT movies (title ,release_date,plot_description)
VALUES ('This movi3','2013-10-1', 'A series of events in a sequencefor a thrid time');

INSERT actors (first_name ,last_name ,birth_date,biography)
VALUES ('Larry','Carrey','1961-11-11', 'Know for his roles in the this movie series.');
INSERT actors (first_name ,last_name ,birth_date,biography)
VALUES ('Mary','Carrey-Woods','1961-12-12', 'Know for her roles in the this movie series.');
INSERT actors (first_name ,last_name ,birth_date,biography)
VALUES ('Teri','Zary','1992-12-12', 'Know for her roles in the this movie series. Child of Larry and Mary');

INSERT locations (location_name  ,street_address ,city,state,zip)
VALUES ('Backdrop','1 main street','Boise', 'ID','83709');
INSERT locations (location_name  ,street_address ,city,state,zip)
VALUES ('Beaches','13 Chamber street','Virginia Beach', 'VA','23462');
INSERT locations (location_name  ,street_address ,city,state,zip)
VALUES ('Steel','13 Carson street','Pittsburgh', 'PA','15203');actors


INSERT movies_actors(movie_id,actor_id)
VALUES(1,1);

INSERT movies_actors(movie_id,actor_id)
VALUES(2,2);

INSERT movies_actors(movie_id,actor_id)
VALUES(3,3);

INSERT movies_locations(movie_id,location_id)
VALUES(1,1);

INSERT movies_locations(movie_id,location_id)
VALUES(2,2);
INSERT movies_locations(movie_id,location_id)
VALUES(3,3);

SELECT last_name FROM actors LIMIT 2;

SELECT release_date FROM movies WHERE release_date > 2011-10-1 AND release_date < 2013-10-1;

UPDATE locations  SET zip = '15217' WHERE zip <> '15217';

DELETE FROM actors WHERE actor_id =2;

