-- 코드를 작성해주세요
-- 대장균 개체의 ID(ID)와 자식의 수(CHILD_COUNT)를 출력
-- 자식이 없다면 자식의 수는 0으로 출력
-- 개체의 ID 에 대해 오름차순 정렬

SELECT 
    A.ID,
    COALESCE(COUNT(B.PARENT_ID),0) AS CHILD_COUNT
    -- COUNT(B.PARENT_ID)  AS CHILD_COUNT
    -- SUM(IF(B.ID IS NULL, 0, 1)) AS CHILD_COUNT
FROM ECOLI_DATA AS A
    LEFT OUTER JOIN
    ECOLI_DATA AS B
    ON A.ID = B.PARENT_ID
GROUP BY A.ID
ORDER BY 1;