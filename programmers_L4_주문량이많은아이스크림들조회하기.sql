-- 7월 아이스크림 총 주문량
-- +
-- 상반기의 아이스크림 총 주문량
-- 값이 큰 순서대로 상위 3개의 맛을 조회하는 SQL 문을 작성

SELECT 
    F.FLAVOR
FROM 
    FIRST_HALF AS F
    JOIN JULY AS J
    ON F.FLAVOR = J.FLAVOR
GROUP BY 
    F.FLAVOR
ORDER BY 
    (SUM(F.TOTAL_ORDER) + SUM(J.TOTAL_ORDER)) DESC
LIMIT 3;