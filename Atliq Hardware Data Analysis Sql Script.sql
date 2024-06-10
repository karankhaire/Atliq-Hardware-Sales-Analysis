use sales;

show tables;

select * from customers;
select * from date;
select * from markets;
select * from products;
select * from transactions;

# a) Total revenue
select sum(sales_qty * sales_amount) as total_revenue
from transactions;

# b) Total products sold
select sum(sales_qty) as total_products_sold
from transactions;

# c) Total customers
select distinct count(*) total_customers from customers;


# 1) Top5 performing markets by revenue
select markets_name,sum(sales_qty * sales_amount) as market_revenue
from markets as m 
join transactions as t on m.market_code = t.market_code
group by markets_name
order by market_revenue desc
limit 5;

# 2) 5 low performing markets by revenue
select markets_name,sum(sales_qty * sales_amount) as market_revenue
from markets as m 
join transactions as t on m.market_code = t.market_code
group by markets_name
order by market_revenue
limit 5;

# 3) zone-wise revenue
select zone,sum(sales_qty * sales_amount) as zone_revenue
from markets as m 
join transactions as t on m.market_code = t.market_code
group by zone
order by zone_revenue desc;

# 4) Top 5 selling products
select product_code, sum(sales_qty) as total_products_sold
from transactions
group by product_code
order by total_products_sold desc
limit 5;

# 5) Products sold market wise (Top 5)
select markets_name, sum(sales_qty) as marketwise_products_sold
from markets as m
join transactions as t on m.market_code = t.market_code
group by markets_name
order by marketwise_products_sold desc
limit 5;

# 6) Products sold market wise (Bottom 5)
select markets_name, sum(sales_qty) as marketwise_products_sold
from markets as m
join transactions as t on m.market_code = t.market_code
group by markets_name
order by marketwise_products_sold
limit 5;

# 7) Products sold zone wise
select zone, sum(sales_qty) as zonewise_products_sold
from markets as m
join transactions as t on m.market_code = t.market_code
group by zone
order by zonewise_products_sold desc;

# 8) Customerwise Revenue (Top 5)
select custmer_name, sum(sales_qty * sales_amount) as customerwise_revenue from customers as c
join transactions as t
on c.customer_code = t.customer_code
group by custmer_name
order by customerwise_revenue desc
limit 5;

# 9) Customerwise Revenue (Bottom 5)
select custmer_name, sum(sales_qty * sales_amount) as customerwise_revenue from customers as c
join transactions as t
on c.customer_code = t.customer_code
group by custmer_name
order by customerwise_revenue
limit 5;

# 10) Revnue breakdown by customer type
select customer_type, sum(sales_qty * sales_amount) as customer_type_revenue
from customers as c
join transactions as t on c.customer_code = t.customer_code
group by customer_type
order by customer_type_revenue desc;

# 11) Revenue trend
select year,month_name, sum(sales_qty * sales_amount) as revenue_trend
from date as d 
join transactions as t on d.date = t.order_date
group by year,month_name
order by year;

# 12) Year-wise revenue
select year, sum(sales_qty * sales_amount) as yearwise_revenue
from date as d 
join transactions as t on d.date = t.order_date
group by year
order by year;

# 13) Products sold every year
select year, sum(sales_qty) as yearwise_products_sold
from date as d 
join transactions as t on d.date = t.order_date
group by year
order by year;

# 14) Month-wise revenue
select month_name, sum(sales_qty * sales_amount) as monthwise_revenue
from date as d 
join transactions as t on d.date = t.order_date
group by month_name
order by monthwise_revenue desc;

# 15) month-wise products sold
select month_name, sum(sales_qty) as monthwise_products_sold
from date as d 
join transactions as t on d.date = t.order_date
group by month_name
order by monthwise_products_sold desc;