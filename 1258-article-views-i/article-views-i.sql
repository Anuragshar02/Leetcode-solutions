# Write your MySQL query statement below
select distinct author_id As id
from views 
where author_id = viewer_id
order by id;