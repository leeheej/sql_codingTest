-- You are given three tables: Students, Friends and Packages. 
-- Students contains two columns: ID and Name. 
-- Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
-- Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
-- Write a query to output the names of those students whose best friends got offered a higher salary than them. 
-- Names must be ordered by the salary amount offered to the best friends. 
-- -It is guaranteed that no two students got same salary offer.

SELECT
    S.NAME
FROM
    STUDENTS S JOIN PACKAGES P USING(ID)
    JOIN FRIENDS F USING(ID)
    JOIN STUDENTS SS ON F.FRIEND_ID = SS.ID
    JOIN PACKAGES PP ON SS.ID = PP.ID
WHERE
    P.SALARY < PP.SALARY
ORDER BY
    PP.SALARY
; 