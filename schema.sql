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
    CONSTRAINT fk_specie
        FOREIGN KEY(species_id)
            REFERENCES species(id),
    CONSTRAINT fk_owner
        FOREIGN KEY(owner_id)
            REFERENCES owners(id)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(250);
 