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

-- Set species for each animal
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';
SELECT * FROM animals ORDER BY id;

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


-- ---------------- --
-- FOURTH MILESTONE --
-- ---------------- --

-- Data insertion to vets table
INSERT INTO vets (name, age, date_of_graduation)
VALUES
	('William Tatcher', 45, '2000-4-23'),
	('Maisy Smith', 26, '2019-1-17'),
	('Stephanie Mendez', 64, '1981-5-4'),
	('Jack Harkness', 38, '2008-6-8');

-- Data Insertion to specializations table
INSERT INTO specializations (vet_id, species_id)
VALUES 
	(1, 1),
	(3, 1),
	(3, 2),
	(4, 2);

-- Data Insertion to visits table
INSERT INTO visits (visit_date, vet_id, animal_id)
VALUES
	('2020-5-24', 1, 1),
	('2020-6-22', 3, 1),
	('2021-2-2-', 4, 2),
	('2020-1-5', 2, 3),
	('2020-3-8', 2, 3),
	('2020-5-14', 2, 3),
	('2021-5-4', 3, 4),
	('2021-2-24', 4, 5),
	('2019-12-21', 2, 6),
	('2020-8-10', 1, 6),
	('2021-4-7', 2, 6),
	('2019-9-29', 3, 7),
	('2020-10-3', 4, 8), 
	('2020-11-4', 4, 8),
	('2019-1-24', 2, 9),
	('2019-5-15', 2, 9),
	('2020-2-27', 2, 9),
	('2020-8-3', 2, 9),
	('2020-5-24', 3, 10),
	('2021-1-11', 1, 10);
	
