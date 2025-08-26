-- 코드를 작성해주세요
-- 대장균 개체의 크기를 내름차순으로 정렬
-- 상위 0% ~ 25% 를 'CRITICAL', 26% ~ 50% 를 'HIGH', 51% ~ 75% 를 'MEDIUM', 76% ~ 100% 를 'LOW' 라고 분류
-- 대장균 개체의 ID(ID) 와 분류된 이름(COLONY_NAME)을 출력하는 SQL 문을 작성
-- 결과는 개체의 ID 에 대해 오름차순 정렬
-- 총 데이터의 수는 4의 배수이며 같은 사이즈의 대장균 개체가 서로 다른 이름으로 분류되는 경우는 없습니다

SELECT
    ID,
    CASE
        WHEN Q >=0 AND Q<=0.25 THEN 'CRITICAL'
        WHEN Q >0.25 AND Q<=0.5 THEN 'HIGH'
        WHEN Q >0.5 AND Q<=0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS COLONY_NAME
FROM
    (SELECT 
        ID,
        PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS Q
    FROM ECOLI_DATA) AS P_R
ORDER BY 1;
    
