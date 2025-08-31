-- Query a list of CITY names from STATION 
-- even number = 짝수
-- for cities that have an even ID number. 
-- Print the results in any order, but exclude duplicates from the answer.

SELECT DISTINCT CITY
FROM STATION
WHERE ID % 2 = 0;
-- WHERE MOD(ID, 2) = 0; -- Oracle
-- WHERE (ID & 1) = 0; -- SQL Server
-- WHERE (ID % 2) = 0; -- MySQL, PostgreSQL
