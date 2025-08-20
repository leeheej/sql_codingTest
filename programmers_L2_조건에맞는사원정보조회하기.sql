-- 코드를 작성해주세요
SELECT 
    SCORE, EMP_NO, EMP_NAME, POSITION, EMAIL
FROM
    (SELECT 
        G.EMP_NO, SUM(G.SCORE) AS SCORE,
        E.EMP_NAME, E.POSITION, E.EMAIL
    FROM
        HR_EMPLOYEES AS E
        INNER JOIN
        HR_GRADE AS G
        USING (EMP_NO)
    GROUP BY G.EMP_NO) AS T
WHERE SCORE = 
    (
    SELECT MAX(TOTAL)
    FROM
        (SELECT SUM(SCORE) AS TOTAL
        FROM HR_GRADE
        GROUP BY EMP_NO) AS S
    )
;
-- max와 sum은 한 번에 사용 못 합니다.
-- 서브쿼리 별칭을 붙여주세요.
-- 섭섭쿼리 섭섭하네요 최선일까요