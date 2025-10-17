Create_tables.sql

--Create database
CREATE DATABASE IF NOT EXISTS ecommerce_db;

-- Create schema
CREATE SCHEMA IF NOT EXISTS ecommerce_schema;
--Create Table
CREATE OR REPLACE TABLE Customers (
Customer_ID VARCHAR,
Gender VARCHAR,
Age INT,
Married BOOLEAN,
State VARCHAR,
Number_of_Referrals INT,
Tenure_in_Months INT,
Value_Deal VARCHAR,
Phone_Service BOOLEAN,
Multiple_Lines BOOLEAN,
Internet_Service BOOLEAN,
Internet_Type VARCHAR,
Online_Security BOOLEAN,
Online_Backup BOOLEAN,
Device_Protection_Plan BOOLEAN,
Premium_Support BOOLEAN,
Streaming_TV BOOLEAN,
Streaming_Movies BOOLEAN,
Streaming_Music BOOLEAN,
Unlimited_Data BOOLEAN,
Contract VARCHAR,
Paperless_Billing BOOLEAN,
Payment_Method VARCHAR,
Monthly_Charge DECIMAL(10,2),
Total_Charges DECIMAL(10,2),
Total_Refunds DECIMAL(10,2),
Total_Extra_Data_Charges DECIMAL(10,2),
Total_Long_Distance_Charges DECIMAL(10,2),
Total_Revenue DECIMAL(10,2),
Customer_Status VARCHAR,
Churn_Category VARCHAR,
Churn_Reason VARCHAR
);

--Create schema
Create schema If not exists Amazon_Data;

--Create table
Create Table Amazon_all_yearsales(
Order_ID INT,
Product STRING,
Quantity_Ordered INT,
Price_Each DECIMAL(10,2),
Order_Date TIMESTAMP,
City STRING,
State STRING,
Category STRING
);

Create OR REPLACE Table Sales_February_2019(
Order_ID VARCHAR,
Product VARCHAR,
Quantity_Ordered VARCHAR,
Price_Each VARCHAR,
Order_Date VARCHAR,
Purchase_Address VARCHAR
);

Create OR REPLACE Table Sales_January_2019(
Order_ID VARCHAR,
Product VARCHAR,
Quantity_Ordered VARCHAR,
Price_Each VARCHAR,
Order_Date VARCHAR,
Purchase_Address VARCHAR
);

TRUNCATE TABLE SALES_FEBRUARY_2019;

Create Table Sales_March_2019(
Order_ID INT,
Product STRING,
Quantity_Ordered INT,
Price_Each DECIMAL(10,2),
Order_Date TIMESTAMP,
Purchase_Address STRING
);
Create Table Sales_April_2019(
Order_ID INT,
Product STRING,
Quantity_Ordered INT,
Price_Each DECIMAL(10,2),
Order_Date TIMESTAMP,
Purchase_Address STRING
);
Create Table Sales_May_2019(
Order_ID INT,
Product STRING,
Quantity_Ordered INT,
Price_Each DECIMAL(10,2),
Order_Date TIMESTAMP,
Purchase_Address STRING
);
Create Table Sales_June_2019(
Order_ID INT,
Product STRING,
Quantity_Ordered INT,
Price_Each DECIMAL(10,2),
Order_Date TIMESTAMP,
Purchase_Address STRING
);
Create Table Sales_July_2019(
Order_ID INT,
Product STRING,
Quantity_Ordered INT,
Price_Each DECIMAL(10,2),
Order_Date TIMESTAMP,
Purchase_Address STRING
);
Create Table Sales_August_2019(
Order_ID INT,
Product STRING,
Quantity_Ordered INT,
Price_Each DECIMAL(10,2),
Order_Date TIMESTAMP,
Purchase_Address STRING
);
Create Table Sales_September_2019(
Order_ID INT,
Product STRING,
Quantity_Ordered INT,
Price_Each DECIMAL(10,2),
Order_Date TIMESTAMP,
Purchase_Address STRING
);
Create Table Sales_October_2019(
Order_ID INT,
Product STRING,
Quantity_Ordered INT,
Price_Each DECIMAL(10,2),
Order_Date TIMESTAMP,
Purchase_Address STRING
);
Create Table Sales_November_2019(
Order_ID INT,
Product STRING,
Quantity_Ordered INT,
Price_Each DECIMAL(10,2),
Order_Date TIMESTAMP,
Purchase_Address STRING
);
Create Table Sales_December_2019(
Order_ID INT,
Product STRING,
Quantity_Ordered INT,
Price_Each DECIMAL(10,2),
Order_Date TIMESTAMP,
Purchase_Address STRING
);
