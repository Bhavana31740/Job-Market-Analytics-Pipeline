-- =========================================================
-- JOB MARKET ANALYTICS - SQL ANALYSIS
-- =========================================================


-- 1. TOP 20 MOST DEMANDED JOB TITLES
SELECT
    title,
    COUNT(*) AS job_count
FROM jobs
GROUP BY title
ORDER BY job_count DESC
LIMIT 20;


-- 2. TOP 20 HIRING LOCATIONS
SELECT
    location,
    COUNT(*) AS job_count
FROM jobs
GROUP BY location
ORDER BY job_count DESC
LIMIT 20;


-- 3. AVERAGE SALARY BY JOB TITLE
SELECT
    title,
    COUNT(*) AS job_count,
    ROUND(AVG("averageSalary")::numeric, 2) AS avg_salary
FROM jobs
WHERE "averageSalary" > 0
GROUP BY title
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC
LIMIT 20;


-- 4. TOP COMPANIES HIRING
SELECT
    "companyName",
    COUNT(*) AS job_count
FROM jobs
WHERE "companyName" <> 'Unknown'
GROUP BY "companyName"
ORDER BY job_count DESC
LIMIT 20;


-- 5. SALARY RANGE BY JOB TITLE
SELECT
    title,
    COUNT(*) AS job_count,
    ROUND(AVG("salaryRange")::numeric, 2) AS avg_salary_range
FROM jobs
WHERE "salaryRange" > 0
GROUP BY title
HAVING COUNT(*) >= 10
ORDER BY avg_salary_range DESC
LIMIT 20;


-- 6. EXPERIENCE REQUIREMENT ANALYSIS
SELECT
    "minimumExperience",
    COUNT(*) AS job_count
FROM jobs
WHERE "minimumExperience" > 0
GROUP BY "minimumExperience"
ORDER BY "minimumExperience";


-- 7. JOBS BY EXPERIENCE LEVEL
SELECT
    CASE
        WHEN "minimumExperience" = 0 THEN 'Fresher'
        WHEN "minimumExperience" BETWEEN 1 AND 2 THEN '1-2 Years'
        WHEN "minimumExperience" BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN "minimumExperience" BETWEEN 6 AND 10 THEN '6-10 Years'
        WHEN "minimumExperience" > 10 THEN '10+ Years'
        ELSE 'Unknown'
    END AS experience_level,
    COUNT(*) AS job_count
FROM jobs
GROUP BY experience_level
ORDER BY job_count DESC;


-- 8. JOBS REQUIRING THE MOST SKILLS
SELECT
    title,
    COUNT(*) AS job_count,
    ROUND(AVG("skillCount")::numeric, 2) AS avg_skill_count
FROM jobs
WHERE "skillCount" > 0
GROUP BY title
HAVING COUNT(*) >= 10
ORDER BY avg_skill_count DESC
LIMIT 20;


-- 9. DATA QUALITY CHECK
SELECT
    COUNT(*) AS total_jobs,
    COUNT(*) FILTER (
        WHERE title = 'Unknown'
    ) AS missing_titles,
    COUNT(*) FILTER (
        WHERE "companyName" = 'Unknown'
    ) AS missing_companies,
    COUNT(*) FILTER (
        WHERE "averageSalary" = 0
    ) AS jobs_without_salary,
    COUNT(*) FILTER (
        WHERE "minimumExperience" = 0
    ) AS jobs_without_experience
FROM jobs;


-- 10. DUPLICATE JOB ID CHECK
SELECT
    COUNT(*) - COUNT(DISTINCT "jobId") AS duplicate_job_ids
FROM jobs;


-- 11. SALARY ANALYSIS BY LOCATION
SELECT
    location,
    COUNT(*) AS job_count,
    ROUND(AVG("averageSalary")::numeric, 2) AS avg_salary
FROM jobs
WHERE "averageSalary" > 0
GROUP BY location
HAVING COUNT(*) >= 10
ORDER BY avg_salary DESC
LIMIT 20;


-- 12. MOST DEMANDED SKILLS
SELECT
    TRIM(skill) AS skill,
    COUNT(*) AS demand_count
FROM jobs,
LATERAL unnest(string_to_array("tagsAndSkills", ',')) AS skill
WHERE "tagsAndSkills" <> 'Unknown'
  AND TRIM(skill) <> ''
GROUP BY TRIM(skill)
ORDER BY demand_count DESC
LIMIT 20;

-- 13. JOB DEMAND BY CURRENCY
SELECT
    currency,
    COUNT(*) AS job_count
FROM jobs
GROUP BY currency
ORDER BY job_count DESC;


-- 14. JOBS BY POSTING RECENCY
SELECT
    "jobUploaded",
    COUNT(*) AS job_count
FROM jobs
GROUP BY "jobUploaded"
ORDER BY job_count DESC;


-- 15. TOP 20 JOB TITLES WITH BOTH DEMAND AND SALARY
SELECT
    title,
    COUNT(*) AS job_count,
    ROUND(AVG("averageSalary")::numeric, 2) AS avg_salary
FROM jobs
WHERE "averageSalary" > 0
GROUP BY title
HAVING COUNT(*) >= 10
ORDER BY job_count DESC, avg_salary DESC
LIMIT 20;