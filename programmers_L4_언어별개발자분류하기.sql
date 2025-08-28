-- GRADE별 개발자의 정보를 조회
-- A : Front End 스킬과 Python 스킬을 함께 가지고 있는 개발자
-- B : C# 스킬을 가진 개발자
-- C : 그 외의 Front End 개발자
-- GRADE가 존재하는 개발자의 GRADE, ID, EMAIL을 조회하는 SQL 문을 작성
-- GRADE와 ID를 기준으로 오름차순 정렬

-- 틀림틀림 다시다시!!!
-- 재시도 예정!!!
SELECT
    CASE
        WHEN S.CATEGORY  = 'Front End' AND S.NAME = 'Python' THEN 'A'
        WHEN S.NAME = 'C#' THEN 'B'
        WHEN S.CATEGORY  = 'Front End' THEN 'C'
    END AS GRADE,
    D.ID
FROM
    SKILLCODES AS S
    JOIN
    DEVELOPERS AS D
    ON (S.CODE & D.SKILL_CODE) > 0
GROUP BY 
    D.ID