-- 코드를 입력하세요
SELECT 
    HISTORY_ID, CAR_ID, 
    DATE_FORMAT(START_DATE, '%Y-%m-%d') AS START_DATE, 
    DATE_FORMAT(END_DATE, '%Y-%m-%d') AS END_DATE,
    (CASE
        WHEN DATEDIFF(END_DATE, START_DATE) >= 29 THEN '장기 대여'
        ELSE '단기 대여'
    END) AS RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE YEAR(START_DATE) = 2022 AND MONTH(START_DATE) = 9
ORDER BY HISTORY_ID DESC;

-- date1 - date2 = “두 날짜 간의 일 수 차이” 를 계산하는데, 끝 날짜와 시작 날짜를 같은 날로 치면 0이 아니라 0일 차로 계산