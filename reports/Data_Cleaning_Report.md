Data_Cleaning_Report.md

## Stage 3 — Data Cleaning & Preparation

### Objective
Ensure dataset is consistent, complete, and free of duplicates for analysis.

### Steps Performed
1. Removed 264 fully duplicate rows  
2. Instead of Deduplication of 7,513 duplicate Order_ID entries kept them as Duplicate Order_IDs were reviewed              
   during data profiling and confirmed to represent multi-item orders. No action required — data retained as-is.
3. Standardized missing/blank fields  
4. Cleaned city/state formatting  
5. Verified data types and created new derived columns (month, year)

### Output Table
created backup table cleaned and then replaced 
`amazon_all_yearsales` — Clean dataset for analysis.

### Validation Check
- Deleted only exact duplicates
- No nulls or blanks remain in critical columns  
- City–State pairs consistent  
- Record count after cleaning: <185686>
