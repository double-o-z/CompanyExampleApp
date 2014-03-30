SELECT YEAR(MIN(start_date)), MONTH(MIN(start_date)) FROM employees;

SELECT * from (SELECT YEAR(start_date) as yearr, MONTH(start_date) as monthh 
				from employees join positions WHERE employees.position = positions.id 
				GROUP BY YEAR(start_date), MONTH(start_date)) all_dates join employees WHERE yearr = YEAR(start_date);