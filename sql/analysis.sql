-- ============================================
-- JOB MARKET ANALYTICS - SQL ANALYSIS
-- ============================================


-- 1. Most demanded job titles
SELECT
    title,
    COUNT(*) AS job_count
FROM jobs
GROUP BY title
ORDER BY job_count DESC
LIMIT 10;


-- 2. Top hiring locations
SELECT
    location,
    COUNT(*) AS job_count
FROM jobs
GROUP BY location
ORDER BY job_count DESC
LIMIT 10;


-- 3. Average salary by job title
SELECT
    title,
    ROUND(AVG("averageSalary")::numeric, 2) AS average_salary
FROM jobs
WHERE "averageSalary" > 0
GROUP BY title
ORDER BY average_salary DESC
LIMIT 10;


-- 4. Companies with the highest number of job postings
SELECT
    "companyName",
    COUNT(*) AS job_count
FROM jobs
WHERE "companyName" <> 'Unknown'
GROUP BY "companyName"
ORDER BY job_count DESC
LIMIT 10;


-- 5. Salary ranges by job title
SELECT
    title,
    MIN("minimumSalary") AS minimum_salary,
    MAX("maximumSalary") AS maximum_salary
FROM jobs
WHERE "maximumSalary" > 0
GROUP BY title
ORDER BY maximum_salary DESC
LIMIT 10;


-- 6. Experience requirements
SELECT
    "minimumExperience",
    "maximumExperience",
    COUNT(*) AS job_count
FROM jobs
WHERE "minimumExperience" > 0
GROUP BY "minimumExperience", "maximumExperience"
ORDER BY job_count DESC
LIMIT 10;


-- 7. Jobs by experience level
SELECT
    CASE
        WHEN "minimumExperience" = 0 THEN 'Fresher'
        WHEN "minimumExperience" BETWEEN 1 AND 2 THEN '1-2 Years'
        WHEN "minimumExperience" BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN "minimumExperience" BETWEEN 6 AND 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS experience_level,
    COUNT(*) AS job_count
FROM jobs
GROUP BY experience_level
ORDER BY job_count DESC;


-- 8. Most frequently required skills
SELECT
    TRIM(skill) AS skill,
    COUNT(*) AS demand
FROM jobs,
LATERAL regexp_split_to_table("tagsAndSkills", ',') AS skill
WHERE "tagsAndSkills" <> 'Unknown'
GROUP BY TRIM(skill)
ORDER BY demand DESC
LIMIT 20;


-- 9. Average salary by location

SELECT
    location,
    ROUND(AVG("averageSalary")::numeric, 2) AS average_salary
FROM jobs
WHERE "averageSalary" > 0
GROUP BY location
ORDER BY average_salary DESC
LIMIT 10;

-- 10. Job posting recency
SELECT
    "jobUploaded",
    COUNT(*) AS job_count
FROM jobs
GROUP BY "jobUploaded"
ORDER BY job_count DESC;


-- 11. Job demand by currency
SELECT
    currency,
    COUNT(*) AS job_count
FROM jobs
GROUP BY currency
ORDER BY job_count DESC;


-- 12. Jobs without salary information
SELECT
    COUNT(*) AS jobs_without_salary
FROM jobs
WHERE "averageSalary" = 0;


-- 13. Jobs without experience information
SELECT
    COUNT(*) AS jobs_without_experience
FROM jobs
WHERE "minimumExperience" = 0;


-- 14. Overall dataset summary
SELECT
    COUNT(*) AS total_jobs,
    COUNT(DISTINCT "jobId") AS unique_job_ids,
    COUNT(DISTINCT title) AS unique_job_titles,
    COUNT(DISTINCT location) AS unique_locations,
    COUNT(DISTINCT "companyName") AS unique_companies
FROM jobs;