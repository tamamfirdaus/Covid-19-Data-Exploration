-- Indonesia Mortality Rate
CREATE OR REPLACE VIEW indonesia_mortality_rate AS
SELECT d.date, d.new_deaths, p.population, (d.new_deaths/p.population)*100 AS mortality_rate 
FROM covid19_deaths AS d
JOIN population AS p ON d.iso_code = p.iso_code 
WHERE d.iso_code = 'IDN';

-- Indonesia Morbidity Rate
CREATE OR REPLACE VIEW indonesia_morbidity_rate AS
SELECT c.date, c.new_cases, p.population, (c.new_cases/p.population)*100 AS morbidity_rate 
FROM covid19_cases AS c
JOIN population AS p ON c.iso_code = p.iso_code 
WHERE c.iso_code = 'IDN';

-- Indonesia Case Fatality Rate
CREATE OR REPLACE VIEW indonesia_case_fatalityRate AS
SELECT c.date, d.total_deaths, c.total_cases, (d.total_deaths/c.total_cases)*100 AS fatality_rate 
FROM covid19_cases AS c
JOIN covid19_deaths AS d ON c.iso_code = d.iso_code AND c.date = d.date
WHERE c.iso_code = 'IDN';


