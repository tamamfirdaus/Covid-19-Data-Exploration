-- Show every table (covid19_cases, covid19_death, population;
SELECT * FROM covid19_cases;
SELECT * FROM covid19_deaths;
SELECT * FROM population ORDER BY location;

-- Select Covid-19 cases for spesific country (ex: Indonesia)
SELECT * 
FROM covid19_cases 
WHERE iso_code = 'IDN';

-- Select Covid-19 cases for spesific country (ex: Indonesia) in spesific date (DD/MM/YY)
SELECT * 
FROM covid19_cases 
WHERE iso_code = 'IDN' AND date = '10/09/21';

-- Select highest new case and death in spesific country (ex: Indonesia)
SELECT MAX(new_cases) 
FROM covid19_cases 
WHERE iso_code = 'IDN'; 

-- Compare Total Death to Total Case (known as 'Case Fatality Rate') in percent
SELECT c.location, c.date, d.total_deaths, c.total_cases, (d.total_deaths/c.total_cases)*100 AS fatality_rate 
FROM covid19_cases AS c
JOIN covid19_deaths AS d ON c.iso_code = d.iso_code AND c.date = d.date
WHERE d.total_deaths IS NOT NULL; 

-- Compare New Case to Population (known as 'Morbidity Rate') in percent
SELECT c.location, c.date, c.new_cases, p.population, (c.new_cases/p.population)*100 AS morbidity_rate 
FROM covid19_cases AS c
JOIN population AS p ON c.iso_code = p.iso_code;

-- Compare New Death to Population (known as 'Mortality Rate') in percent
SELECT d.location, d.date, d.new_deaths, p.population, (c.new_deaths/p.population)*100 AS mortality_rate 
FROM covid19_deaths AS d
JOIN population AS p ON d.iso_code = p.iso_code;

-- 10 Highest Morbidity Rate in Indonesia
SELECT c.date, c.new_cases, p.population, (c.new_cases/p.population)*100 AS morbidity_rate 
FROM covid19_cases AS c
JOIN population AS p ON c.iso_code = p.iso_code 
WHERE c.iso_code = 'IDN' 
ORDER BY morbidity_rate DESC 
LIMIT 10;

-- 10 Highest Mortality Rate in Indonesia
SELECT d.date, d.new_deaths, p.population, (d.new_deaths/p.population)*100 AS mortality_rate 
FROM covid19_deaths AS d
JOIN population AS p ON d.iso_code = p.iso_code 
WHERE d.iso_code = 'IDN' 
ORDER BY mortality_rate DESC, d.new_deaths DESC 
LIMIT 10;

-- Highest Case Fatality Rate for every country
SELECT location, MAX(fatality_rate) AS highest_fatality_rate
FROM
(
  SELECT c.location, c.date, d.total_deaths, c.total_cases, (d.total_deaths/c.total_cases)*100 AS fatality_rate 
  FROM covid19_cases AS c
  JOIN covid19_deaths AS d ON c.iso_code = d.iso_code AND c.date = d.date
  WHERE d.total_deaths IS NOT NULL
) fr
GROUP BY location
ORDER BY location;

-- Show Total Cases for every continent;
SELECT continent, MAX(total_cases) AS all_cases 
FROM covid19_cases
WHERE continent IS NOT NULL
GROUP BY continent 
ORDER BY all_cases DESC;

-- Show Total Cases for every country;
SELECT location, MAX(total_cases) AS all_cases 
FROM covid19_cases
WHERE continent IS NOT NULL
GROUP BY location 
ORDER BY all_cases DESC;

-- Show countries that have zero Covid-19 case
SELECT location, all_cases FROM
(
  SELECT location, MAX(total_cases) AS all_cases 
  FROM covid19_cases
  WHERE continent IS NOT NULL
  GROUP BY location
) covid19_all_cases 
WHERE all_cases IS NULL
ORDER BY location; 

