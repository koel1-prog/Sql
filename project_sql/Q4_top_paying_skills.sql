-- Top 25 Highest-Paying Skills for Remote Data Analyst Jobs
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
LEFT JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;


--  PySpark tops the chart with the highest average salary of $208K, followed by Bitbucket and Couchbase.

--  ML and data science tools like DataRobot, Jupyter, Pandas, and NumPy consistently offer salaries above $140K.

--  DevOps, cloud, and programming skills — including GitLab, Golang, Kubernetes, and Swift — are highly valued in remote roles.