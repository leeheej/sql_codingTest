-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
-- * * * * * 
-- * * * * 
-- * * * 
-- * * 
-- *

SELECT REPEAT('* ', 20)
UNION ALL
SELECT REPEAT('* ', 19)
UNION ALL
SELECT REPEAT('* ', 18)
UNION ALL
SELECT REPEAT('* ', 17)
UNION ALL
SELECT REPEAT('* ', 16)
UNION ALL
SELECT REPEAT('* ', 15)
UNION ALL
SELECT REPEAT('* ', 14)
UNION ALL
SELECT REPEAT('* ', 13)
UNION ALL
SELECT REPEAT('* ', 12)
UNION ALL
SELECT REPEAT('* ', 11)
UNION ALL
SELECT REPEAT('* ', 10)
UNION ALL
SELECT REPEAT('* ', 9)
UNION ALL
SELECT REPEAT('* ', 8)
UNION ALL
SELECT REPEAT('* ', 7)
UNION ALL
SELECT REPEAT('* ', 6)
UNION ALL
SELECT REPEAT('* ', 5)
UNION ALL
SELECT REPEAT('* ', 4)
UNION ALL
SELECT REPEAT('* ', 3)
UNION ALL
SELECT REPEAT('* ', 2)
UNION ALL
SELECT REPEAT('* ', 1);


/*
[REPEAT , REVERSE 사용해 문자열 반복 출력 및 문자열 거꾸로 출력 실시]
1. REPEAT(데이터, 반복 횟수) : 반복횟수 만큼 문자열을 반복 출력합니다
2. REVERSE(데이터) : 문자열을 거꾸로 출력합니다
*/

-- SELECT REPEAT('투케이', 2) AS "문자열 반복 출력",
--        REVERSE('투케이') AS "문자열 거꾸로 출력";
