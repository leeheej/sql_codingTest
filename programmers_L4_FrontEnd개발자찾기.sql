-- Front End 스킬을 가진 개발자의 정보를 조회
-- 조건에 맞는 개발자의 ID, 이메일, 이름, 성을 조회하는 SQL 문을 작성
-- ID를 기준으로 오름차순

-- 이거 풀다풀다 인터넷 도움 받음 ㅠㅠㅠㅠ
-- 다시 풀어보기!!! (이번주 주말 내로!)

SELECT
    DISTINCT ID,
    EMAIL,
    FIRST_NAME,
    LAST_NAME
FROM DEVELOPERS AS D
    JOIN SKILLCODES AS S 
    ON (S.CODE & D.SKILL_CODE) > 0 
    -- 비트연산. & : 일치해야 1 반환. 스킬 일치해야지 0보다 커짐
WHERE 
    S.CATEGORY = 'Front End'
ORDER BY ID;