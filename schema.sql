-- ---------------- --
-- FIRST MILESTONE --
-- ---------------- --

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
  id BIGSERIAL  PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(10, 2)
);


-- ---------------- --
-- SECOND MILESTONE --
-- ---------------- --

ALTER TABLE animals
ADD COLUMN species VARCHAR(50);