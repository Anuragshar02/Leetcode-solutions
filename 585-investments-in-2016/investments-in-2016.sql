# Write your MySQL query statement below
SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM 
    Insurance i
WHERE 
    -- Same tiv_2015 as at least one other
    EXISTS (
        SELECT 1 FROM Insurance
        WHERE tiv_2015 = i.tiv_2015 AND pid != i.pid
    )
    -- Unique (lat, lon)
    AND NOT EXISTS (
        SELECT 1 FROM Insurance
        WHERE lat = i.lat AND lon = i.lon AND pid != i.pid
    );