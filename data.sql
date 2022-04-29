INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

-- INSERT OWNERS
INSERT INTO owners (
  full_name,
  age
) VALUES (
  'Sam Smith',
  34
);

INSERT INTO owners (
  full_name,
  age
) VALUES (
  'Jennifer Orwell',
  19
);

INSERT INTO owners (
  full_name,
  age
) VALUES (
  'Bob',
  45
);

INSERT INTO owners (
  full_name,
  age
) VALUES (
  'Melody Pond',
  77
);

INSERT INTO owners (
  full_name,
  age
) VALUES (
  'Dean Winchester',
  14
);

INSERT INTO owners (
  full_name,
  age
) VALUES (
  'Jodie Whittaker',
  38
);

-- INSERT animals
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Agumon',
  '2020-02-03',
  0,
  TRUE,
  10.23,
  ( 
    SELECT id 
    FROM species
    WHERE name = 'Digimon'
  ),
  (
    SELECT id
    FROM owners
    WHERE full_name = 'Sam Smith'
  )
);

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Gabumon',
  '2018-11-15',
  2,
  TRUE,
  8,
  ( 
    SELECT id 
    FROM species
    WHERE name = 'Digimon'
  ),
  (
    SELECT id
    FROM owners
    WHERE full_name = 'Jennifer Orwell'
  )
);

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Pikachu',
  '2021-01-07',
  1,
  FALSE,
  15.04,
  ( 
    SELECT id 
    FROM species
    WHERE name = 'Pokemon'
  ),
  (
    SELECT id
    FROM owners
    WHERE full_name = 'Jennifer Orwell'
  )
);

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Devimon',
  '2017-05-12',
  5,
  TRUE,
  11,
  ( 
    SELECT id 
    FROM species
    WHERE name = 'Digimon'
  ),
  (
    SELECT id
    FROM owners
    WHERE full_name = 'Bob'
  )
);

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Charmander',
  '2020-02-08',
  0,
  FALSE,
  -11,
  ( 
    SELECT id 
    FROM species
    WHERE name = 'Pokemon'
  ),
  (
    SELECT id
    FROM owners
    WHERE full_name = 'Melody Pond'
  )
);

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Plantmon',
  '2021-11-15',
  2,
  TRUE,
  -5.7,
  ( 
    SELECT id 
    FROM species
    WHERE name = 'Digimon'
  ),
  (
    SELECT id
    FROM owners
    WHERE full_name = 'Bob'
  )
);

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Squirtle',
  '1993-04-02',
  3,
  FALSE,
  -12.3,
  ( 
    SELECT id 
    FROM species
    WHERE name = 'Pokemon'
  ),
  (
    SELECT id
    FROM owners
    WHERE full_name = 'Melody Pond'
  )
);

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Angemon',
  '2005-06-12',
  1,
  TRUE,
  -45,
  ( 
    SELECT id 
    FROM species
    WHERE name = 'Digimon'
  ),
  (
    SELECT id
    FROM owners
    WHERE full_name = 'Dean Winchester'
  )
);

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Boarmon',
  '2005-06-07',
  7,
  TRUE,
  20.4,
  ( 
    SELECT id 
    FROM species
    WHERE name = 'Digimon'
  ),
  (
    SELECT id
    FROM owners
    WHERE full_name = 'Dean Winchester'
  )
);

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
  species_id,
  owner_id
) VALUES (
  'Blossom',
  '1998-10-13',
  3,
  TRUE,
  17,
    ( 
    SELECT id 
    FROM species
    WHERE name = 'Pokemon'
  ),
  (
    SELECT id
    FROM owners
    WHERE full_name = 'Melody Pond'
  )
);

-- Insert vets
INSERT INTO vets (
  name,
  age,
  date_of_graduation
) VALUES (
  'William Tatcher',
  45,
  '2000-04-23'
);

INSERT INTO vets (
  name,
  age,
  date_of_graduation
) VALUES (
  'Maisy Smith',
  26,
  '2019-01-17'
);

