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
  SELECT * FROM animals ORDER BY id;
COMMIT;
  SELECT * FROM animals ORDER BY id;


-- Delete all records in the animals table, then roll back the transaction.

BEGIN;
  DELETE FROM animals;
  SELECT COUNT(id) FROM animal;
ROLLBACK;
  SELECT COUNT(id) FROM animal;


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
SELECT species, AVG(escape_attempts) FROM animals   
WHERE  date_of_birth >= '1990/01/01' AND date_of_birth <= '2000/12/31'
GROUP BY species;


-- ---------------- --
-- THIRD MILESTONE --
-- ---------------- --

-- What animals belong to Melody Pond?
SELECT full_name, name FROM owners 
JOIN animals ON owners.id = animals.owner_id
WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT a.name AS animal_name, s.name AS species FROM animals AS a
JOIN species s on s.id = a.species_id 
WHERE s.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animalS.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name, count(species.name) as amount FROM animals 
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT o.full_name AS owner, a.name AS animal_name, s.name AS species
FROM animals AS a
JOIN species AS s on a.species_id = s.id
JOIN owners AS o ON a.owner_id = o.id
WHERE s.name = 'Digimon' AND  o.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT a.name AS animal_name, o.full_name AS owner, a.escape_attempts 
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

-- Who owns the most animals?
SELECT full_name, COUNT(full_name) AS amount FROM owners
JOIN animals ON animals.owner_id = owners.id
GROUP BY full_name
ORDER BY amount DESC LIMIT 1;



-- ---------------- --
-- FORTH MILESTONE --
-- ---------------- --

-- Who was the last animal seen by William Tatcher?
SELECT a.name animal, vt.name vet, vs.visit_date FROM animals a
JOIN visits vs ON a.id = vs.animal_id
JOIN vets vt ON vt.id = vs.vet_id
WHERE vt.name = 'William Tatcher'
ORDER BY vs.visit_date DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT ve.name, COUNT(DISTINCT v.animal_id) AS distinct_animals
FROM visits v
JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Stephanie Mendez'
GROUP BY ve.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT vt.name, s.name FROM vets	vt
LEFT JOIN specializations sp ON vt.id = sp.vet_id
LEFT JOIN species s ON s.id = sp.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT a.name animal, vt.name vet, vs.visit_date FROM animals a
JOIN visits vs ON a.id = vs.animal_id
JOIN vets vt ON vt.id = vs.vet_id
WHERE 
	vt.name = 'Stephanie Mendez' AND 
	vs.visit_date >= '2020-4-1' AND 
	vs.visit_date <= '2020-08-30';

-- What animal has the most visits to vets?
SELECT a.name, COUNT(a.name) amount FROM visits vs
JOIN animals a ON a.id = vs.animal_id
GROUP BY a.name
ORDER BY amount DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT a.name animal_name, vt.name vet, vs.visit_date FROM animals a
JOIN visits vs ON vs.animal_id = a.id
JOIN vets vt ON vs.vet_id = vt.id
WHERE vt.name = 'Maisy Smith'
ORDER BY vs.visit_date LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT 
	a.name animal_name,
	a.date_of_birth animal_birth_date,
	a.escape_attempts ,
	a.weight_kg animal_weight,
	vt.name vet,
	vt.age vet_age,
	vt.date_of_graduation,
	vs.visit_date
FROM animals a
JOIN visits vs ON a.id = vs.animal_id
JOIN vets vt ON vs.vet_id = vt.id
ORDER BY vs.visit_date DESC

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) non_specialized_visits FROM visits vs
JOIN vets vt ON vs.vet_id = vt.id
JOIN specializations sp ON sp.vet_id = vt.id
JOIN animals a ON a.id = vs.id
WHERE sp.species_id != a.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT vt.name, s.name speciality, COUNT(s.name) amount FROM vets vt
JOIN visits vs ON vt.id = vs.vet_id
JOIN animals a ON vs.animal_id = a.id
JOIN species s ON s.id = a.species_id
WHERE vt.name = 'Maisy Smith'
GROUP BY s.name, vt.name
ORDER BY amount DESC LIMIT 1;



-- ---------------- --
-- FIFTH MILESTONE --
-- ---------------- --

SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;

SELECT * FROM visits WHERE vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM visits WHERE vet_id = 2;

SELECT * FROM owners WHERE email = 'owner_18327@mail.com';
EXPLAIN ANALYZE SELECT * FROM owners WHERE email = 'owner_18327@mail.com';


