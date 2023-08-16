-- Insert the animal "Agumon"
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);

-- Insert the animal "Gabumon"
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8.00);

-- Insert the animal "Pikachu"
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);

-- Insert the animal "Devimon"
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, TRUE, 11.00);


-- ---------------- --
-- SECOND MILESTONE --
-- ---------------- --

-- Insert the animal "Plantmon"
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-2-8', 0, FALSE, 11);

-- Insert the animal "Plantmon"
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2021-11-15', 2, TRUE, -5.7);

-- Insert the animal "Squirtle"
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13);

-- Insert the animal "Angemon"
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, TRUE, -45);

-- Insert the animal "Boarmon"
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, TRUE, 20.4);

-- Insert the animal "Blossom"
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, TRUE, 17);

-- Insert the animal "Ditto"
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, TRUE, 22);



-- ---------------- --
-- THIRD MILESTONE --
-- ---------------- --

-- Add data to owners table
INSERT INTO owners (full_name, age)
VALUES
	('Sam Smith', 34),
	('Jennifer Orwell', 19),
	('Bob', 45),
	('Melody Pond', 77),
	('Dean Winchester', 14),
	('Jodie Whittaker', 38);

-- Add data to species table
INSERT INTO species (name)
VALUES
	('Pokemon'),
  ('Digimon');

-- Set owners for each animal
UPDATE animals SET owner_id = 1 WHERE id = 1;
UPDATE animals SET owner_id = 2 WHERE id = 2;
UPDATE animals SET owner_id = 2 WHERE id = 3;
UPDATE animals SET owner_id = 3 WHERE id = 4;
UPDATE animals SET owner_id = 3 WHERE id = 6;
UPDATE animals SET owner_id = 4 WHERE id = 5;
UPDATE animals SET owner_id = 4 WHERE id = 7;
UPDATE animals SET owner_id = 4 WHERE id = 10;
UPDATE animals SET owner_id = 5 WHERE id = 8;
UPDATE animals SET owner_id = 5 WHERE id = 9;
SELECT * FROM animals ORDER BY id;
