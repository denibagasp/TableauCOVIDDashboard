--Queries used for Tableau Project



--1.

SELECT SUM(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
FROM PortofolioProject..CovidDeaths
--WHERE location like '%states%'
WHERE continent is not null
--GROUP BY date
ORDER BY 1,2

-- Just a double check based off the data provided
-- numbers are extremely close so we will keep them - The Second includes "International"  Location


--Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
--From PortfolioProject..CovidDeaths
----Where location like '%states%'
--where location = 'World'
----Group By date
--order by 1,2

--2.
SELECT location, SUM(cast(new_deaths as int)) as TotalDeathCount
FROM PortofolioProject..CovidDeaths
--WHERE location like '%states%'
WHERE continent is null
AND location not in ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount desc

--3.
SELECT location, population, MAX(total_cases) as HighestInfenctionCount, Max((total_Cases/population))*100 as PercentagePopulationInfected
FROM PortofolioProject..CovidDeaths
--WHERE location like '%states%'
GROUP BY location, population
ORDER BY PercentagePopulationInfected desc


--4.
SELECT location, population, date, MAX(total_cases) as HighestInfenctionCount, Max((total_Cases/population))*100 as PercentagePopulationInfected
FROM PortofolioProject..CovidDeaths
--WHERE location like '%states%'
GROUP BY location, population, date
ORDER BY PercentagePopulationInfected desc
