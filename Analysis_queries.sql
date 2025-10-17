 Analysis_queries.sql

--total orders, total revenue, Average order value

select count(distinct(order_id)) as total_orders, 
Sum(quantity_ordered *price_each) as Total_revenue,
round(Sum(quantity_ordered *price_each)/count(distinct(order_id)),2) as Average_ordervalue
from amazon_all_yearsales;

desc table amazon_all_yearsales;

--Month on Month revenue Analysis
with monthly_revenue as
(select order_month,sum(quantity_ordered *price_each) as total_revenue
from amazon_all_yearsales
group by order_month
order by order_month)
select 
TO_CHAR(TO_DATE((split_part(order_month,'-',2)), 'MM'), 'MMMM') as month,total_revenue,
lag(total_revenue) over(order by order_month) as prev_rev,
(total_revenue - 
lag(total_revenue) over(order by order_month)) as absolute_rev
from monthly_revenue;

--Quater on Quater Analysis

WITH Quarterly AS (
  SELECT
    order_month,
    LEFT(order_month, 4) || '-' ||
      CASE 
        WHEN RIGHT(order_month, 2) IN ('01','02','03') THEN 'Q1'
        WHEN RIGHT(order_month, 2) IN ('04','05','06') THEN 'Q2'
        WHEN RIGHT(order_month, 2) IN ('07','08','09') THEN 'Q3'
        WHEN RIGHT(order_month, 2) IN ('10','11','12') THEN 'Q4'
      END AS year_quarter,
    SUM(quantity_ordered * price_each) AS total_revenue
  FROM AMAZON_DATA.AMAZON_ALL_YEARSALES
  GROUP BY order_month, year_quarter
)
SELECT
  year_quarter,
  total_revenue,
  LAG(total_revenue) OVER (ORDER BY year_quarter) AS previous_q_revenue,
  total_revenue - LAG(total_revenue) OVER (ORDER BY year_quarter) AS absolute_q_revenue
FROM Quarterly
ORDER BY year_quarter;


WITH Quarterly AS (
  SELECT
    LEFT(order_month, 4) || '-Q' ||
      CASE 
        WHEN RIGHT(order_month, 2) IN ('01','02','03') THEN '1'
        WHEN RIGHT(order_month, 2) IN ('04','05','06') THEN '2'
        WHEN RIGHT(order_month, 2) IN ('07','08','09') THEN '3'
        WHEN RIGHT(order_month, 2) IN ('10','11','12') THEN '4'
      END AS year_quarter,
    SUM(quantity_ordered * price_each) AS total_revenue
  FROM AMAZON_DATA.AMAZON_ALL_YEARSALES
  GROUP BY 1
)
SELECT
  year_quarter,
  total_revenue,
  LAG(total_revenue) OVER (ORDER BY year_quarter) AS previous_q_revenue,
  total_revenue - LAG(total_revenue) OVER (ORDER BY year_quarter) AS absolute_q_revenue
FROM Quarterly
ORDER BY year_quarter;

--Top 5 and bottom 5 products by sales revenue
--bottom 5 
select product , total_revenue 
from(select product, sum(quantity_ordered*price_each) as total_revenue,
dense_rank()over(order by sum(quantity_ordered*price_each)) as rnk
from amazon_all_yearsales
group by product)
where rnk<=5
order by rnk desc;
--top 5
select product , total_revenue 
from(select product, sum(quantity_ordered*price_each) as total_revenue,
dense_rank()over(order by sum(quantity_ordered*price_each)) as rnk
from amazon_all_yearsales
group by product)
order by rnk desc
limit 5;

---top and bottom 5 categories by revenue

select category , total_revenue 
from(select category, sum(quantity_ordered*price_each) as total_revenue,
dense_rank()over(order by sum(quantity_ordered*price_each)) as rnk
from amazon_all_yearsales
group by category)
order by rnk desc
limit 5;

select category , total_revenue 
from(select category, sum(quantity_ordered*price_each) as total_revenue,
dense_rank()over(order by sum(quantity_ordered*price_each)) as rnk
from amazon_all_yearsales
group by category)
order by rnk
limit 5;

--City with Highest Revenue

select city , total_revenue 
from(select city, sum(quantity_ordered*price_each) as total_revenue,
dense_rank()over(order by sum(quantity_ordered*price_each)) as rnk
from amazon_all_yearsales
group by city)
order by rnk desc
limit 1;

---Product Popularity vs Quantity,Revenue

SELECT product, COUNT(DISTINCT order_id) AS total_orders, SUM(quantity_ordered) AS total_qty, 
ROUND(SUM(quantity_ordered)*1.0/COUNT(DISTINCT order_id),2) AS avg_qty_per_order ,
sum(quantity_ordered*price_each) as total_revenue
FROM amazon_all_yearsales
group by product
ORDER BY total_orders DESC;

--Cross-Analysis – Category vs City

SELECT category, city, ROUND(SUM(quantity_ordered * price_each),2) AS total_sales
FROM amazon_all_yearsales 
GROUP BY category, city 
ORDER BY category, total_sales DESC;

--Revenue Contribution %

SELECT category, ROUND(SUM(quantity_ordered * price_each),2) AS revenue, 
ROUND(SUM(quantity_ordered * price_each)*100.0 / SUM(SUM(quantity_ordered * price_each)) OVER (),2) AS pct_contribution 
FROM amazon_all_yearsales
GROUP BY category 
ORDER BY revenue DESC;
--peak hour analysis

SELECT TO_CHAR(order_date,'Day') AS day_of_week, 
EXTRACT(HOUR FROM order_date) AS hour_of_day, COUNT(*) AS orders 
FROM amazon_all_yearsales
GROUP BY 1,2 
ORDER BY orders DESC;

SELECT TO_CHAR(DATE_TRUNC('MONTH', order_date),'YYYY-MM') AS month,
       SUM(price_each * quantity_ordered) AS revenue
FROM AMAZON_DATA.AMAZON_ALL_YEARSALES
GROUP BY 1
ORDER BY revenue DESC
LIMIT 1;