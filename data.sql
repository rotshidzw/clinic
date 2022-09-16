/* Populate database with sample data. */

INSERT INTO animals
    (name, date_of_birth, weight_kg, neutered, escape_attempt)
VALUES
    ('Agumon', '2020-02-03', 10.23, TRUE, 0),
    ('Gabumon', '2018-11-15', 8, TRUE, 2),
    ('Pikachu', '2021-01-07', 15.04, FALSE, 1),
    ('Devimon', '2017-05-12', 11, TRUE, 5);

/* second table*/
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempt)
VALUES
    (
        'Charmander', 
        '2020-02-08',
        -11,
        FALSE,
        0
    ),
    (
        'Plantmon',
         '2021-11-15',
          -5.7,
           TRUE,
            2
    ),
    (
        'Squirtle',
         '1993-04-02',
          -12.13,
           FALSE,
            3
    ),
    (
        'Angemon',
        '2005-06-12',
         -45,
          TRUE,
           1
    ),
    (
        'Boarmon',
         '2005-06-07',
          20.4,
           TRUE,
            7
    ),
    (
        'Blossom',
         '1998-10-13',
          17,
           TRUE,
            3
    ),
    (
        'Ditto',
         '2022-05-14',
          22,
           TRUE,
            4
    );


BEGIN;

UPDATE animals SET species = 'unspecified';

ROLLBACK;


-- Update the species column to digimon and pokemon depending on the name's suffix
BEGIN;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

COMMIT;

-- Delete all records and rollback
BEGIN;

DELETE FROM animals;

ROLLBACK;

-- Delete all animals born after Jan 1st, 2022 & update weight to be non-negative
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT delete_after_2022;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT delete_after_2022;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;