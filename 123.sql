SELECT YEAR(MIN(start_date)), MONTH(MIN(start_date)) FROM employees;

SELECT * from (SELECT DATE_FORMAT(start_date, '%Y-%m-01 00:00:00') as datee
				from employees join positions WHERE employees.position = positions.id 
				GROUP BY DATE_FORMAT(start_date, '%Y-%m-01 00:00:00')) all_dates;


SELECT datee, SUM(salary) from (SELECT DATE_FORMAT(start_date, '%Y-%m-01 00:00:00') as datee 
				from employees join positions WHERE employees.position = positions.id 
				GROUP BY DATE_FORMAT(start_date, '%Y-%m-01 00:00:00')) all_dates join employees join positions WHERE start_date <= datee AND (end_date is null OR end_date >= datee + interval 1 month) AND employees.position = positions.id GROUP BY datee;


SELECT DATE_FORMAT(DATE_ADD(timestamp_column, INTERVAL 30 MINUTE),'%Y-%m-%d %H:00:00') FROM table