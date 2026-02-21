# Credit Card Default Risk Analysis (BigQuery + Looker Studio)
![SQL](https://img.shields.io/badge/SQL-BigQuery-blue?style=flat&logo=googlebigquery)
![GCP](https://img.shields.io/badge/Google%20Cloud-BigQuery-orange?style=flat&logo=googlecloud)
![Dashboard](https://img.shields.io/badge/Visualization-Looker%20Studio-yellow?style=flat&logo=googleanalytics)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat)

## 📌 Project Overview

This is a portfolio project developed as the **Capstone for the Google Data Analytics Professional Certificate**, focused on a common financial problem: **credit card default risk**.

The project simulates a real-world scenario where financial institutions need to analyze customer data to identify risk signals and support credit decision-making.

---

## 🧠 Problem Context

Financial institutions face significant losses when clients default on credit payments. Analyzing historical customer data helps identify **early warning signals** and **risk patterns**.

This project answers questions such as:

- What proportion of clients default?  
- Is recent payment behavior (`PAY_0`) a strong indicator of risk?  
- Does credit limit alone indicate safer clients?

---

## 🛠️ Tools Used

- **Google BigQuery (SQL)** — data cleaning, validation, and queries  
- **Looker Studio** — dashboard and visualization  
- **GitHub** — version control and portfolio

---

## ⚙️ Features / Workflow

1. **Data Loading & Preparation**  
   - Imported CSV into BigQuery  
   - Verified row counts and variable ranges  
   - Standardized values for `AGE`, `EDUCATION`, and `MARRIAGE`  

2. **Data Cleaning**  
   - Created a `clean` table to preserve raw data  
   - Checked for invalid or extreme values  
   - Prepared dataset for analysis  

3. **Analysis**  
   - Calculated default rates (`default_next_month`)  
   - Analyzed relationship between recent delay (`PAY_0`) and default  
   - Explored impact of credit limit on default risk  

4. **Visualization**  
   - Built a Looker Studio dashboard with:
     - Client distribution by default status  
     - Default rate by recent payment delay (`PAY_0`)  
     - Average credit limit by default status  

5. **Insights & Recommendations**  
   - Recent payment delays (`PAY_0`) are the strongest risk indicator  
   - Credit limit alone is not sufficient to assess risk  
   - Suggested risk segmentation:
     - `PAY_0 ≤ 0` → low risk  
     - `PAY_0 = 1` → moderate risk  
     - `PAY_0 ≥ 2` → high risk

---

## 🚀 How to Run

1. Access the dataset: [UCI Credit Card Dataset](https://www.kaggle.com/datasets/uciml/default-of-credit-card-clients-dataset)  
2. Import the CSV into Google BigQuery  
3. Run SQL scripts:
   - `scripts/create_credit_clean.sql` — create clean table  
   - `scripts/validation_checks.sql` — check data quality  
   - `scripts/analysis_querys.sql` — run analysis  
4. Visualize results in Looker Studio dashboard: [Dashboard Link](https://lookerstudio.google.com/reporting/0c12d3aa-3b5b-438f-81d1-2e146bae5de8)

---

## 📈 Key Learnings

- Working with **cloud-based SQL** in BigQuery  
- Data cleaning and validation for large datasets  
- Translating business questions into measurable metrics  
- Creating actionable dashboards for non-technical stakeholders  
- Understanding real-world credit risk concepts  

---

## ⚠️ Limitations

- Dataset is from **Taiwan (2005)**; results may not generalize to other regions  
- Extreme `PAY_0` values have few clients, which may skew default rates  
- No income or credit score data available, limiting predictive potential

---

## 👤 Author

**Kauan Sarzi da Rocha**  
- [![LinkedIn](https://img.shields.io/badge/LinkedIn-Kauan%20Sarzi-0077B5?style=flat&logo=linkedin)](https://linkedin.com/in/kauan-sarzi)
- [![Email](https://img.shields.io/badge/Email-kauansarzi24@gmail.com-D14836?style=flat&logo=gmail)](mailto:kauansarzi24@gmail.com)
