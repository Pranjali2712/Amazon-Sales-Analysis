Insights From output

Quick profile for AMAZON_ALL_YEARSALES:	
				
|TOTAL_ROWS| |UNIQUE_ORDERS| |ORDER_ID_NULLS| |ORDER_ID_BAD| |QTY_BAD| |PRICE_BAD|
 185950	      178437	        0	        0	        0	0

|DISTINCT_ORDERID||DISTINCT_PRODUCT||DISTINCT_CITY||DISTINCT_STATE||DISTINCT_CATEGORY|
 178437	            19	                9	        8	        9

|DUPLICATE_COUNT| |AVG_QUANTITY_PERORDER| |AVERAGE_ORDERVALUE|
 7136              1.171724                193.15


#Top 5 Products by Quantity Ordered:

PRODUCT	                  TOTAL_QUANTITYORDERED
AAA Batteries (4-pack)-	  31017
AA Batteries (4-pack)-	  27635
USB-C Charging Cable-	  23975
Lightning Charging Cable-  23217
Wired Headphones-	  20557

#Month on Month Revenue Analysis

MONTH	 TOTAL_REVENUE	PREV_REV	ABSOLUTE_REV
January	  1812742.87		
February  2200078.08	1812742.87	387335.21
March	  2804973.35	2200078.08	604895.27
April	  3389217.98	2804973.35	584244.63
May	  3150616.23	3389217.98	-238601.75
June	  2576280.15	3150616.23	-574336.08
July	  2646461.32	2576280.15	70181.17
August	  2241083.37	2646461.32	-405377.95
September 2094465.69	2241083.37	-146617.68
October	  3734777.86	2094465.69	1640312.17
November  3197875.05	3734777.86	-536902.81
December  4608295.7	3197875.05	1410420.65
January	  8670.29	4608295.7	-4599625.41

#Quarter On Quarter Analysis

YEAR_QUARTER	TOTAL_REVENUE	PREVIOUS_Q_REVENUE	ABSOLUTE_Q_REVENUE
2019-Q1	        6817794.3		
2019-Q2  	9116114.36	6817794.3	        2298320.06
2019-Q3	        6982010.38	9116114.36	       -2134103.98
2019-Q4	        11540948.61	6982010.38	        4558938.23
2020-Q1	        8670.29	        11540948.61	       -11532278.32


#Bottom 5 product by revenue	
PRODUCT	                        TOTAL_REVENUE
Lightning Charging Cable	346376.55
Usb-C Charging Cable	        285975.45
Wired Headphones	        246082.76
Aa Batteries (4-Pack)	        106041.6
Aaa Batteries (4-Pack)	        92648.14

#Top 5 product by revenue	
PRODUCT	                       TOTAL_REVENUE
Macbook Pro Laptop	       8032500
Iphone	                       4792900
Thinkpad Laptop	               4127958.72
Google Phone	               3317400
27in 4k Gaming Monitor	       2433147.61

#Top 5 categories by revenue	
CATEGORY	               TOTAL_REVENUE
Laptop	                       12160458.72
Phone	                       8937500
Monitor	                       6370939.02
Headphones	               3934498.46
Tv	                       1443900

#Bottom 5 categories by revenue	
CATEGORY	               TOTAL_REVENUE
Batteries	               198689.74
Dryer	                       387600
Washing Machine	               399600
Charging Cable	               632352
Tv	                       1443900

#City wise Revenue
CITY	                      TOTAL_REVENUE	RNK
Austin	                      1818044.33	1
Portland	              2319331.94	2
Seattle	                      2745046.02	3
Dallas	                      2765373.96	4
Atlanta	                      2794199.07	5
Boston	                      3658627.65	6
New York City	              4661867.14	7
Los Angeles	              5448304.28	8
San Francisco	              8254743.55	9

#Category Wise % Distribution
CATEGORY	REVENUE	        PCT_CONTRIBUTION
Laptop	        12160458.72	35.28
Phone	        8937500	        25.93
Monitor	        6370939.02	18.48
Headphones	3934498.46	11.42
Tv	        1443900	        4.19
Charging Cable	632352	        1.83
Washing Machine	399600	        1.16
Dryer	        387600	        1.12
Batteries	198689.74	0.58

#### Insights Summary
1. Seasonal peaks observed in Q4 2019-12 with max revenue 4608295.70 (holiday effect).  
2. Category Laptop contributes ~35.28% of total revenue (Pareto).  
3. Accessories show high order frequency but low per-order quantity.  
4. Sales concentrated in New York City, Los Angeles, San Francisco  
