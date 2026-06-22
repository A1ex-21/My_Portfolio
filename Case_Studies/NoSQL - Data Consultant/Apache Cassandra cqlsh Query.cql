//Creating the Keyspace
CREATE KEYSPACE entertainment
WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 3 };

// Describing the Keyspace

describe entertainment;

USE entertainment;

//Creating the table movies

CREATE TABLE movies (
    id int PRIMARY KEY,
    title text,
    year int,
    rating text,
    director text
);

// Importing the data into the movies table

COPY entertainment.movies (id, title, year, rating, director) FROM 'partial_data.csv'
WITH DELIMITER=',' AND HEADER=True;

// Counting the number of rows in the movies table

SELECT COUNT(*) FROM movies;

// Creating an Index on Ratings column

CREATE INDEX rating_index ON entertainment.movies (rating);

// Using describe to show the newly created index

describe movies;

// Counting the number of movies that are rated G

SELECT COUNT(*) FROM movies WHERE rating = 'G';