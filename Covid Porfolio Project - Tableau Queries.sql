

Queries used for Tableau Project


-- 1.

Select SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS int)) AS total_deaths, SUM(CAST(new_deaths AS int))/SUM(new_cases)*100 AS DeathPercentage
From PortfolioProject..CovidDeaths$
--Where location Like '%states%'
Where continent is not null
--GROUP BY date
order by 1,2


-- Select SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS int)) AS total_deaths, SUM(CAST(new_deaths AS int))/SUM(new_cases)*100 AS DeathPercentage
--From PortfolioProject..CovidDeaths$
--Where location Like '%states%'
--Where location = 'World'
--GROUP BY date
--order by 1,2


-- 2. 

Select location, SUM(CAST(new_deaths AS int)) AS TotalDeathCount
From PortfolioProject..CovidDeaths$
--Where location Like '%states%'
Where continent is null
AND location not in ('World', 'European Union', 'International')
GROUP BY location
order by TotalDeathCount DESC


-- 3.

Select Location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS PercentPopulationInfected
From PortfolioProject..CovidDeaths$
-- Where location Like '%states%'
GROUP BY Location, population
order by PercentPopulationInfected DESC


-- 4. 

Select Location, population, date, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS PercentPopulationInfected
From PortfolioProject..CovidDeaths$
-- Where location Like '%states%'
GROUP BY Location, population, date
order by PercentPopulationInfected DESC