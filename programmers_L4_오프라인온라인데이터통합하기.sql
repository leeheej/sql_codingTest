-- 2022년 3월의 오프라인/온라인 상품 판매 데이터의 판매 날짜, 상품ID, 유저ID, 판매량을 출력
-- OFFLINE_SALE 테이블의 판매 데이터의 USER_ID 값은 NULL 로 표시
-- 판매일을 기준으로 오름차순 정렬
-- 판매일이 같다면 상품 ID를 기준으로 오름차순
-- 상품ID까지 같다면 유저 ID를 기준으로 오름차순 정렬
SELECT 
    DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS SALES_DATE,
    PRODUCT_ID,
    USER_ID,
    SALES_AMOUNT
FROM 
    ONLINE_SALE
WHERE 
    SALES_DATE LIKE '2022-03%'
    
UNION ALL

SELECT 
    DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS SALES_DATE,
    PRODUCT_ID,
    NULL AS USER_ID,
    SALES_AMOUNT
FROM 
    OFFLINE_SALE
WHERE 
    SALES_DATE LIKE '2022-03%'
    
ORDER BY 
    SALES_DATE,PRODUCT_ID,USER_ID
;

-- USING (SALES_DATE, PRODUCT_ID) 이런식으로 2개의 조건을 쓰게 되면, 
-- 양 테이블에서 두 조건이 일치하는 결과만 보여주기 때문에 데이터 유실됨!