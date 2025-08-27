-- 코드를 입력하세요
-- 서울에 위치한 식당들의 식당 ID, 식당 이름, 음식 종류, 즐겨찾기수, 주소, 리뷰 평균 점수를 조회하는 SQL문
-- 리뷰 평균점수는 소수점 세 번째 자리에서 반올림 해주시고 결과는 평균점수를 기준으로 내림차순 정렬해주시고, 평균점수가 같다면 즐겨찾기수를 기준으로 내림차순 정렬
SELECT
    R.REST_ID,
    I.REST_NAME,
    I.FOOD_TYPE,
    I.FAVORITES,
    I.ADDRESS,
    ROUND(SUM(R.REVIEW_SCORE) / COUNT(R.MEMBER_ID),2) AS SCORE
FROM 
    REST_INFO AS I
    JOIN
    REST_REVIEW AS R
    USING (REST_ID)
WHERE
    I.ADDRESS LIKE '서울%'
GROUP BY 
    R.REST_ID
ORDER BY 
    SCORE DESC, I.FAVORITES DESC;