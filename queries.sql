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

BEGIN;

UPDATE animals
SET species = 'unspecified';

SELECT species FROM animals;

ROLLBACK;

SELECT species FROM animals;


/* update species */

BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

SELECT name, species FROM animals;

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

SELECT name, species FROM animals;

COMMIT;

SELECT name, species FROM animals;

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


-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts)
FROM animals
WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000
GROUP BY species;