-- 코드를 입력하세요
-- 식품분류별로 가격이 제일 비싼 식품의 분류, 가격, 이름을 조회하는 SQL문을 작성
-- 식품분류가 '과자', '국', '김치', '식용유'인 경우만 출력시켜 주시고 결과는 식품 가격을 기준으로 내림차순
SELECT 
    CATEGORY,
    PRICE AS MAX_PRICE,
    PRODUCT_NAME
FROM 
    FOOD_PRODUCT
WHERE 
    (CATEGORY, PRICE) IN
    (SELECT
        CATEGORY, 
        MAX(PRICE) AS MAX_PRICE
    FROM
        FOOD_PRODUCT
    WHERE 
        CATEGORY IN ('과자', '국', '김치', '식용유')
    GROUP BY
        CATEGORY)
ORDER BY 
    MAX_PRICE DESC;


-- 윈도우 함수 사용해보기
SELECT
    CATEGORY, 
    PRICE AS MAX_PRICE,
    PRODUCT_NAME
FROM
    (SELECT
        CATEGORY, 
        PRICE,
        RANK() OVER (PARTITION BY CATEGORY ORDER BY PRICE DESC) PRICE_RANK,
        PRODUCT_NAME
    FROM
        FOOD_PRODUCT
    WHERE 
        CATEGORY IN ('과자', '국', '김치', '식용유')) AS R
WHERE 
    PRICE_RANK = 1
ORDER BY 
    PRICE DESC;
    
