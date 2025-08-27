-- 년, 월, 성별 별로 상품을 구매한 회원수를 집계하는 SQL문을 작성
-- 년, 월, 성별을 기준으로 오름차순 정렬
-- 성별 정보가 없는 경우 결과에서 제외
SELECT 
    YEAR(S.SALES_DATE) AS YEAR, 
    MONTH(S.SALES_DATE) AS MONTH, 
    GENDER,
    COUNT(DISTINCT USER_ID) AS USERS -- 회원수 유니크 값 카운트 해야하는점 주의!!!
FROM 
    USER_INFO AS I
    JOIN
    ONLINE_SALE AS S
    USING (USER_ID)
WHERE 
    GENDER IS NOT NULL
GROUP BY 
    YEAR(S.SALES_DATE), MONTH(S.SALES_DATE), GENDER
ORDER BY 
    1,2,3;