-- A median is defined as a number separating the higher half of a data set from the lower half. 
-- Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

SELECT
    ROUND(AVG(sub.LAT_N), 4) AS median
FROM (
    SELECT
        LAT_N,
        ROW_NUMBER() OVER(ORDER BY LAT_N) AS rn_asc,
        ROW_NUMBER() OVER(ORDER BY LAT_N DESC) AS rn_desc
    FROM
        STATION
) sub
WHERE
    sub.rn_asc BETWEEN sub.rn_desc - 1 AND sub.rn_desc + 1
    AND (
        sub.rn_asc = sub.rn_desc
        OR ABS(sub.rn_asc - sub.rn_desc) <= 1
    );

-- 중앙값 구하기 뭔데...40분 붙잡고있다가 AI 도움받음