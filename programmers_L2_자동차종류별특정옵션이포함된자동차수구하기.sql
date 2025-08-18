-- 코드를 입력하세요
SELECT
    CAR_TYPE,
    COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE
    OPTIONS LIKE '%통풍시트%' OR
    OPTIONS LIKE '%열선시트%' OR
    OPTIONS LIKE '%가죽시트%'
-- WHERE OPTIONS REGEXP '통풍시트|열선시트|가죽시트' 으로도 사용 가능!!!연습해보기!!
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE;