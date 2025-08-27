-- 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성
-- 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력
-- 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬
SELECT 
    M.MEMBER_NAME,
    R.REVIEW_TEXT,
    DATE_FORMAT(R.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM 
    REST_REVIEW AS R
    JOIN 
    MEMBER_PROFILE M 
    USING(MEMBER_ID)
WHERE 
    R.MEMBER_ID IN (
        SELECT MEMBER_ID
        FROM REST_REVIEW
        GROUP BY MEMBER_ID
        HAVING COUNT(*) = 
            (SELECT MAX(REVIEW_COUNT)
            FROM 
                (SELECT 
                    COUNT(*) AS REVIEW_COUNT
                FROM 
                    REST_REVIEW
                GROUP BY 
                    MEMBER_ID) AS COUNT_TABLE
            )
        )
ORDER BY 3,2;