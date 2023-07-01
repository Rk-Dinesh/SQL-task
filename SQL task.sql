CREATE DATABASE imdb;

USE imdb;

-- Table for movies
CREATE TABLE movies (
  movie_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  release_year INT,
  description TEXT
);

-- Table for media (images or videos) associated with a movie
CREATE TABLE media (
  media_id INT PRIMARY KEY AUTO_INCREMENT,
  movie_id INT,
  media_type ENUM('video', 'image'),
  url VARCHAR(255),
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Table for genres
CREATE TABLE genres (
  genre_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)
);

-- Table to associate movies with genres (many-to-many relationship)
CREATE TABLE movie_genres (
  movie_id INT,
  genre_id INT,
  PRIMARY KEY (movie_id, genre_id),
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- Table for users
CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255),
  email VARCHAR(255)
);

-- Table for reviews
CREATE TABLE reviews (
  review_id INT PRIMARY KEY AUTO_INCREMENT,
  movie_id INT,
  user_id INT,
  rating DECIMAL(2, 1),
  comment TEXT,
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table for artists
CREATE TABLE artists (
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255)
);

-- Table for artist skills
CREATE TABLE artist_skills (
  artist_id INT,
  skill VARCHAR(255),
  PRIMARY KEY (artist_id, skill),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

-- Table for movie artists (to capture roles performed by artists in a movie)
CREATE TABLE movie_artists (
  movie_id INT,
  artist_id INT,
  role VARCHAR(255),
  FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);
