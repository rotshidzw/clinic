/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
	
SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
	
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
 
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
	
SELECT * FROM animals WHERE neutered = TRUE;
	
SELECT * FROM animals WHERE NOT name = 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


--## second one
-- How many animals are there?
SELECT COUNT(id) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(id) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most (by average), neutered or non-neutered animals?
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;