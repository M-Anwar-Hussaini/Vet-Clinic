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


-- ---------------- --
-- THIRD MILESTONE --
-- ---------------- --

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(50),
	age SMALLINT
);

CREATE TABLE species (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50)
);

-- Delete the species column
ALTER TABLE animals
DROP COLUMN species;

-- Add species_id column
ALTER TABLE animals
ADD COLUMN species_id INTEGER;

-- Add foreign key to species_id column
ALTER TABLE animals
ADD CONSTRAINT fk_animals_species
FOREIGN KEY (species_id) REFERENCES species(id);


-- Add owner_id column to animals table
ALTER TABLE animals
ADD COLUMN owner_id INTEGER;

-- Add foreign key to owner_id column
ALTER TABLE animals
ADD CONSTRAINT fk_animals_owners
FOREIGN KEY (owner_id) REFERENCES owners(id);
