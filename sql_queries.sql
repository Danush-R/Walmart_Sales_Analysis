create database if not exists SalesDataWalmart;
create table if not exists sales( 
   invoice_id varchar(30) not null primary key,
   branch varchar(5) not null,
   city varchar(30) not null,
   customer_type varchar(30) not null,
   gender varchar(20) not null,
   product_line varchar(100) not null,
   unit_prive decimal(10, 2) not null,
   quantity int not null,
   VAT float(6, 4) not null,
   total decimal(12, 4) not null,
   date datetime not null,
   time time not null,
   payment_method varchar(15) not null,
   cogs decimal (10, 2) not null,
   gross_margin_pct float(11, 9),
   gross_income decimal(12, 4) not null,
   rating float(2, 1)
);

-- --------------------- Feature Engineering---------------------------------------------------

-- time_of_day--------------------------------------------------------------

select time,
  (case 
    when 'time' between "00:00:00" and "12:00:00" then "Morning"
    when 'time' between "12:00:01" and "16:00:00" then "Afternoon"
    else "Evening"
    end
    ) as time_of_date
  from sales; 

alter table  sales add column time_of_day varchar(30);

update sales 
set time_of_day=(
  case 
    when 'time' between "00:00:00" and "12:00:00" then "Morning"
    when 'time' between "12:00:01" and "16:00:00" then "Afternoon"
    else "Evening"
    end
); 
--   ----------------------------------------------------------------

-- -add day_name column----------------------------------------------
SELECT
	date,
	DAYNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);

-- ----Add month_name column----------------------------------------
select
	date,
	monthname(date)
from sales;

ALTER TABLE sales add COLUMN month_name varchar(10);

UPDATE sales
SET month_name = MONTHNAME(date);

-- ------------------------------------------------------------------

-- --------------------------Generic-----------------------------------------------

-- How many unique cities does the data have?
select  distinct city  from sales;

-- In which city is each branch?
select distinct branch from sales;
select distinct city,branch from sales;


-- ----------------------Product----------------------

-- How many unique product lines does the data have?
select count(distinct product_line) from sales;

-- What is the most common payment method?
select payment_method, count(payment_method) as count 
from sales 
group by payment_method
order by count desc;

-- What is the most selling product line?
select product_line, count(product_line) as count 
from sales 
group by product_line 
order by count desc;

-- What is the total revenue by month?
select month_name as month,
sum(total) as total_revenue
from sales
group by month_name
order by total_revenue desc;

-- What month had the largest COGS?
select month_name as month,
sum(cogs) as cogs
from sales
group by month_name
order by cogs desc;

-- What product line had the largest revenue?
select product_line, sum(total) as total_revenue 
from sales 
group by product_line 
order by total_revenue desc;

-- What is the city with the largest revenue?
select city,branch, sum(total) as total_revenue 
from sales 
group by city,branch 
order by total_revenue desc;

-- What product line had the largest VAT?
select product_line,
avg(VAT)as avg_vat
from sales
group by product_line
order by avg_vat desc;

-- Which branch sold more products than average product sold?
select branch, sum(quantity) as qty
from sales 
group by branch
having sum(quantity) > (select avg(quantity) from sales);

-- What is the most common product line by gender?
select product_line, gender, count(gender) as gender_count
from sales
group by product_line,gender
order by gender_count desc;

-- What is the average rating of each product line?
select product_line, round(avg(rating), 3) as avg_rating
from sales
group by product_line
order by avg_rating desc;

-- ----------------------Sales--------------------------

-- Number of sales made in each time of the day per weekday
select time_of_day, count(*) as total_sales
from sales
where day_name= "Sunday" 
group by time_of_day
order by total_sales desc;

-- Which of the customer types brings the most revenue?
select customer_type, sum(total) as total_revenue
from sales
group by customer_type
order by total_revenue desc;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
select city,branch,
avg(vat) as vat_tax
from sales
group by city,branch
order by vat_tax desc;

-- Which customer type pays the most in VAT?
select customer_type,
avg(vat) as vat_tax
from sales
group by customer_type
order by vat_tax desc;

-- --------------Customer type-----------------

-- How many unique customer types does the data have?
select distinct(customer_type)
from sales;

select count(distinct(customer_type)) 
from sales;

-- How many unique payment methods does the data have?
select distinct(payment_method) 
from sales;

select count(distinct(payment_method)) 
from sales;

-- What is the most common customer type?
select distinct(customer_type)
from sales;

SELECT customer_type, COUNT(*) AS type_count
FROM sales
GROUP BY customer_type
ORDER BY type_count DESC
LIMIT 1;

-- Which customer type buys the most?
SELECT customer_type, COUNT(quantity) AS qty_count
FROM sales
GROUP BY customer_type;

-- What is the gender of most of the customers?
SELECT customer_type,gender, COUNT(gender) AS g_count
FROM sales
GROUP BY customer_type,gender
order by g_count desc;

-- What is the gender distribution per branch?
SELECT branch, gender, COUNT(*) AS gender_count
FROM sales
GROUP BY branch, gender;


-- Which time of the day do customers give most ratings?
select time_of_day, count(*) as rating_count
from sales
group by time_of_day
order by rating_count desc;

-- Which time of the day do customers give most ratings per branch?
select time_of_day,branch, count(*) as rating_count
from sales
group by time_of_day,branch
order by rating_count desc;

-- Which day fo the week has the best avg ratings?
select day_name, AVG(rating) AS avg_rating
from sales
GROUP BY day_name
ORDER BY avg_rating DESC
LIMIT 1;

-- Which day of the week has the best average ratings per branch?
select day_name, AVG(rating) AS avg_rating
from sales
GROUP BY day_name
ORDER BY avg_rating desc;


