-- Top 10 Most In-Demand Skills for Data Analyst Jobs in India
SELECT 
    skills,
    count(skills_job_dim.job_id) AS skill_count
FROM job_postings_fact
LEFT JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND  job_country = 'India'
GROUP BY skills
ORDER BY skill_count DESC
LIMIT 10;

-- SQL is the most dominant skill, appearing in over 3,000 job postings — a must-have for any data analyst.

-- Python and Excel are nearly tied for second place, showing strong demand for both programming and spreadsheet proficiency.

-- Visualization tools like Tableau and Power BI are essential for data storytelling.

-- Statistical tools (R, SAS) remain highly relevant, especially in traditional analytics and research-heavy roles.