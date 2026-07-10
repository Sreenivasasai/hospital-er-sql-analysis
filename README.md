#  Hospital ER Data Analysis using SQL

##  Project Overview

This project focuses on analyzing Hospital Emergency Room (ER) data using SQL to understand patient flow, department performance, wait times, and patient satisfaction.

The goal is to extract meaningful insights from raw data and evaluate hospital efficiency using real-world analytical queries.


##  Dataset Description

The dataset contains information about:

* Patient demographics (age, gender, race)
* Admission details
* Department referrals
* Wait time
* Satisfaction scores

Each record represents a single patient visit to the emergency room.



##  Objectives

* Analyze patient distribution
* Evaluate department workload
* Measure wait time performance
* Study patient satisfaction
* Identify trends over time


##  Tools Used

* MySQL Workbench
* SQL (Structured Query Language)


##  Analysis Performed

###  Basic Analysis

* Total number of patients
* Gender distribution
* Race distribution
* Average patient age

###  Department Analysis

* Patients per department
* Top 5 busiest departments
* Average wait time per department
* Satisfaction score per department

###  Time-Based Analysis

* Daily patient visits
* Monthly trends
* Busiest day of the week

###  Performance Analysis

* Top 10 highest wait times
* Wait time categories (Low, Medium, High)

###  Satisfaction Analysis

* Overall satisfaction score
* Impact of wait time on satisfaction
* Departments with lowest satisfaction

###  Patient Segmentation

* Age group distribution
* Gender vs department analysis
* Race vs department analysis

###  Advanced SQL

* Ranking patients based on wait time
* Window functions


##  Key Insights

* Majority of patients belong to the **adult age group**
* Certain departments handle a **higher patient load**
* **Higher wait times lead to lower patient satisfaction**
* Some departments show **longer delays**, indicating inefficiencies
* Peak patient visits occur on specific **days and months**
* Departments with high wait times tend to have **lower satisfaction scores**


##  Conclusion

This project demonstrates how SQL can be used to analyze real-world healthcare data. The analysis highlights key performance issues such as wait times and workload distribution, which directly impact patient satisfaction.

The insights generated can help improve hospital operations and enhance patient experience.



##  Project Structure

* `Hospital_ER_Data.csv` → Raw dataset
* `hospital_er_sql_analysis.sql` → All SQL queries
* `README.md` → Project documentation


##  Future Enhancements

* Create dashboard using Power BI / Tableau
* Add predictive analysis using Machine Learning
* Optimize queries for large-scale data



##  Author

Peddainty Sreenivasa Sai
