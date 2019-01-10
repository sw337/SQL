SELECT city.Name, city.District, city.population, country.Name
FROM city JOIN country ON city.CountryCode = country.Code
WHERE country.Name = 'Afghanistan'  LIMIT 5; 

SELECT country.Name, country.LifeExpectancy, country.Region
FROM country
WHERE Region = 'Middle East' ORDER BY LifeExpectancy ASC LIMIT 1 ; 

SELECT SUM(GNP) 
FROM country
WHERE Region = 'Caribbean';

SELECT country.Name
FROM country
JOIN countrylanguage on country.Code = countrylanguage.CountryCode
WHERE Region = 'Western Europe' AND Language = 'French'; 


SELECT city.Name
FROM city JOIN country ON city.CountryCode = country.Code
WHERE country.Name = 'Madagascar' AND city.Name LIKE 'A%'; 

