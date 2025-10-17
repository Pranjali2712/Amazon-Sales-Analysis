Data_profiling_queries.sql

--Information about schema
SHOW TABLES IN SCHEMA ECOMMERCE_DB.AMAZON_DATA;

SELECT TABLE_NAME, ROW_COUNT, CREATED
FROM ECOMMERCE_DB.INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'AMAZON_DATA';

SELECT TABLE_NAME,COLUMN_NAME,DATA_TYPE, IS_NULLABLE, ORDINAL_POSITION
FROM ECOMMERCE_DB.INFORMATION_SCHEMA.columns
WHERE TABLE_SCHEMA = 'AMAZON_DATA'
ORDER BY TABLE_NAME;

--Basic info check

select count(*)as total_rows
from amazon_all_yearsales;

Select 
count(distinct(order_id)) as Distinct_orderid,
count(distinct(product)) as Distinct_Product,
count(distinct(city)) as Distinct_city,
count(distinct(state)) as Distinct_state,
count(distinct(category)) as Distinct_category
from amazon_all_yearsales;

Select 
Min(order_date) as First_orderdate,
max(order_date) as last_orderdate
from amazon_all_yearsales;

Select 
min(price_each) as Minimum_price,
max(price_each) as Maximum_price
from amazon_all_yearsales;

--Finding duplicates in all ways

select order_id , count(*) As order_count
FROM AMAZON_ALL_YEARSALES
GROUP BY ORDER_ID
HAVING order_count >1

SELECT COUNT(*) as Duplicate_count
from(
select order_id
from amazon_all_yearsales
group by order_id
having count(*)>1
);

SELECT COUNT(*) as Duplicate_count
from(
select order_id
from sales_january_2019
group by order_id
having count(*)>1
);

select * from amazon_all_yearsales
where order_id IN(
select order_id 
from amazon_all_yearsales
group by order_id
having count(*)>1
)
order by order_id;

select Count(product) 
from amazon_all_yearsales
where product = 'USB-C Charging Cable'

select count(*)as all_duplicate_count
from
(select *, count(*)
from amazon_all_yearsales
group by all
having count(*)>1
);

SELECT 
*, COUNT(*) AS dup_count
FROM amazon_all_yearsales
GROUP BY ALL
HAVING COUNT(*) > 1
order by order_id;

----exact duplicates value
SELECT *
FROM amazon_all_yearsales
WHERE (Order_ID, Product, Quantity_Ordered, Price_Each, Order_Date, City, State, Category) IN (
  SELECT *
  FROM amazon_all_yearsales
  GROUP BY ALL
  HAVING COUNT(*) > 1
)
ORDER BY Order_ID;

select count(*) from(
SELECT *,
row_number() over(partition by order_id order by order_id) as rnk
FROM amazon_all_yearsales)
where rnk>1;

--Finding Nulls
select count(*)
from amazon_all_yearsales
where order_id is null;

SELECT *
FROM amazon_all_yearsales
WHERE order_id IS NULL
   OR product IS NULL
   OR quantity_ordered IS NULL
   OR price_each IS NULL
   OR order_date IS NULL
   OR city IS NULL
   OR state IS NULL
   OR category IS NULL;

select
sum(case when order_id is null then 1 else 0 end) as null_order,
sum(case when product is null then 1 else 0 end) as null_product,
sum(case when QUANTITY_ORDERED is null then 1 else 0 end) as null_QUANTITY_ORDERED,
sum(case when PRICE_EACH is null then 1 else 0 end) as null_PRICE_EACH,
sum(case when ORDER_DATE is null then 1 else 0 end) as null_ORDER_DATE,
sum(case when CITY is null then 1 else 0 end) as null_CITY,
sum(case when STATE is null then 1 else 0 end) as null_STATE,
sum(case when CATEGORY is null then 1 else 0 end) as null_CATEGORY
from amazon_all_yearsales;


select
sum(case when trim(order_id) = ' ' then 1 else 0 end) as Blank_orders,
sum(case when trim(Product) = ' ' then 1 else 0 end) as Blank_Product,
sum(case when trim(Category) = ' ' then 1 else 0 end) as Blank_Category
from AMAZON_ALL_YEARSALES;

--Logical checks
select * from amazon_all_yearsales
where QUANTITY_ORDERED <=0;

select * from amazon_all_yearsales
where price_each<=0;

select city, count(distinct(state)) as Distinct_statecount
from amazon_all_yearsales
where city is not null and state is not null
group by city
having count(distinct state)>1
order by distinct_statecount desc;

--top 5 products by quantity sold

select product,
sum(Quantity_ordered) as Total_quantityordered,
from amazon_all_yearsales
group by product
order by Total_quantityordered desc
limit 5;

select product,Total_quantityordered,rnk
from
(select product,
sum(quantity_ordered) as Total_quantityordered,
dense_rank()over(order by sum(quantity_ordered)desc) as rnk
from amazon_all_yearsales
group by product)
where rnk<=5;
--average quantity per order
select 
sum(quantity_ordered)/count(distinct(order_id)) as avg_quantity_perorder
from amazon_all_yearsales;

select city,Total_quantityordered,rnk
from
(select city,
sum(quantity_ordered) as Total_quantityordered,
dense_rank()over(order by sum(quantity_ordered)desc) as rnk
from amazon_all_yearsales
group by city)
where rnk<=5;

select min(price_each) as MIN_price,
max(price_each) as MAX_PRICE
from amazon_all_yearsales;



