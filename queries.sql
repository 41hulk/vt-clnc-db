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

-- Who was the last animal seen by William Tatcher?
SELECT animals.name, visits.date_of_visit
FROM animals
INNER JOIN visits ON visits.animal_id = animals.id
INNER JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animals.id)
FROM animals
INNER JOIN visits ON visits.animal_id = animals.id
INNER JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name
FROM vets
LEFT JOIN specializations On specializations.vet_id = vets.id
LEFT JOIN species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name
FROM animals
INNER JOIN visits ON visits.animal_id = animals.id
INNER JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez' 
AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'
GROUP BY animals.id;

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(visits.id) AS total_visits
FROM animals
LEFT JOIN visits ON visits.animal_id = animals.id
GROUP BY animals.id
ORDER BY total_visits DESC;

-- Who was Maisy Smith's first visit?
SELECT animals.name, visits.date_of_visit
FROM animals
INNER JOIN visits ON visits.animal_id = animals.id
INNER JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit
LIMIT 1;


-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT 
	animals.name AS animal_name,
  species.name AS species,
  owners.full_name AS owner,
  vets.name AS vet_name,
  visits.date_of_visit
FROM animals
INNER JOIN visits ON visits.animal_id = animals.id
INNER JOIN vets ON visits.vet_id = vets.id
INNER JOIN owners ON animals.owner_id = owners.id
INNER JOIN species ON animals.species_id = species.id
ORDER BY visits.date_of_visit DESC
LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name, COUNT(visits)
FROM visits
INNER JOIN vets ON visits.vet_id = vets.id
INNER JOIN animals ON visits.animal_id = animals.id
WHERE animals.species_id NOT IN (SELECT id FROM specializations WHERE vet_id = vets.id)
GROUP BY vets.id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(visits)
FROM visits
INNER JOIN vets ON visits.vet_id = vets.id
INNER JOIN animals ON visits.animal_id = animals.id
INNER JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY count DESC
LIMIT 1;