SELECT
    d.visited_on,
    SUM(c.amount) AS amount,
    ROUND(SUM(c.amount) / 7, 2) AS average_amount
FROM (
    SELECT DISTINCT visited_on FROM Customer
) d
JOIN Customer c
ON c.visited_on BETWEEN DATE_SUB(d.visited_on, INTERVAL 6 DAY) AND d.visited_on
GROUP BY d.visited_on
HAVING COUNT(DISTINCT c.visited_on) = 7
ORDER BY d.visited_on;