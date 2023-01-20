
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES  ('Agumon', '2020-02-03', 0, true, 10.23),
            ('Gabumon', '2018-11-15', 2, true, 8),
            ('Pikachu', '2021-01-07', 1, false, 15.04),
            ('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
    VALUES  ('Charmander', '2020-02-08', 0, false, -11),
            ('Plantmon', '2021-11-15', 2, true, -12.13),
            ('Squirtle', '1998-4-2', 3, false, -5.7),
            ('Angemon', '2005-6-12', 1, true, -45),
            ('Boarmon', '2005-6-7', 7, true, 20.4),
            ('Blossom', '1998-10-13', 3, true, 17),
            ('Ditto', '2022-5-14', 4, true, 22);

INSERT INTO owners 
    VALUES  (DEFAULT, 'Sam Smith', 34),
            (DEFAULT, 'Jennifer Orwell', 19),
            (DEFAULT, 'Bob', 45),
            (DEFAULT, 'Melody Pond', 77),
            (DEFAULT, 'Dean Winchester', 14),
            (DEFAULT, 'Jodie Whittaker', 38);

INSERT INTO species 
    VALUES  (DEFAULT, 'Pokemon'),
            (DEFAULT, 'Digimon');

UPDATE animals
    SET species_id = CASE
        WHEN name LIKE '%mon'
            THEN 2
            ELSE 1
        END;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon';
UPDATE animals SET owner_id = 3 WHERE name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander';
UPDATE animals SET owner_id = 4 WHERE name = 'Squirtle';
UPDATE animals SET owner_id = 4 WHERE name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon';
UPDATE animals SET owner_id = 5 WHERE name = 'Boarmon';


INSERT INTO vets(name, age, date_of_graduation)
    VALUES  ('William Tatcher', 45, '2000-4-23'),
            ('Maisy Smith', 26, '2019-6-17'),
            ('Stephanie Mendez', 64, '1981-5-4'),
            ('Jack Harkness', 38, '2008-6-8');

INSERT INTO specializations (species_id, vet_id)
    VALUES (1, 1), (2, 1), (2, 2), (4, 2);

INSERT INTO visits (animals_id, vet_id, date_of_visit)
    VALUES  (1, 1, '2020-5-24'),
            (1, 3, '2020-7-22'), 
            (2, 4, '2021-2-2'), 
            (3, 2, '2020-1-5'), 
            (3, 2, '2020-3-8'), 
            (3, 2, '2020-5-14'), 
            (4, 3, '2021-5-4'),
            (5, 4, '2021-2-24'), 
            (6, 2, '2019-12-21'), 
            (6, 1, '2020-8-10'), 
            (6, 2,'2021-4-7'), 
            (7, 3, '2019-9-29'), 
            (1, 4, '2020-10-3'), 
            (1, 4, '2020-11-4'), 
            (9, 2, '2019-1-24'), 
            (9, 2, '2019-5-15'), 
            (9, 2, '2020-2-27'),
            (9, 2, '2020-8-3'), 
            (10, 3, '2020-5-24'), 
            (10, 1, '2021-1-11');