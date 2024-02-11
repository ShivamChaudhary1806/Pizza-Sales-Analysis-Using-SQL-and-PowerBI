use pizzadb;
select * from pizza_sales;

# Sum of total price of all pizza orders/Total Revenue
select sum(total_price) as Total_revenue from pizza_sales;

# Average Order value
select sum(total_price)/count(distinct(order_id)) as Average_order_value from pizza_sales;

#  Quantity of pizza sold
select sum(quantity) as Total_pizza_Sold from pizza_sales;

# Total Orders Placed
select count(distinct(order_id)) as total_orders from pizza_sales;

# Average pizza per order
select sum(quantity)/count(distinct(order_id)) as Average_pizzas_per_order from pizza_sales;

# Daily Trends for total orders
select date_format(str_to_date(order_date,'%d-%m-%Y'),'%W') 
as order_day,count(distinct(order_id)) as total_orders
from pizza_sales
group by order_day; 

# Monthly Trends for Total Orders
select date_format(str_to_date(order_date,'%d-%m-%y'),'%M')
as Month_Name,count(distinct(order_id)) as total_orders
from pizza_sales
group by Month_Name
order by total_order desc;

# Pizza Sales by Percentage by category
select pizza_category,sum(total_price) as total_sales,sum(total_price)*100/(select sum(total_price) from pizza_sales)
as total_percentage
from pizza_sales
group by pizza_category;

# Percentage of sales by pizza size
select pizza_size,sum(total_price) as total_sales,sum(total_price)*100/(Select sum(total_price) from pizza_sales)
as total_percentage
from pizza_sales
group by pizza_size
order by total_percentage desc;

# Top 5 best pizza by revenue
select pizza_name,sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc
limit 5;

# Bottom 5 pizza by revenue
select pizza_name,sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue asc
limit 5;

# Top 5 pizza by quantity
select pizza_name,sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc
limit 5;

# Bottom 5 pizza by quantity
select pizza_name,sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity asc
limit 5;

# Top 5 Pizza by orders
select pizza_name,count(distinct(order_id)) as total_orders from pizza_sales
group by pizza_name
order by total_orders desc
limit 5;

# Bottom 5 pizza by orders
select pizza_name,count(distinct(order_id)) as total_orders from pizza_sales
group by pizza_name
order by total_orders asc
limit 5;

