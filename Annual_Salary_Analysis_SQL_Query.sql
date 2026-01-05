show databases;
use world;
show tables;
select count(*) from `copy of salary survey 2021 excel project`;
select * from `copy of salary survey 2021 excel project`;

#Question number 1
select avg( `Annual Salary Fixed`) as avg_salary, Industry, Gender
from `copy of salary survey 2021 excel project`
group by Industry, Gender;

#Question number 2
SELECT 
    SUM(`Annual Salary Fixed`) AS Total_salary,
    SUM(`Additional Compensation 2`) AS Total_bonus,
    SUM(`Annual Salary Fixed` + `Additional Compensation 2`) AS Total_compensation,
    `Job Title`
FROM `copy of salary survey 2021 excel project`
GROUP BY `Job Title`;

#Question number 3 
select sum(`Annual Salary Fixed`), min(`Annual Salary Fixed`), max(`Annual Salary Fixed`), `Highest Level of Education Completed`
from `copy of salary survey 2021 excel project`
group by `Highest Level of Education Completed`;

#Question number 4
select count(*) as Total_employee_count, Industry, `Years of Professional Experience Overall`, `Years of Professional Experience in Field`
from `copy of salary survey 2021 excel project`
group by Industry, `Years of Professional Experience Overall`, `Years of Professional Experience in Field`;

#Question number 6
select max(`Annual Salary Fixed`) as max_salary, Job Title, Country
from  `copy of salary survey 2021 excel project`
group by `Job Title`, Country;

SELECT Country, `Job Title`, high_avg_salary
FROM (
    SELECT Country, `Job Title`,
           AVG(`Annual Salary Fixed`) AS high_avg_salary,
           RANK() OVER (PARTITION BY Country ORDER BY AVG(`Annual Salary Fixed`) DESC) rnk
    FROM  `copy of salary survey 2021 excel project`
    GROUP BY Country, `Job Title`
) t
WHERE rnk = 1;
#Question number 7
select avg(`Annual Salary Fixed`) as avg_salary, City, Industry
from `copy of salary survey 2021 excel project`
group by City, Industry;

#Question number 8
SELECT 
    Gender,ROUND(100.0 * SUM(CASE WHEN `Additional Compensation 2` > 0 THEN 1 ELSE 0 END) / COUNT(*),2) AS percentage_of_add_comp
FROM `copy of salary survey 2021 excel project`
GROUP BY Gender;

#Question number 9
SELECT 
    SUM(`Annual Salary Fixed`) AS Total_salary,
    SUM(`Additional Compensation 2`) AS Total_bonus,
    SUM(`Annual Salary Fixed` + `Additional Compensation 2`) AS Total_compensation,
    `Job Title`, `Years of Professional Experience Overall`, `Years of Professional Experience in Field`
    
    FROM  `copy of salary survey 2021 excel project`
GROUP BY `Job Title`, `Years of Professional Experience Overall`, `Years of Professional Experience in Field`

    ;

#Question number 10
select avg(`Annual Salary Fixed`) as avg_salary, Industry, Gender, `Highest Level of Education Completed`
FROM `copy of salary survey 2021 excel project`
group by Industry, Gender, `Highest Level of Education Completed`;