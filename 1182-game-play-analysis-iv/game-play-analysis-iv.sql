SELECT 
    ROUND(
        COUNT(DISTINCT next_day.player_id) / COUNT(DISTINCT first_login.player_id),
        2
    ) AS fraction
FROM
    (SELECT player_id, MIN(event_date) AS first_login_date
     FROM Activity
     GROUP BY player_id) first_login
LEFT JOIN
    Activity next_day
ON
    first_login.player_id = next_day.player_id
    AND DATEDIFF(next_day.event_date, first_login.first_login_date) = 1;