CREATE DATABASE employees;
SELECT * FROM employee_performance;
-- DATA CLEANING
-- CEK TIPE DATA
DESC employee_performance;

-- CEK JUMLAH DATA
SELECT COUNT(*) Jumlah_data  FROM employee_performance;

-- CEK DUPLIKAT
SELECT Employee_ID, COUNT(*) Jumlah
FROM employee_performance
GROUP  BY Employee_ID
HAVING Jumlah > 1; -- TIDAK ADA DATA DUPLIKAT

-- CEK MISSING VALUES
SELECT
SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS missing_department,
SUM(CASE WHEN Job_Title IS NULL THEN 1 ELSE 0 END) AS missing_job_title,
SUM(CASE WHEN Monthly_Salary IS NULL THEN 1 ELSE 0 END) AS missing_salary,
SUM(CASE WHEN Performance_Score IS NULL THEN 1 ELSE 0 END) AS missing_performance
FROM employee_performance;

-- CEK STRING KOSONG
SELECT *
FROM employee_performance
WHERE Department = ''
OR Job_Title = '';

-- CEK OUTLIER SALARY
SELECT
MIN(Monthly_Salary),
MAX(Monthly_Salary),
AVG(Monthly_Salary)
FROM employee_performance;

SELECT DISTINCT Department
FROM employee_performance;

SELECT DISTINCT Resigned
FROM employee_performance;


-- TOTAL EMPLOYEES 
SELECT COUNT(*) AS total_employees FROM employee_performance;

-- Total RESIGNED
SELECT COUNT(Resigned) as total_resigned
FROM employee_performance
WHERE Resigned = 'True';

-- Total Active
SELECT COUNT(Resigned) as total_resigned
FROM employee_performance
WHERE Resigned = 'False';

-- AVG SALARY
SELECT AVG(Monthly_Salary) AS Average_Salary
FROM employee_performance;

-- AVG Years_at_company
SELECT ROUND(AVG(Years_At_Company),2) as AVG_YEARS
FROM employee_performance;

-- AVG SATISFACTION SCORE
SELECT AVG(Employee_Satisfaction_score) AS Average_Satisfaction_Score
FROM employee_performance;

-- EMPLOYEE BY DEPARTMENT
SELECT Count(Employee_ID) employee, department
FROM employee_performance
GROUP BY DEPARTMENT
ORDER BY employee DESC;

-- GENDER DISTRIBUTION
SELECT COUNT(Employee_ID) employee, Gender
FROM employee_performance
GROUP BY Gender
ORDER BY employee DESC;

-- ATTRITION BY DEPARTMENT
SELECT COUNT(Employee_ID) Employee, Department, Resigned
FROM employee_performance
GROUP BY Department, Resigned
Order by Employee DESC;

-- AVG OVERTIME VS SATISFACTION SCORE
SELECT Department, ROUND(AVG(Overtime_Hours),2) AS AVG_Overtime,
ROUND(AVG(Employee_Satisfaction_Score),2) AS AVG_Satisfaction
FROM employee_performance
GROUP BY Department
Order By Department;

-- AVG TRAINING HOURS VS PERFORMANCE
SELECT Department, ROUND(AVG(Training_Hours),2) AS AVG_Training_Hours,
ROUND(AVG(Performance_Score),2) AS AVG_Performance
FROM employee_performance
GROUP BY Department
Order By Department;



-- PERFORMANCE BY DEPARTMENT 
SELECT Department, Round(AVG(Performance_Score),2) AS avg_performance
FROM employee_performance
GROUP BY 1
ORDER BY avg_performance DESC;

-- PERFORMANCE BY JOB TITLES
SELECT Job_Title, Round(AVG(Performance_Score),2) AS avg_performance
FROM employee_performance
GROUP BY 1
ORDER BY avg_performance DESC;


-- TRAINING HOURS PERFORMANCE
SELECT
Training_Hours,
ROUND(AVG(Performance_Score),2)
FROM employee_performance
GROUP BY Training_Hours
ORDER BY 1 DESC;

SELECT
ROUND(AVG(Overtime_Hours),2),
ROUND(AVG(Performance_Score),2)
FROM employee_performance;

SELECT
Team_Size,
ROUND(AVG(Performance_Score),2)
FROM employee_performance
GROUP BY Team_Size;

SELECT
Department,
COUNT(*) AS resigned_employee
FROM employee_performance
WHERE Resigned='True'
GROUP BY Department
ORDER BY resigned_employee DESC;


SELECT
Education_Level,
COUNT(*)
FROM employee_performance
WHERE Resigned='True'
GROUP BY Education_Level;

SELECT
Years_At_Company,
COUNT(*)
FROM employee_performance
WHERE Resigned='True'
GROUP BY Years_At_Company
ORDER BY Years_At_Company;

SELECT
Employee_Satisfaction_Score,
COUNT(*)
FROM employee_performance
WHERE Resigned='True'
GROUP BY Employee_Satisfaction_Score;

SELECT
Department,
ROUND(AVG(Projects_Handled),2) AS avg_projects,
ROUND(AVG(Performance_Score),2) AS avg_performance
FROM employee_performance
GROUP BY Department;

SELECT
Remote_Work_Frequency,
ROUND(AVG(Performance_Score),2)
FROM employee_performance
GROUP BY Remote_Work_Frequency;

SELECT
Work_Hours_Per_Week,
ROUND(AVG(Performance_Score),2)
FROM employee_performance
GROUP BY Work_Hours_Per_Week;