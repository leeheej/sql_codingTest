-- 자동차 종류가 '트럭'인 자동차의 대여 기록에 대해서 
-- 대여 기록 별로 대여 금액(컬럼명: FEE)을 구하여 
-- 대여 기록 ID와 대여 금액 리스트를 출력하는 SQL문
-- 대여 금액을 기준으로 내림차순 정렬 -> 대여 기록 ID를 기준으로 내림차순 정렬
SELECT 
    D.HISTORY_ID,
    ROUND((F.DAILY_FEE * D.DURATION * ((100 - F.DISCOUNT_RATE) / 100)),0) AS FEE
FROM
    (SELECT 
        HISTORY_ID,
        CAR_ID,
        DATEDIFF(END_DATE, START_DATE) + 1 AS DURATION,
        CASE 
            WHEN (DATEDIFF(END_DATE, START_DATE)+1) >= 90 THEN '90일 이상'
            WHEN (DATEDIFF(END_DATE, START_DATE)+1) >= 30 THEN '30일 이상'
            WHEN (DATEDIFF(END_DATE, START_DATE)+1) >= 7 THEN '7일 이상'
            ELSE 'N'
        END AS DURATION_TYPE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY) AS D -- 대여기록별 기간 및 타입
    LEFT OUTER JOIN
    (SELECT *
    FROM 
        CAR_RENTAL_COMPANY_CAR AS C
        JOIN
        CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS P
        USING(CAR_TYPE)) AS F -- 자동자별 금액 요금
    ON
        D.CAR_ID = F.CAR_ID AND 
        D.DURATION_TYPE = F.DURATION_TYPE
WHERE 
    F.CAR_TYPE = '트럭'
ORDER BY FEE DESC, HISTORY_ID DESC;