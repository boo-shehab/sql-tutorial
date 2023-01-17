SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' or name = 'Pikachu';
SELECT (name, escape_attempts) from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
SELECT * FROM animals;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN WORK;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
COMMIT WORK;
SELECT *FROM animals;

BEGIN WORK;
DELETE FROM animals
ROLLBACK WORK;
SELECT *FROM animals;

BEGIN WORK;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_2022_animals;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT delete_2022_animals;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT WORK;

SELECT count(*) FROM animals;
SELECT count(*) FROM animals WHERE escape_attempts = 0;
SELECT avg(weight_kg) FROM animals;

SELECT CASE WHEN neutered THEN 'neutered' ELSE 'not neutered' END as escapes_most FROM animals
GROUP BY neutered
ORDER BY SUM(escape_attempts) DESC
LIMIT 1;

SELECT species, min(weight_kg), max(weight_kg) FROM animals GROUP BY species;

SELECT species, COALESCE(AVG(
    CASE
        WHEN date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
            THEN escape_attempts
    END), 0)
FROM animals
GROUP BY species;