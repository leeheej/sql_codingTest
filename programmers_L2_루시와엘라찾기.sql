-- 코드를 입력하세요
SELECT 
    ANIMAL_ID, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty');

-- WHERE NAME REGEXP 'Lucy|Ella|Pickle|Rogan|Sabrina|Mitty';

-- 엥? 이건 왜 틀린거야??? 왜 오답??
-- in : 정확하게 일치하는걸 찾음
-- REGEXP : 포함되어있는지 (부분 일치) 찾음
-- 그래도 결과 동일한데???왜징?