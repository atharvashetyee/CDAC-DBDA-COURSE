1) Hello, Employees (staging CTE)
sql
WITH employees_staging AS (
  SELECT
    employee_id,
    CONCAT(COALESCE(first_name, ''), ' ', last_name) AS full_name,
    job_id,
    department_id,
    salary
  FROM
    employees
)
SELECT
  employee_id,
  full_name,
  job_id,
  department_id,
  salary
FROM
  employees_staging;


2) Department Headcount (include 0)
sql
WITH department_headcount AS (
  SELECT
    department_id,
    COUNT(employee_id) AS headcount
  FROM
    employees
  GROUP BY
    department_id
)
SELECT
  d.department_id,
  d.department_name,
  COALESCE(dh.headcount, 0) AS headcount
FROM
  departments d
  LEFT JOIN department_headcount dh
  ON d.department_id = dh.department_id;
   

3) Avg Salary by Job
sql
WITH job_salaries AS (
  SELECT
    job_id,
    COUNT(employee_id) AS emp_count,
    ROUND(AVG(salary), 2) AS avg_salary
  FROM
    employees
  GROUP BY
    job_id
)
SELECT
  js.job_id,
  j.job_title,
  js.emp_count,
  js.avg_salary
FROM
  job_salaries js
  JOIN jobs j
  ON js.job_id = j.job_id;
   

4) Employee → Manager (1 hop)
sql
WITH employee_names AS (
  SELECT
    employee_id,
    CONCAT(COALESCE(first_name, ''), ' ', last_name) AS full_name,
    manager_id
  FROM
    employees
)
SELECT
  e.employee_id,
  e.full_name AS employee_name,
  e.manager_id,
  m.full_name AS manager_name
FROM
  employee_names e
  LEFT JOIN employee_names m
  ON e.manager_id = m.employee_id;
   

5) Employees Without a Department
sql
WITH employee_details AS (
  SELECT
    employee_id,
    CONCAT(COALESCE(first_name, ''), ' ', last_name) AS full_name,
    job_id,
    department_id
  FROM
    employees
)
SELECT
  employee_id,
  full_name,
  job_id,
  department_id
FROM
  employee_details
WHERE
  department_id IS NULL OR department_id = 0;
   

6) Departments Without Employees
sql
WITH employed_departments AS (
  SELECT DISTINCT
    department_id
  FROM
    employees
)
SELECT
  d.department_id,
  d.department_name
FROM
  departments d
  LEFT JOIN employed_departments ed
  ON d.department_id = ed.department_id
WHERE
  ed.department_id IS NULL;
   

7) Map Employees to Region (clean text)
sql
WITH employee_map AS (
  SELECT
    e.employee_id,
    CONCAT(COALESCE(e.first_name, ''), ' ', e.last_name) AS full_name,
    d.department_name,
    l.city,
    c.country_name,
    TRIM(REPLACE(r.region_name, '\r', '')) AS region_name
  FROM
    employees e
    JOIN departments d
    ON e.department_id = d.department_id
    JOIN locations l
    ON d.location_id = l.location_id
    JOIN countries c
    ON l.country_id = c.country_id
    JOIN regions r
    ON c.region_id = r.region_id
)
SELECT
  employee_id,
  full_name,
  department_name,
  city,
  country_name,
  region_name
FROM
  employee_map;
   

8) Simple Pay-Band Check
sql
WITH employee_pay AS (
  SELECT
    e.employee_id,
    CONCAT(COALESCE(e.first_name, ''), ' ', e.last_name) AS full_name,
    j.job_title,
    e.salary,
    j.min_salary,
    j.max_salary
  FROM
    employees e
    JOIN jobs j
    ON e.job_id = j.job_id
)
SELECT
  employee_id,
  full_name,
  job_title,
  salary,
  min_salary,
  max_salary
FROM
  employee_pay
WHERE
  salary < min_salary OR salary > max_salary;
   

9) Top Earners (overall)
sql
WITH top_earners AS (
  SELECT
    employee_id,
    CONCAT(COALESCE(first_name, ''), ' ', last_name) AS full_name,
    salary
  FROM
    employees
  ORDER BY
    salary DESC
  LIMIT 5
)
SELECT
  employee_id,
  full_name,
  salary
FROM
  top_earners;
   

10) Jobs Present in Each Department
sql
WITH department_job_counts AS (
  SELECT
    department_id,
    job_id,
    COUNT(employee_id) AS employees_in_role
  FROM
    employees
  GROUP BY
    department_id,
    job_id
)
SELECT
  d.department_name,
  j.job_title,
  djc.employees_in_role
FROM
  department_job_counts djc
  JOIN departments d
  ON djc.department_id = d.department_id
  JOIN jobs j
  ON djc.job_id = j.job_id;
   

11) Headcount by Region
sql
WITH regional_employee_map AS (
  SELECT
    e.employee_id,
    COALESCE(TRIM(REPLACE(r.region_name, '\r', '')), 'Unknown') AS region_name
  FROM
    employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN locations l
    ON d.location_id = l.location_id
    LEFT JOIN countries c
    ON l.country_id = c.country_id
    LEFT JOIN regions r
    ON c.region_id = r.region_id
)
SELECT
  region_name,
  COUNT(employee_id) AS headcount
FROM
  regional_employee_map
GROUP BY
  region_name;
   

12) Commission Snapshot
sql
WITH commission_flag AS (
  SELECT
    employee_id,
    department_id,
    CASE
      WHEN commission_pct IS NOT NULL AND commission_pct > 0
      THEN 'Yes'
      ELSE 'No'
    END AS has_commission
  FROM
    employees
)
SELECT
  cf.has_commission,
  d.department_name,
  COUNT(cf.employee_id) AS headcount
FROM
  commission_flag cf
  LEFT JOIN departments d
  ON cf.department_id = d.department_id
GROUP BY
  cf.has_commission,
  d.department_name
ORDER BY
  d.department_name,
  cf.has_commission;
   

13) Employees with Any Job History
sql
WITH history_counts AS (
  SELECT
    employee_id,
    COUNT(*) AS history_row_count
  FROM
    job_history
  WHERE
    employee_id <> 0 -- Exclude dummy row
  GROUP BY
    employee_id
)
SELECT
  e.employee_id,
  CONCAT(COALESCE(e.first_name, ''), ' ', e.last_name) AS full_name,
  hc.history_row_count
FROM
  employees e
  JOIN history_counts hc
  ON e.employee_id = hc.employee_id;
   

14) Latest History Row (gentle)
sql
WITH cleaned_history AS (
  SELECT
    employee_id,
    job_id,
    department_id,
    end_date,
    ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY end_date DESC, start_date DESC) AS rn
  FROM
    job_history
  WHERE
    end_date IS NOT NULL AND end_date > '1900-01-01'
    AND employee_id <> 0 -- Exclude dummy row
)
SELECT
  employee_id,
  job_id AS last_hist_job_id,
  department_id AS last_hist_department_id,
  end_date AS last_hist_end_date
FROM
  cleaned_history
WHERE
  rn = 1;
   

15) Locations per Country
sql
WITH country_location_counts AS (
  SELECT
    country_id,
    COUNT(location_id) AS location_count
  FROM
    locations
  GROUP BY
    country_id
)
SELECT
  clc.country_id,
  COALESCE(c.country_name, 'Unknown') AS country_name,
  clc.location_count
FROM
  country_location_counts clc
  LEFT JOIN countries c
  ON clc.country_id = c.country_id;