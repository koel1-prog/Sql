-- Identify the top 10 highest-paying Data Analyst jobs in India and retrieve the skills required for those roles.

WITH top_paying_jobs AS(
SELECT 
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN 
    company_dim
ON company_dim.company_id = job_postings_fact.company_id
WHERE 
    job_title_short = 'Data Analyst'
    AND job_location = 'India'
    AND salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills AS skills
FROM top_paying_jobs
LEFT JOIN skills_job_dim
ON top_paying_jobs.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;


-- SQL and Excel are the most frequently required skills, appearing in over 6 job postings each.

-- Python and R follow closely, indicating strong demand for both programming and documentation capabilities.

-- Visualization tools like Tableau and Power BI are also prominent, emphasizing the importance of data storytelling.