-- Top High-Demand and High-Paying Skills for Remote Data Analyst Jobs
WITH skills_demand AS (
    SELECT 
        skills_job_dim.skill_id,
        COUNT(skills_job_dim.job_id) AS skill_count
    FROM job_postings_fact
    LEFT JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY skills_job_dim.skill_id
),
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    LEFT JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY skills_job_dim.skill_id
)

SELECT 
    skills_dim.skills,
    skills_demand.skill_count,
    average_salary.avg_salary
FROM skills_demand
INNER JOIN average_salary
    ON skills_demand.skill_id = average_salary.skill_id
LEFT JOIN skills_dim
    ON skills_dim.skill_id = skills_demand.skill_id
ORDER BY 
    average_salary.avg_salary DESC,
    skills_demand.skill_count DESC
LIMIT 25;



-- High-paying niche skills like PySpark ($208K) and Bitbucket ($189K) are rare (only 2 postings each), but extremely lucrative — showing scarcity drives premium pay.

-- Balanced skills such as Pandas (9 postings, $151K) and Databricks (10 postings, $141K) combine strong demand with solid salaries, making them the most practical career investments.

-- Supporting tools like NumPy, Airflow, Scala, PostgreSQL hold steady relevance with moderate demand (3–5 postings) and salaries in the $122K–143K range, ensuring versatility in remote analytics.
