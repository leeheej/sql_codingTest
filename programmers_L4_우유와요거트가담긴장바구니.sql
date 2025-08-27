-- 우유와 요거트를 동시에 구입한 장바구니의 아이디를 조회하는 SQL 문을 작성
-- 장바구니의 아이디 순으로 나와야 합니다.
SELECT
    DISTINCT CART_ID AS CART_ID
FROM 
    CART_PRODUCTS
WHERE
    CART_ID IN
    (SELECT CART_ID FROM CART_PRODUCTS WHERE NAME = 'Yogurt')
    AND
    CART_ID IN
    (SELECT CART_ID FROM CART_PRODUCTS WHERE NAME = 'Milk');
