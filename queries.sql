/*Queries that provide answers to the questions from all projects.*/


SELECT * FROM animals WHERE name LIKE '%mon';
	
SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
	
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
 
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
	
SELECT * FROM animals WHERE neutered = TRUE;
	
SELECT * FROM animals WHERE NOT name = 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
