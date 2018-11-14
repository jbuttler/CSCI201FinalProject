DROP DATABASE if exists foodbook;
CREATE DATABASE foodbook;
USE foodbook;

CREATE TABLE Users (
  userID int AUTO_INCREMENT NOT NULL UNIQUE,
  email varchar(50) PRIMARY KEY NOT NULL UNIQUE,
  name varchar(40) NOT NULL,
  imgURL varchar(500),
  bio varchar(140),
  contactinfo varchar(50) NOT NULL
);

CREATE TABLE Offerings (
  offeringID int AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
  chefEmail varchar(50) NOT NULL,
  FOREIGN KEY fk1(chefEmail) REFERENCES Users(email),
  cuisineType varchar(20) NOT NULL,
  name varchar(80) NOT NULL,
  price double NOT NULL,
  location varchar(120) NOT NULL,
  startTime bigint NOT NULL,
  endTime bigint NOT NULL,
  valid bool NOT NULL,
  imgURL varchar(200)
);