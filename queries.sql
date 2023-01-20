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


SELECT animals.* FROM animals
LEFT JOIN owners owner on owner.id = animals.owner_id
WHERE owner.full_name = 'Melody Pond';

SELECT animals.* FROM animals
JOIN species specie on specie.id = animals.species_id
WHERE specie.name = 'Pokemon';

SELECT * FROM animals
RIGHT JOIN owners owner ON owner.id = animals.owner_id;

SELECT specie.name AS specie_name, COUNT(animals.species_id) AS count
FROM animals
JOIN species specie on specie.id = animals.species_id
GROUP BY specie.name;

SELECT animals.* FROM animals
LEFT JOIN owners owner on owner.id = animals.owner_id
JOIN species specie on specie.id = animals.species_id
WHERE specie.name = 'Digimon' AND owner.full_name = 'Jennifer Orwell';

SELECT animals.*
FROM animals
LEFT JOIN owners owner on owner.id = animals.owner_id
WHERE animals.escape_attempts = 0 AND owner.full_name = 'Dean Winchester';

SELECT owner.full_name, COUNT(animals.owner_id) AS owned_animals
FROM animals
LEFT JOIN owners owner on owner.id = animals.owner_id
GROUP BY owner.full_name
ORDER BY COUNT(animals.owner_id) DESC
LIMIT 1;


SELECT animal.name, animal.date_of_birth, visit.date_of_visit, vet.name FROM animals animal
    JOIN visits visit ON animal.id = visit.animals_id
    JOIN vets vet ON vet.id = visit.vet_id
    WHERE visit.date_of_visit=( SELECT MAX(date_of_visit) FROM visits WHERE vet_id = 1);


SELECT vet.name, animal.name, visit.date_of_visit FROM vets vet
    JOIN visits visit ON vet.id = visit.vet_id
    JOIN animals animal ON animal.id = visit.animals_id
    WHERE visit.vet_id = 3;


SELECT vet.name, special.name FROM vets vet
    LEFT JOIN specializations spec ON vet.id = spec.vet_id
    LEFT JOIN species special ON spec.species_id = special.id;


SELECT animal.name, vet.name, visit.date_of_visit FROM animals animal
    JOIN visits visit ON visit.animals_id = animal.id
    JOIN vets vet ON vet.id = visit.vet_id
    WHERE vet.name = 'Stephanie Mendez'
        AND visit.date_of_visit > '2020-4-1'
        AND visit.date_of_visit < '2020-8-30';


SELECT animal.name, visit.date_of_visit FROM visits visit
    JOIN animals animal ON animal.id = visit.animals_id
    JOIN vets vet ON vet.id = visit.vet_id
    WHERE vet.name = 'Maisy Smith' 
    AND visit.date_of_visit = ( 
        SELECT MIN(visits.date_of_visit) FROM visits WHERE visits.vet_id = 2);

SELECT animal.*, vet.*, visit.date_of_visit FROM visits visit
    LEFT JOIN animals animal ON animal.id = visit.animals_id
    LEFT JOIN vets vet ON  vet.id = visit.vet_id
    WHERE visit.date_of_visit = (SELECT MAX(visits.date_of_visit) FROM visits);


WITH only_one_spec_vets AS (
    SELECT * FROM specializations WHERE vet_id IN (
        SELECT vet_id FROM specializations
        GROUP BY vet_id
        HAVING COUNT(vet_id) = 1
    )
)
SELECT COUNT(*) FROM vets
FULL JOIN only_one_spec_vets spec on vets.id = spec.vet_id
JOIN visits visit on vets.id = visit.vet_id
JOIN animals animal on animal.id = visit.animals_id
WHERE animal.species_id != spec.species_id OR spec.species_id IS NULL;


SELECT specie.name AS most_visiting_specie FROM vets
FULL JOIN specializations spec on vets.id = spec.vet_id
JOIN visits visit on vets.id = visit.vet_id
JOIN animals animal on animal.id = visit.animals_id
JOIN species specie ON specie.id = animal.species_id
WHERE spec.species_id IS NULL
GROUP BY specie.name
ORDER BY COUNT(specie.name) DESC
LIMIT 1;