Data_cleaning_queries.sql


SELECT * 
FROM amazon_all_yearsales 
GROUP BY ALL 
HAVING COUNT(*) > 1;

create table amazon_all_yearsalesdup as
select * from amazon_all_yearsales;

select count(*) from amazon_all_yearsales;
select count(*) from amazon_all_yearsalesdup;

CREATE or replace TABLE amazon_all_yearsales AS
SELECT *
FROM (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY
             Order_ID, Product, Quantity_Ordered, Price_Each,
             Order_Date, City, State, Category
           ORDER BY Order_ID
         ) AS rn
  FROM amazon_all_yearsales
) t
WHERE rn = 1;

SELECT COUNT(*) FROM amazon_all_yearsales;
SELECT COUNT(*) FROM amazon_all_yearsales_dedup;

drop table amazon_all_yearsalesdup;
drop table AMAZON_ALL_YEARSALES_DEDUP;

---now this query has produced 0 results which means exact duplicates are deleted.
SELECT * 
FROM amazon_all_yearsales 
GROUP BY ALL 
HAVING COUNT(*) > 1;

ALTER TABLE amazon_all_yearsales 
ALTER COLUMN order_date 
SET DATA TYPE TIMESTAMP;

desc table sales_january_2019

select count(*) from sales_january_2019
where order_id like '%id%';

ALTER TABLE sales_january_2019
ADD COLUMN order_date_ts TIMESTAMP_NTZ;

UPDATE sales_january_2019
SET order_date_ts = TRY_TO_TIMESTAMP_NTZ(order_date, 'MM/DD/YY HH24:MI');

SELECT order_date, order_date_ts
FROM sales_january_2019
WHERE order_date_ts IS NULL AND order_date IS NOT NULL
LIMIT 100;

UPDATE sales_january_2019
SET order_date_ts = TRY_TO_TIMESTAMP_NTZ(order_date, 'YYYY-MM-DD HH24:MI:SS')
WHERE order_date_ts IS NULL
  AND TRY_TO_TIMESTAMP_NTZ(order_date, 'YYYY-MM-DD HH24:MI:SS') IS NOT NULL;

UPDATE sales_january_2019
SET order_date_ts =
  COALESCE(
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date), 'MM/DD/YYYY HH24:MI'),
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date), 'MM/DD/YYYY'),
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date), 'MM/DD/YY HH24:MI'),
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date), 'MM/DD/YY'),
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date))          -- Snowflake's best-effort parser
  )
WHERE order_date_ts IS NULL; 

SELECT order_id, order_date
FROM sales_january_2019
WHERE order_date_ts IS NULL
  AND order_date IS NOT NULL
LIMIT 100;

CREATE OR REPLACE TABLE sales_january_2019_bkp AS
SELECT * FROM sales_january_2019;
  
SELECT *
FROM sales_january_2019
WHERE 
    TRIM(LOWER(order_id)) IN ('order id', 'order_id')
 OR TRIM(LOWER(product)) IN ('product')
 OR TRIM(LOWER(quantity_ordered)) IN ('quantity ordered', 'quantity_ordered')
 OR TRIM(LOWER(price_each)) IN ('price each', 'price_each')
 OR TRIM(LOWER(order_date)) IN ('order date', 'order_date')
 OR TRIM(LOWER(purchase_address)) IN ('purchase address', 'purchase_address');

 DELETE FROM sales_january_2019
WHERE 
    TRIM(LOWER(order_id)) IN ('order id', 'order_id')
 OR TRIM(LOWER(product)) IN ('product')
 OR TRIM(LOWER(quantity_ordered)) IN ('quantity ordered', 'quantity_ordered')
 OR TRIM(LOWER(price_each)) IN ('price each', 'price_each')
 OR TRIM(LOWER(order_date)) IN ('order date', 'order_date')
 OR TRIM(LOWER(purchase_address)) IN ('purchase address', 'purchase_address');


UPDATE sales_january_2019
SET order_date_ts =
  COALESCE(
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date), 'MM/DD/YYYY HH24:MI'),
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date), 'MM/DD/YYYY'),
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date), 'MM/DD/YY HH24:MI'),
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date), 'MM/DD/YY'),
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date))  -- fallback
  )
WHERE order_date_ts IS NULL;

SELECT order_id, order_date
FROM sales_january_2019
WHERE order_date_ts IS NULL
  AND order_date IS NOT NULL
LIMIT 200;

ALTER TABLE sales_january_2019 DROP COLUMN order_date;
ALTER TABLE sales_january_2019 RENAME COLUMN order_date_ts TO order_date;

CREATE OR REPLACE TABLE sales_february_2019_bkp AS
SELECT * FROM sales_february_2019;
  
SELECT *
FROM sales_february_2019
WHERE 
    TRIM(LOWER(order_id)) IN ('order id', 'order_id')
 OR TRIM(LOWER(product)) IN ('product')
 OR TRIM(LOWER(quantity_ordered)) IN ('quantity ordered', 'quantity_ordered')
 OR TRIM(LOWER(price_each)) IN ('price each', 'price_each')
 OR TRIM(LOWER(order_date)) IN ('order date', 'order_date')
 OR TRIM(LOWER(purchase_address)) IN ('purchase address', 'purchase_address');

 DELETE FROM sales_february_2019
WHERE 
    TRIM(LOWER(order_id)) IN ('order id', 'order_id')
 OR TRIM(LOWER(product)) IN ('product')
 OR TRIM(LOWER(quantity_ordered)) IN ('quantity ordered', 'quantity_ordered')
 OR TRIM(LOWER(price_each)) IN ('price each', 'price_each')
 OR TRIM(LOWER(order_date)) IN ('order date', 'order_date')
 OR TRIM(LOWER(purchase_address)) IN ('purchase address', 'purchase_address');
 
ALTER TABLE  sales_february_2019
ADD COLUMN order_date_ts TIMESTAMP_NTZ;

UPDATE sales_february_2019
SET order_date_ts =
  COALESCE(
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date), 'MM/DD/YYYY HH24:MI'),
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date), 'MM/DD/YYYY'),
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date), 'MM/DD/YY HH24:MI'),
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date), 'MM/DD/YY'),
    TRY_TO_TIMESTAMP_NTZ(TRIM(order_date))  -- fallback
  )
WHERE order_date_ts IS NULL;

SELECT order_id, order_date
FROM sales_february_2019
WHERE order_date_ts IS NULL
  AND order_date IS NOT NULL
LIMIT 200;

desc table sales_february_2019;

ALTER TABLE sales_february_2019 DROP COLUMN order_date;
ALTER TABLE sales_february_2019 RENAME COLUMN order_date_ts TO order_date;

UPDATE amazon_all_yearsales
SET 
    product = INITCAP(TRIM(product)),
    city = INITCAP(TRIM(city)),
    state = INITCAP(TRIM(state)),
    category = INITCAP(TRIM(category));


ALTER TABLE amazon_all_yearsales
ADD COLUMN order_month STRING; 
UPDATE amazon_all_yearsales
SET order_month = TO_CHAR(order_date, 'YYYY-MM');

select order_month from amazon_all_yearsales;

select count(*) from amazon_all_yearsales;



