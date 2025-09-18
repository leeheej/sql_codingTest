-- You did such a great job helping Julia with her last coding contest challenge 
-- that she wants you to work on this one, too!

-- The total score of a hacker is the sum of their maximum scores for all of the challenges. 
-- Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
-- If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
-- Exclude all hackers with a total score of 0 from your result.

SELECT
    M.HACKER_ID,
    M.NAME,
    SUM(MAX_SCORE) TOTAL_SCORE
FROM
    (SELECT
        S.HACKER_ID,
        H.NAME,
        S.CHALLENGE_ID,
        MAX(S.SCORE) MAX_SCORE
    FROM
        SUBMISSIONS S
        JOIN
        HACKERS H 
        USING(HACKER_ID)
    GROUP BY
        S.HACKER_ID, H.NAME, S.CHALLENGE_ID
    ) M
GROUP BY
    M.HACKER_ID, M.NAME
HAVING 
    SUM(M.MAX_SCORE) > 0 
ORDER BY
    TOTAL_SCORE DESC,
    M.HACKER_ID
;

    