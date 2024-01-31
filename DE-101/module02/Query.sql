/*Total Sales*/
select sum(sales) as Total_sales
from orders


/*Total Profit*/
select sum(profit) as Total_profit
from orders


/*Profit Ratio*/
select sum(profit) / sum(sales) *100 as total_ratio
from orders


/*Profit per order*/
select order_id, sum(profit) as profit_sum
from orders
group by order_id
order by profit_sum desc


/*Sales per Customer*/
select customer_id, sum(sales)
from orders
group by customer_id 


/*Avg. Discount*/
select avg(discount) * 100
from orders


/*Monthly Sales by Segment*/
select {fn year(order_date)} as Year, {fn month(order_date)} as Month, segment, 
		sum(sales) 
from orders
group by Month, segment, Year
order by segment,Year, Month 


/*Monthly Sales by Product Category*/
select {fn year(order_date)} as Year, {fn month(order_date)} as Month, category, 
		sum(sales) 
from orders
group by Month, category, Year
order by category,Year, Month


/*Sales and Profit by Customer*/
select customer_name, sum(sales) as sales, sum(profit) as profit
from orders
group by customer_name
order by profit desc


/*Sales per region*/
select region, sum(sales) as Sales
from  orders o 
group by region


/*Persent of returns*/
select  cast((select count(returned) 
		 from returns) as decimal(5,2)) / count(order_id) * 100.0 as Persent_of_returns
from orders