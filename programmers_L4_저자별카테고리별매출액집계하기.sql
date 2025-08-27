-- 코드를 입력하세요
-- 2022년 1월의 도서 판매 데이터를 기준으로 저자 별, 카테고리 별 매출액(TOTAL_SALES = 판매량 * 판매가) 
-- 저자 ID(AUTHOR_ID), 저자명(AUTHOR_NAME), 카테고리(CATEGORY), 매출액(SALES) 리스트를 출력
-- 저자 ID를 오름차순으로, 저자 ID가 같다면 카테고리를 내림차순 정렬
SELECT
    A.AUTHOR_ID, 
    A.AUTHOR_NAME,
    B.CATEGORY,
    SUM(B.PRICE * S.SALES) AS TOTAL_SALES
FROM 
    BOOK AS B
    JOIN
    AUTHOR AS A
    USING (AUTHOR_ID)
    JOIN
    BOOK_SALES AS S
    USING (BOOK_ID)
WHERE DATE_FORMAT(S.SALES_DATE, '%Y-%m') = '2022-01'
GROUP BY 
    A.AUTHOR_ID, B.CATEGORY
ORDER BY 
    1, 3 DESC;