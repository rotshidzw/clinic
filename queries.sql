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


--third

--What animals belong to Melody Pond?

SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).

SELECT * FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'pokemon';

--List all owners and their animals, remember to include those that don't own any animal.

SELECT * FROM animals FULL OUTER JOIN owners ON animals.owner_id = owners.id;

--How many animals are there per species?

SELECT COUNT(*), species.name FROM animals INNER JOIN species ON animals.species_id = species.id GROUP BY species.name;

--List all Digimon owned by Jennifer Orwell.

SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id INNER JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'digimon';

--List all animals owned by Dean Winchester that haven't tried to escape.

SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND escape_attempt = 0;

--Who owns the most animals?

SELECT full_name, COUNT(full_name) AS animals_owned FROM owners INNER JOIN animals ON animals.owner_id = owners.id GROUP BY full_name ORDER BY COUNT(full_name) DESC;

--last 

SELECT * FROM animals INNER JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'William Tatcher') ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(name) FROM ( SELECT name FROM animals INNER JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez') GROUP BY animals.id) AS animals_mendez;
    
SELECT * FROM vets FULL OUTER JOIN specializations ON vets.id = specializations.vet_id;

SELECT * FROM animals INNER JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez') AND (visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30');

SELECT * FROM ( SELECT name, COUNT(name) AS number_of_visits FROM animals INNER JOIN visits ON animals.id = visits.animal_id  GROUP BY name) AS name_visit ORDER BY number_of_visits DESC LIMIT 1;

SELECT * FROM animals INNER JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'Maisy Smith') ORDER BY visits.visit_date ASC LIMIT 1;

SELECT animal_id, animals.name, vet_id, vets.name, visit_date FROM visits INNER JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON animals.id = vets.id ORDER BY visit_date DESC LIMIT 1;

SELECT COUNT(*) FROM visits WHERE vet_id = ( SELECT id FROM vets  FULL OUTER JOIN specializations ON vets.id = specializations.vet_id WHERE species_id IS NULL);
    
SELECT species.name, COUNT(species.name) FROM visits INNER JOIN vets ON visits.vet_id = vets.id INNER JOIN animals ON visits.animal_id = animals.id INNER JOIN species ON animals.species_id = species.id WHERE vets.name = 'Maisy Smith' GROUP BY species.nameORDER BY count DESC LIMIT 1;