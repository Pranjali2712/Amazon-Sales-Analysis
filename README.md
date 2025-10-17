# Amazon-Sales-Analysis
SQL-based Data Analysis project (Ingestion → Profiling → Cleaning → EDA) using Snowflake.
# Amazon Sales Analysis (SQL Project)

This project covers the complete SQL data pipeline:
**Data Ingestion → Profiling → Cleaning → Exploratory Data Analysis (EDA)**  
Built and tested on **Snowflake SQL** using an Amazon-style sales dataset (2019).

---

### 📁 Project Structure
| Stage | File | Description |
|--------|------|--------------|
| 1️⃣ Data Ingestion | `create_ingest.sql` | Create database, schema, and import CSV data |
| 2️⃣ Data Profiling | `Data_profiling_queries.sql`, `Data_Profiling_Report.md` | Assess data health — nulls, duplicates, consistency |
| 3️⃣ Data Cleaning | `Data_cleaning_queries.sql`, `Data_Cleaning_Report.md` | Remove duplicates, fix blanks, standardize formats |
| 4️⃣ EDA | `Analysis_queries.sql`, `Exploratory_Data_Analysis_Report.md` | Analyze sales trends, top products, regions, and time patterns |

---

### 🔍 Key Metrics
- Total rows: **185,950**
- Unique Orders: **178,437**
- Fully Duplicates Removed: **264**
- Duplicate Order IDs: **7,513**
- Dataset: `amazon_all_yearsales'

---

### 💡 Insights Summary
- Q4 months show peak sales (holiday season).  
- Accessories are top-selling by volume; Phones by revenue.  
- Most orders placed between **10 AM–2 PM** and **7 PM–9 PM**.  
- Major sales regions **New York City**, **Los Angeles**,**San Francisco**

---

### 🧰 Tools Used
- **Snowflake SQL**
- **Excel (data source)**
- **GitHub** for version control
- **Power BI (for visualization later)**

---

### 📫 Author
**Pranjali Mishra**  
[LinkedIn](#) | [GitHub](#)
www.linkedin.com/in/pranjali-093bb1168
https://github.com/Pranjali2712
---
