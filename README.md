# Covid-19 Data Exploration

## Dataset
All dataset in this project is downloaded from https://ourworldindata.org/covid-deaths on 18 September 2021. The data is divided into three csv files: covid19_cases.csv, covid19_deaths.csv, and population.csv. All these files could be found in Dataset folder.

## Implementation
This project is implemented using MySQL. The tools that may be needed are MySQL server, MySQLWorkbench, and Visual Studio Code.

## Table
There are three tables imported from csv files.
1. covid19_cases
    * iso_code: text
    * continent: text
    * location: text
    * date: text
    * total_cases: int
    * new_cases: int
2. covid19_deaths
    * iso_code: text
    * continent: text
    * location: text
    * date: text
    * total_deaths: int
    * new_deaths: int    
3. population
    * iso_code: text
    * continent: text
    * location: text
    * population: int
    * population_density: double
    * median_age: double
    * aged_65_older: double
    * aged_70_older: double
    * gdp_per_capita: double

## SQL Code
* exploration.sql -> some queries to explore covid19 data
* view.sql -> queries to create VIEW

## References:
  * https://www.youtube.com/watch?v=qfyynHBFOsM
  * https://dev.mysql.com/doc/refman/8.0/en/
  * https://marketplace.visualstudio.com/items?itemName=formulahendry.vscode-mysql
  