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

 --third
INSERT INTO owners
    (full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

SELECT * from  owners;

INSERT INTO species (name) VALUES ('pokemon'),  ('digimon');

select * from species;

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'digimon') WHERE name LIKE '%mon';

select * from species_id;

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'pokemon') WHERE species_id IS NULL;

select * from species_id;

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');