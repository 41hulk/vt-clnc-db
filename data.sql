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