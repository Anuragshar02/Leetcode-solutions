# Write your MySQL query statement below
SELECT
    IFNULL(MAX(num), NULL) AS num
FROM
    (
        SELECT
            num
        FROM
            MyNumbers
        GROUP BY
            num
        HAVING
            COUNT(*) = 1
    ) AS singles;