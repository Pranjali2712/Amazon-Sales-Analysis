Data Profiling Report — Sales Dataset (Snowflake)

## Overview
- Total Rows: 185950
- Columns: 8
- Date Range: 2019-01-01 to 2020-01-01 
- Source: CSV (E-commerce sales data)

## Completeness Summary(Missing Data)
| Column           | Null Count | % Null | Observation       |
| Order_ID         | 0          | 0.00%  | No missing values |
| Product          | 0          | 0.00%  | No missing values |
| Quantity_Ordered | 0          | 0.00%  | Complete.         |
| Price_Each       | 0          | 0.00%  | Complete.         |
| City             | 0          | 0.00%  | Complete.         |
| State            | 0          | 0.00%  | Complete.         |
| Category         | 0          | 0.00%  | No missing values |

## Uniqueness
- Total Rows: 185 950  
- Distinct Order_IDs: 178 437  
- 7513 extra rows beyond the first occurrence of each Order_ID  
- 7136 Order_IDs appear more than once (key-level duplicates)  
- 264 fully duplicate rows (identical across all columns)

## Validity
- 0 records with Quantity_Ordered = 0  
- 0 negative Price_Each  
- All City-State mappings valid only portland appeared in two states.

## Statistical Summary
- Price Range: ₹2.99 – ₹1700.00  
- Avg Quantity per Order: 1.171724
- Top 5 Products by quantity sold 
AAA Batteries (4-pack)
AA Batteries (4-pack)
USB-C Charging Cable
Lightning Charging Cable
Wired Headphones

## Key Findings
Data is mostly clean and consistent with minor duplicate values.

## Cleaning Plan
- Remove duplicate orders  
- Delete invalid quantity rows  
- Fill missing Category with 'Miscellaneous'
