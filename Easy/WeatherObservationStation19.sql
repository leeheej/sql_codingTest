-- Consider p1(a,b) and p2(c,d) to be two points on a 2D plane 
-- where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) 
-- and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
-- Query the Euclidean Distance between points p1 and p2 and format your answer to display 4 decimal digits.

SELECT 
    ROUND(SQRT(
        POWER(MAX(LAT_N) - MIN(LAT_N), 2)
        + POWER(MAX(LONG_W) - MIN(LONG_W), 2)
    ),4)
FROM STATION;

-- SQRT
-- POWER
-- 공부할것!!!! 짧고 빠르게 끝내줌!!!