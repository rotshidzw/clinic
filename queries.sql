/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
	
SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempt < 3;
	
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
 
SELECT name, escape_attempt FROM animals WHERE weight_kg > 10.5;
	
SELECT * FROM animals WHERE neutered = TRUE;
	
SELECT * FROM animals WHERE NOT name = 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


              --## second one

BEGIN;

UPDATE animals SET species = 'unspecified';

SELECT species from animals;

ROLLBACK;

SELECT species from animals;
-- Update the species column to digimon and pokemon depending on the name's suffix
BEGIN;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

SELECT species from animals;

COMMIT;

SELECT species from animals;

-- Delete all records and rollback
BEGIN;

DELETE FROM animals;

ROLLBACK;

SELECT COUNT(*) FROM ANIMALS;

BEGIN;
-- Delete all animals born after Jan 1st, 2022 & update weight to be non-negative
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT delete_after_2022;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT delete_after_2022;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;



-- How many animals are there?
SELECT COUNT(name) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(name) FROM animals WHERE escape_attempt = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most (by average), neutered or non-neutered animals?
SELECT neutered, AVG(escape_attempt) FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempt) FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;