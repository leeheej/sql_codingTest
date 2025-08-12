-- 코드를 작성해주세요
-- SELECT ROUND(AVG(LENGTH),2) AS AVERAGE_LENGTH
-- FROM (SELECT COALESCE(LENGTH, 10) AS LENGTH
-- FROM FISH_INFO) AS F
-- ;

-- 코드를 작성해주세요
-- SELECT
--     ROUND(AVG(
--         CASE
--             WHEN LENGTH <= 10 THEN 10
--             ELSE LENGTH
--         END
--     ), 2) AS AVERAGE_LENGTH
-- FROM FISH_INFO;
-- null은 변환 안됨. 이 문제 찾느라 오래걸림

-- 코드를 작성해주세요
SELECT
    ROUND(AVG(
        CASE
            WHEN LENGTH <= 10 THEN 10
            WHEN LENGTH IS NULL THEN 10
            ELSE LENGTH
        END
    ), 2) AS AVERAGE_LENGTH
FROM FISH_INFO;