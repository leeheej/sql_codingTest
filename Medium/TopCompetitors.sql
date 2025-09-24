-- Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
-- Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge.
-- Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
-- If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

SELECT 
    HK.HACKER_ID,
    HK.NAME
FROM 
    Hackers HK
    JOIN
    (SELECT
        S.HACKER_ID,
        COUNT(DISTINCT(S.CHALLENGE_ID)) CNT
    FROM 
        Submissions S 
        JOIN
        Challenges C
        USING (CHALLENGE_ID)
        JOIN
        Difficulty D
        USING (DIFFICULTY_LEVEL)
    WHERE
        S.SCORE = D.SCORE
    GROUP BY
        S.HACKER_ID
    HAVING 
        COUNT(DISTINCT(S.CHALLENGE_ID)) > 1
    ) WHO
    ON HK.HACKER_ID = WHO.HACKER_ID
ORDER BY
    WHO.CNT DESC,
    HK.HACKER_ID;