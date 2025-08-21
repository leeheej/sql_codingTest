-- 코드를 작성해주세요
-- 지피티의 도움 받아서 비트연산에서 & 해서 자릿수가 일치하는지로 해당 스킬이 있는지 확인할 수 있음 참고!!!!!!우와아아ㅏㅏㅏ
-- 실무에서 필요한 스킬이겠죠
-- 와 엄청 똑똑해 저런 생각을 하다니
SELECT
    D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
FROM DEVELOPERS D
    JOIN SKILLCODES S
    ON (D.SKILL_CODE & S.CODE) = S.CODE
    -- ON에 단순히 일치여부가 아니라 이렇게 수식 조건을 넣을 
WHERE S.NAME IN ('Python', 'C#')
GROUP BY D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
ORDER BY D.ID;