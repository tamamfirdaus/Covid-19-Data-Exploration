-- Show every table (covid19_cases, covid19_death, population;
SELECT * FROM covid19_cases;
SELECT * FROM covid19_deaths;
SELECT * FROM population ORDER BY location;

-- Select Covid-19 cases for spesific country (ex: Indonesia)
SELECT * FROM covid19_cases WHERE iso_code = 'IDN';

-- Select Covid-19 cases for spesific country (ex: Indonesia) in spesific date (DD/MM/YY)
SELECT * FROM covid19_cases WHERE iso_code = 'IDN' AND date = '10/09/21';