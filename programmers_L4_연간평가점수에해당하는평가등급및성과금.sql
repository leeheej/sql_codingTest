-- 사원별 성과금 정보를 조회
-- 사번, 성명, 평가 등급, 성과금을 조회하는 SQL문 (평가등급의 컬럼명은 GRADE로, 성과금의 컬럼명은 BONUS)
-- 96 이상: S	20%
-- 90 이상: A	15%
-- 80 이상: B	10%
-- 이외: C	0%
--  사번 기준으로 오름차순 정렬

SELECT 
    G.EMP_NO,
    E.EMP_NAME,
    G.GRADE,
    CASE G.GRADE
        WHEN 'S' THEN (E.SAL * 0.2) 
        WHEN 'A' THEN (E.SAL * 0.15)
        WHEN 'B' THEN (E.SAL * 0.1)
        ELSE 0
    END AS BONUS
FROM 
    HR_EMPLOYEES AS E 
    JOIN (
        SELECT 
            EMP_NO,
            CASE
                WHEN AVG(SCORE) >= 96 THEN 'S'
                WHEN AVG(SCORE) >= 90 THEN 'A'
                WHEN AVG(SCORE) >= 80 THEN 'B'
                ELSE 'C'
            END AS GRADE
        FROM HR_GRADE
        GROUP BY EMP_NO
    ) AS G USING (EMP_NO)
ORDER BY 1;