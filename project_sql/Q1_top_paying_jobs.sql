-- Top 10 highest-paying Data Analyst jobs in India with company details

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name

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
LIMIT 10;


-- The highest-paying role is Senior Business & Data Analyst at $119,250/year (Deutsche Bank).

-- Other top-paying jobs include Sr. Enterprise Data Analyst ($118,140/year, ACA Group) and HR Data Operations Analyst ($104,550/year, Clarivate).

-- Entry-level or specialized roles like IT Data Analytic Architect (Merck Group) and Data Analyst I (Bristol Myers Squibb) offer lower salaries in the $64k–71k range.

-- Overall, analyst roles dominate the dataset, with salaries ranging from $64k to $119k.