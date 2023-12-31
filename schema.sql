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


-- ---------------- --
-- FORTH MILESTONE --
-- ---------------- --

-- Vets Table
CREATE TABLE vets (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	age SMALLINT,
	date_of_graduation DATE
);

-- Specializations Table
CREATE TABLE specializations (
	id BIGSERIAL PRIMARY KEY,
	vet_id INTEGER REFERENCES vets(id),
	species_id INTEGER REFERENCES species(id)
);

-- Specializations Table
CREATE TABLE visits (
	id BIGSERIAL PRIMARY KEY,
	visit_date DATE,
	vet_id INTEGER REFERENCES vets(id),
	animal_id INTEGER REFERENCES animals(id)
);


-- ---------------- --
-- FIFTH MILESTONE --
-- ---------------- --

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- add index for a visits table by animal id
CREATE INDEX idx_animal_id ON visits (animal_id);

-- add index for a visits table by vet id
CREATE INDEX idx_vet_id ON visits (vet_id);

--add index for owners table by email
CREATE INDEX idx_email ON owners (email);