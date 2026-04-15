CREATE DATABASE hospital_db;

USE hospital_db;

Rename table `hospital er_data` to hospital_er_data;

select * from hospital_er_data limit 10;

DESCRIBE hospital_er_data;

ALTER TABLE hospital_er_data 
RENAME COLUMN `ï»¿Patient Id` TO patient_id;

ALTER TABLE hospital_er_data 
RENAME COLUMN `Patient Admission Date` TO admission_date;

ALTER TABLE hospital_er_data 
RENAME COLUMN `Patient First Inital` TO first_name;

ALTER TABLE hospital_er_data 
RENAME COLUMN `Patient Last Name` TO last_name;

ALTER TABLE hospital_er_data 
RENAME COLUMN `Patient Gender` TO gender;

ALTER TABLE hospital_er_data 
RENAME COLUMN `Patient Age` TO age;

ALTER TABLE hospital_er_data 
RENAME COLUMN `Patient Race` TO race;

ALTER TABLE hospital_er_data 
RENAME COLUMN `Department Referral` TO department_referral;

ALTER TABLE hospital_er_data 
RENAME COLUMN `Patient Admission Flag` TO admission_flag;

ALTER TABLE hospital_er_data 
RENAME COLUMN `Patient Satisfaction Score` TO satisfaction_score;

ALTER TABLE hospital_er_data 
RENAME COLUMN `Patient Waittime` TO wait_time;

ALTER TABLE hospital_er_data 
RENAME COLUMN `Patients CM` TO cm;

DESCRIBE hospital_er_data;

-- 1 What is the total number of patients?
SELECT COUNT(*) AS total_patients
FROM hospital_er_data;

-- 2 How many patients are there by gender?
SELECT gender, COUNT(*) AS total_patients
FROM hospital_er_data
GROUP BY gender;

-- 3 What is the distribution of patients by race?
SELECT race, COUNT(*) AS total_patients
FROM hospital_er_data
GROUP BY race
ORDER BY total_patients DESC;

-- 4 What is the average age of patients?
SELECT AVG(age) AS average_age
FROM hospital_er_data;

-- 5 How many patients were admitted vs not admitted?
SELECT admission_flag, COUNT(*) AS total_patients
FROM hospital_er_data
GROUP BY admission_flag;

-- 6 How many patients visited each department?
SELECT department_referral, COUNT(*) AS total_patients
FROM hospital_er_data
GROUP BY department_referral
ORDER BY total_patients DESC;

-- 7 What is the average wait time for each department?
SELECT 
    department_referral, 
    ROUND(AVG(wait_time), 2) AS avg_wait_time
FROM hospital_er_data
GROUP BY department_referral
ORDER BY avg_wait_time DESC;

-- 8 What is the average satisfaction score for each department?
SELECT 
    department_referral, 
    ROUND(AVG(satisfaction_score), 2) AS avg_satisfaction
FROM hospital_er_data
GROUP BY department_referral
ORDER BY avg_satisfaction DESC;

-- 9 Which are the top 5 busiest departments?
SELECT 
    department_referral, 
    COUNT(*) AS total_patients
FROM hospital_er_data
GROUP BY department_referral
ORDER BY total_patients DESC
LIMIT 5;

-- 10 How many patients visited the ER each day?
SELECT 
    admission_date, 
    COUNT(*) AS total_patients
FROM hospital_er_data
GROUP BY admission_date
ORDER BY admission_date;

-- 11 What is the monthly trend of patient visits?
SELECT 
    MONTH(admission_date) AS month,
    COUNT(*) AS total_patients
FROM hospital_er_data
GROUP BY month
ORDER BY month;

-- 12 Which day of the week has the highest number of visits?
SELECT 
    DAYNAME(admission_date) AS day,
    COUNT(*) AS total_patients
FROM hospital_er_data
GROUP BY day
ORDER BY total_patients DESC;

-- 13 What are the top 10 highest wait times?
SELECT 
    patient_id, 
    wait_time
FROM hospital_er_data
ORDER BY wait_time DESC
LIMIT 10;

-- 14 What is the average wait time by age group?
SELECT 
    CASE 
        WHEN age < 18 THEN 'Child'
        WHEN age BETWEEN 18 AND 60 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group,
    ROUND(AVG(wait_time), 2) AS avg_wait_time
FROM hospital_er_data
GROUP BY age_group
ORDER BY avg_wait_time DESC;

-- 15 How many patients fall into different wait time categories (Low, Medium, High)?
SELECT 
    CASE 
        WHEN wait_time < 20 THEN 'Low'
        WHEN wait_time BETWEEN 20 AND 40 THEN 'Medium'
        ELSE 'High'
    END AS wait_category,
    COUNT(*) AS total_patients
FROM hospital_er_data
GROUP BY wait_category
ORDER BY total_patients DESC;

-- 16 What is the overall average satisfaction score?
SELECT ROUND(AVG(satisfaction_score), 2) AS avg_satisfaction
FROM hospital_er_data;

-- 17 How does wait time impact satisfaction score?
SELECT 
    wait_time,
    ROUND(AVG(satisfaction_score), 2) AS avg_satisfaction
FROM hospital_er_data
GROUP BY wait_time
ORDER BY wait_time;

-- 18 How does wait time impact satisfaction score?
SELECT 
    wait_time,
    ROUND(AVG(satisfaction_score), 2) AS avg_satisfaction
FROM hospital_er_data
GROUP BY wait_time
ORDER BY wait_time;

-- 19 Which departments have the lowest satisfaction scores?
SELECT 
    department_referral, 
    ROUND(AVG(satisfaction_score), 2) AS avg_satisfaction
FROM hospital_er_data
GROUP BY department_referral
ORDER BY avg_satisfaction ASC;

-- 20 What is the distribution of patients by age group (Child, Adult, Senior)?
SELECT 
    CASE 
        WHEN age < 18 THEN 'Child'
        WHEN age BETWEEN 18 AND 60 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS total_patients
FROM hospital_er_data
GROUP BY age_group
ORDER BY total_patients DESC;

-- 21 How does gender distribution vary across departments?
SELECT 
    department_referral,
    gender,
    COUNT(*) AS total_patients
FROM hospital_er_data
GROUP BY department_referral, gender
ORDER BY department_referral, total_patients DESC;

-- 22 What is the race distribution across departments?
SELECT 
    department_referral,
    race,
    COUNT(*) AS total_patients
FROM hospital_er_data
GROUP BY department_referral, race
ORDER BY department_referral, total_patients DESC;

-- 23 Rank patients based on wait time (highest to lowest)
SELECT 
    patient_id,
    wait_time,
    RANK() OVER (ORDER BY wait_time DESC) AS wait_rank
FROM hospital_er_data;
