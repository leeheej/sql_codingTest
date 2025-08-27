-- 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성
-- 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력
-- 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬
SELECT 
    M.MEMBER_NAME,
    R.REVIEW_TEXT,
    R.REVIEW_DATE
FROM MEMBER_PROFILE AS M
    JOIN REST_REVIEW R
    ON M.MEMBER_ID = R.MEMBER_ID
WHERE M.MEMBER_ID IN (
    SELECT MEMBER_ID
    FROM REST_REVIEW
    GROUP BY MEMBER_ID
   )
ORDER BY R.REVIEW_DATE ASC, R.REVIEW_TEXT ASC;