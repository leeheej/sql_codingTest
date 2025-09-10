-- Given the CITY and COUNTRY tables, 
-- query the names of all the continents (COUNTRY.Continent) 
-- and their respective average city populations (CITY.Population) rounded down to the nearest integer.
SELECT
    CO.CONTINENT,
    FLOOR(AVG(CI.POPULATION))
FROM
    CITY CI
    JOIN
    COUNTRY CO
    ON CI.COUNTRYCODE = CO.CODE
GROUP BY 
    CO.CONTINENT
ORDER BY
    AVG(CI.POPULATION) DESC
;