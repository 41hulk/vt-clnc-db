/* Database schema to keep the structure of entire database. */

CREATE TABLE species (
    id                  SERIAL PRIMARY KEY,
    name                VARCHAR(250)
);

CREATE TABLE owners (
    id                  SERIAL PRIMARY KEY,
    full_name           VARCHAR(250),
    age                 INT
);

CREATE TABLE animals (
    id                  INT GENERATED ALWAYS AS IDENTITY,
    name                VARCHAR(250),
    date_of_birth       DATE,
    escape_attempts     INT,
    neutered            BOOLEAN,
    weight_kg           DECIMAL,
    PRIMARY KEY(id)
    
);

CREATE TABLE vets (
    id                  SERIAL PRIMARY KEY,
    name                VARCHAR(250),
    age                 INT,
    date_of_graduation  DATE
);

CREATE TABLE specializations (
    id                  SERIAL PRIMARY KEY,
    vet_id              INT,
    species_id          INT,
    CONSTRAINT fk_vet FOREIGN KEY(vet_id) REFERENCES vets(id),
    CONSTRAINT fk_specializations_specie FOREIGN KEY(species_id) REFERENCES species(id)
);

CREATE TABLE visits (
    id                  SERIAL PRIMARY KEY,
    vet_id              INT,
    animal_id          INT,
    date_of_visit        DATE,
    CONSTRAINT fk_vet FOREIGN KEY(vet_id) REFERENCES vets(id),
    CONSTRAINT fk_visits_specie FOREIGN KEY(animal_id) REFERENCES animals(id)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(250);

ALTER TABLE animals REMOVE species;

ALTER TABLE animals ADD species_id INT REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT REFERENCES owners(id);
 