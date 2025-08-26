-- 코드를 입력하세요
-- 생산일자가 2022년 5월인 식품들의 식품 ID, 식품 이름, 총매출을 조회하는 SQL문을 작성
-- 총매출을 기준으로 내림차순 정렬해주시고 총매출이 같다면 식품 ID를 기준으로 오름차순 정렬
SELECT
    P.PRODUCT_ID,
    P.PRODUCT_NAME,
    SUM(P.PRICE * O.AMOUNT) AS TOTAL_SALES
FROM 
    FOOD_PRODUCT AS P
    JOIN
    FOOD_ORDER AS O
    USING(PRODUCT_ID)
WHERE 
    YEAR(PRODUCE_DATE) = 2022
    AND MONTH(PRODUCE_DATE) = 5
GROUP BY 
    P.PRODUCT_ID
ORDER BY 3 DESC, 1;
    