-- Find all animals whose name ends in "mon"
SELECT * FROM animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- List the name of all animals that are neutered and have less than 3 escape attempts
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu"
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- Find all animals that are neutered
SELECT * FROM animals WHERE neutered = TRUE;

-- Find all animals not named Gabumon
SELECT * FROM animals WHERE name <> 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with weights that equal precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- ---------------- --
-- SECOND MILESTONE --
-- ---------------- --

-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;


-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
-- Verify that changes were made.
-- Commit the transaction.
-- Verify that changes persist after commit.

BEGIN;
UPDATE animals SET species = 'digimon ' WHERE NAME LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

SELECT * FROM animals ORDER BY id;


-- Delete all records in the animals table, then roll back the transaction.

BEGIN;
DELETE FROM animals;
ROLLBACK;


-- Transaction With SavePoint
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;


-- Aggregation Functions:

-- How many animals are there?
SELECT COUNT(id) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(id) FROM animals WHERE escape_attempts = 0;

-- How many animals are there?
SELECT AVG(weight_kg) AS average FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, COUNT(*) AS escape_count FROM animals 
WHERE escape_attempts > 0 GROUP BY neutered ORDER BY escape_count DESC;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight
FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2010?
SELECT species, AVG(escape_attempts) AS average_escape_attempts FROM animals
WHERE date_of_birth BETWEEN '1990-1-1' AND '2010-1-1' GROUP BY species;

