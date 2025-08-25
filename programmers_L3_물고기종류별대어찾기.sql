-- 코드를 작성해주세요
-- 물고기 종류 별로 가장 큰 물고기의 ID, 물고기 이름, 길이를 출력
-- 물고기의 ID 컬럼명은 ID, 이름 컬럼명은 FISH_NAME, 길이 컬럼명은 LENGTH
-- 물고기의 ID에 대해 오름차순 정렬
-- 단, 물고기 종류별 가장 큰 물고기는 1마리만 있으며 10cm 이하의 물고기가 가장 큰 경우는 없습니다
SELECT
    A.ID, B.FISH_NAME, A.LENGTH
FROM 
    FISH_INFO AS A
    JOIN
    FISH_NAME_INFO AS B
    USING(FISH_TYPE)
WHERE 
    (B.FISH_NAME, A.LENGTH)
    IN
    (SELECT 
        N.FISH_NAME,
        MAX(I.LENGTH) AS LENGTH
    FROM 
        FISH_INFO AS I
        JOIN
        FISH_NAME_INFO AS N
        USING(FISH_TYPE)
    GROUP BY N.FISH_NAME)
ORDER BY 1;

-- 지피티의 윈도우 함수 버전 공부하기
SELECT 
    I.ID,
    N.FISH_NAME,
    I.LENGTH
FROM (
    SELECT 
        I.*,
        RANK() OVER (PARTITION BY FISH_TYPE ORDER BY LENGTH DESC) AS rnk
    FROM FISH_INFO I
) I
JOIN FISH_NAME_INFO N
    USING(FISH_TYPE)
WHERE rnk = 1
ORDER BY I.ID;