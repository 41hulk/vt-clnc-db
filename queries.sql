/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE 'mon%';

SELECT name from animals WHERE extract(year FROM date_of_birth) > 2016 AND extract(year FROM date_of_birth) < 2019;

SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

SELECT * from animals WHERE neutered = TRUE;

SELECT * from animals WHERE name != 'Gabumon';

SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* TRANSACTIONS */

/* update species */


/* check deletion */ 
BEGIN;

DELETE FROM animals;
ROLLBACK;
/* delete animals born after 2022 and update weight */
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
/* queries to answer questions */
-- How many animals are there?
SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(*)
FROM animals
WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg)
FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, SUM(escape_attempts) AS sum
FROM animals
GROUP BY neutered
ORDER BY sum DESC;

-- What animals belong to Melody Pond?
SELECT name
FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name
FROM animals
INNER JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name AS animal_name
FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id
ORDER BY full_name;

-- How many animals are there per species?
SELECT species.name, COUNT(animals)
FROM species
INNER JOIN animals ON animals.species_id = species.id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name
FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
INNER JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name
FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;

-- Who owns the most animals?
SELECT full_name, COUNT(animals)
FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id
GROUP BY full_name
ORDER BY count DESC;