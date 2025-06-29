# Write your MySQL query statement below
select e.unique_id, emp.name
From Employees emp
left join employeeUNI e
on emp.id = e.id;