INSERT INTO vets (
  name,
  age,
  date_of_graduation
) VALUES (
  'Stephanie Mendez',
  64,
  '1981-05-04'
);

INSERT INTO vets (
  name,
  age,
  date_of_graduation
) VALUES (
  'Jack Harkness',
  38,
  '2008-06-08'
);

-- Insert specialties
INSERT INTO specializations (
  vet_id,
  species_id
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'William Tatcher'
  ),
  (
    SELECT id FROM species WHERE name = 'Pokemon'
  )
);

INSERT INTO specializations (
  vet_id,
  species_id
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Stephanie Mendez'
  ),
  (
    SELECT id FROM species WHERE name = 'Digimon'
  )
);

INSERT INTO specializations (
  vet_id,
  species_id
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Stephanie Mendez'
  ),
  (
    SELECT id FROM species WHERE name = 'Pokemon'
  )
);

INSERT INTO specializations (
  vet_id,
  species_id
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Jack Harkness'
  ),
  (
    SELECT id FROM species WHERE name = 'Digimon'
  )
);

-- Insert visits
INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'William Tatcher'
  ),
  (
    SELECT id FROM animals WHERE name = 'Agumon'
  ),
  '2020-05-24'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Stephanie Mendez'
  ),
  (
    SELECT id FROM animals WHERE name = 'Agumon'
  ),
  '2020-07-22'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Jack Harkness'
  ),
  (
    SELECT id FROM animals WHERE name = 'Gabumon'
  ),
  '2021-02-02'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Maisy Smith'
  ),
  (
    SELECT id FROM animals WHERE name = 'Pikachu'
  ),
  '2020-01-05'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Maisy Smith'
  ),
  (
    SELECT id FROM animals WHERE name = 'Pikachu'
  ),
  '2020-08-03'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Maisy Smith'
  ),
  (
    SELECT id FROM animals WHERE name = 'Pikachu'
  ),
  '2020-05-14'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Stephanie Mendez'
  ),
  (
    SELECT id FROM animals WHERE name = 'Devimon'
  ),
  '2021-05-04'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Jack Harkness'
  ),
  (
    SELECT id FROM animals WHERE name = 'Charmander'
  ),
  '2021-02-24'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Maisy Smith'
  ),
  (
    SELECT id FROM animals WHERE name = 'Plantmon'
  ),
  '2019-12-21'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'William Tatcher'
  ),
  (
    SELECT id FROM animals WHERE name = 'Plantmon'
  ),
  '2020-08-10'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Maisy Smith'
  ),
  (
    SELECT id FROM animals WHERE name = 'Plantmon'
  ),
  '2021-04-07'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Stephanie Mendez'
  ),
  (
    SELECT id FROM animals WHERE name = 'Squirtle'
  ),
  '2019-09-29'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Jack Harkness'
  ),
  (
    SELECT id FROM animals WHERE name = 'Angemon'
  ),
  '2020-10-03'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Jack Harkness'
  ),
  (
    SELECT id FROM animals WHERE name = 'Angemon'
  ),
  '2020-11-04'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Maisy Smith'
  ),
  (
    SELECT id FROM animals WHERE name = 'Boarmon'
  ),
  '2019-01-24'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Maisy Smith'
  ),
  (
    SELECT id FROM animals WHERE name = 'Boarmon'
  ),
  '2019-05-15'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Maisy Smith'
  ),
  (
    SELECT id FROM animals WHERE name = 'Boarmon'
  ),
  '2020-02-27'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Maisy Smith'
  ),
  (
    SELECT id FROM animals WHERE name = 'Boarmon'
  ),
  '2020-08-03'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'Stephanie Mendez'
  ),
  (
    SELECT id FROM animals WHERE name = 'Blossom'
  ),
  '2020-05-24'
);

INSERT INTO visits (
  vet_id,
  animal_id,
  date_of_visit
) VALUES (
  (
    SELECT id FROM vets WHERE name = 'William Tatcher'
  ),
  (
    SELECT id FROM animals WHERE name = 'Blossom'
  ),
  '2021-01-11'
);