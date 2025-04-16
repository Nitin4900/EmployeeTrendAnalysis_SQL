CREATE TABLE employee_trends (
    emp_no INT PRIMARY KEY,
    gender VARCHAR(10),
    marital_status VARCHAR(20),
    age_band VARCHAR(10),
    age INT,
    department VARCHAR(50),
    education VARCHAR(50),
    education_field VARCHAR(50),
    job_role VARCHAR(50),
    business_travel VARCHAR(50),
    employee_count INT,
    attrition VARCHAR(10),
    attrition_label VARCHAR(50),
    job_satisfaction INT,
    active_employee INT
);

Select * from employee_trends LIMIT 5;

--- 1. Count the number of employees in each department---
SELECT department, COUNT(*) AS employee_count
FROM employee_trends
GROUP BY department;

--- 2.Calculate the average age for each department ---
SELECT department, AVG(age) AS average_age
FROM employee_trends
GROUP BY department;

---- 3. Identify the most common job roles in each department ---
SELECT department, job_role, COUNT(*) AS role_count
FROM employee_trends
GROUP BY department, job_role
ORDER BY department, role_count DESC;

--- 4. Calculate the average job satisfaction for each education level ---
SELECT education, AVG(job_satisfaction) AS average_satisfaction
FROM employee_trends
GROUP BY education;

--- 5.Determine the average age for employees with different levels of job satisfaction ---
SELECT job_satisfaction, AVG(age) AS average_age
FROM employee_trends
GROUP BY job_satisfaction;

--- 6. Calculate the attrition rate for each age band --
SELECT age_band, SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS attrition_rate
FROM employee_trends
GROUP BY age_band;

--- 7. Identify the departments with the highest and lowest average job satisfaction ---
SELECT department, AVG(job_satisfaction) AS average_satisfaction
FROM employee_trends
GROUP BY department
ORDER BY average_satisfaction DESC, department
LIMIT 1;

--- 8. Find the age band with the highest attrition rate among employees with a specific education level---
SELECT education, age_band, SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS attrition_rate
FROM employee_trends
GROUP BY education, age_band
ORDER BY attrition_rate DESC
LIMIT 1;

--- 9.Find the education level with the highest average job satisfaction among employees who travel frequently ---
SELECT education, AVG(job_satisfaction) AS average_satisfaction
FROM employee_trends
WHERE business_travel = 'Travel_Frequently'
GROUP BY education
ORDER BY average_satisfaction DESC
LIMIT 5;

--- 10. Identify the age band with the highest average job satisfaction among married employees ----
SELECT age_band, AVG(job_satisfaction) AS average_satisfaction
FROM employee_trends
WHERE marital_status = 'Married'
GROUP BY age_band
ORDER BY average_satisfaction DESC
LIMIT 1;

--- 11. Calculate Average Job Satisfaction and Average Age by Department ---
SELECT 
    department, 
    AVG(job_satisfaction) AS avg_job_satisfaction, 
    AVG(age) AS avg_age
FROM employee_trends
GROUP BY department;

--- 12. Count Employees by Gender within Each Department ---
SELECT 
    department, 
    gender, 
    COUNT(*) AS gender_count
FROM employee_trends
GROUP BY department, gender;

--- 13. Calculate the Attrition Rate for Each Department ---
SELECT 
    department, 
    (SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS attrition_rate
FROM employee_trends
GROUP BY department;

--- 15. Determine Total Employees Versus Active Employees by Department ---
SELECT 
    department, 
    COUNT(*) AS total_employees,
    SUM(active_employee) AS active_employees
FROM employee_trends
GROUP BY department;

--- 16. Identify the Top 3 Job Roles with the Highest Average Age ---
SELECT 
    job_role, 
    AVG(age) AS average_age
FROM employee_trends
GROUP BY job_role
ORDER BY average_age DESC
LIMIT 3;

--- 17. Group Analysis by Marital Status: Average Job Satisfaction, Average Age, and Employee Count ---
SELECT 
    marital_status, 
    AVG(job_satisfaction) AS avg_job_satisfaction, 
    AVG(age) AS avg_age,
    COUNT(*) AS total_employees
FROM employee_trends
GROUP BY marital_status;

--- 18. Ratio of Active Versus Inactive Employees by Age Band ---
SELECT 
    age_band, 
    SUM(active_employee) AS active_count,
    COUNT(*) - SUM(active_employee) AS inactive_count
FROM employee_trends
GROUP BY age_band;

--- 19. Calculate Attrition Rate for Departments with Low Job Satisfaction ---
-- Assuming a threshold (e.g., job_satisfaction <= 2 indicates low satisfaction)
SELECT 
    department, 
    (SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS attrition_rate_low_satisfaction
FROM employee_trends
WHERE job_satisfaction <= 2
GROUP BY department
ORDER BY attrition_rate_low_satisfaction DESC;

--- 20. Analyze the Distribution of Employees Across Age Bands and Education Levels ---
SELECT 
    age_band, 
    education, 
    COUNT(*) AS employee_count
FROM employee_trends
GROUP BY age_band, education
ORDER BY age_band, education;

