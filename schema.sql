
CREATE TABLE animals (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(60) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);
ALTER TABLE animals ADD COLUMN species VARCHAR(60);

CREATE TABLE owners (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(60) NOT NULL,
    age INT NOT NULL
);
CREATE TABLE species (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(60) NOT NULL
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);


CREATE TABLE vets(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(60) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL);

CREATE TABLE specializations (
    species_id INT NOT NULL,
    vet_id INT NOT NULL,
    PRIMARY KEY (species_id, vet_id));


CREATE TABLE visits (
    animals_id INT NOT NULL,
    vet_id INT NOT NULL,
    date_of_visit DATE NOT NULL,
    PRIMARY KEY (animals_id, vet_id, date_of_visit));
