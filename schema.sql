CREATE DATABASE vet_clinic;

CREATE TABLE animals (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  date_of_birth DATE,
  escape_attemps INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(10, 2)
);