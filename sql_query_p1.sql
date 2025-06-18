--create database
create database sql_project_p1

--create table
create table retail_sale
(transactions_id INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender	VARCHAR (15),
    age INT,
	category VARCHAR (15),
	quantiy INT,
	price_per_unit FLOAT,
    cogs FLOAT,
	total_sale FLOAT
);


SELECT *
FROM sql_project_p1.retail_sale
  where transactions_id is null
  or sale_date is null
  or sale_time is null
  or gender is null
  or age is null
  or category is null
  or quantiy is null 
  or price_per_unit is null 
  or cogs is null 
  or total_sale is null;
  
  --data Expolartion 
  
  --1) How many sales we have?
  
  select count( transactions_id)
  from sql_project_p1.retail_sale
  
  Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * 
from retail
where sale_date ="2022-11-05";

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022

select * 
from retail
where category = "clothing" And quantiy >=3  And sale_date>= "2022-11-01" and
sale_date<= "2022-11-31";

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select category, sum(total_sale)
from retail
group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select avg(age), category
from retail
where category= "beauty"

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select * 
from retail
where total_sale >=1000
            
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
            
select * from retail
select count(transactions_id) as total_transcation,gender,category
from retail
group by gender,category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT
  MONTH(sale_date) AS sale_month,
  AVG(total_sale) AS avg_monthly_sale
FROM retail
GROUP by 1
order by 1
--the best month= April

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select distinct(customer_id),sum(total_sale)
 from retail
 group by 1
 order by 2 desc
 limit 5
 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select  distinct count(customer_id),category
from retail
group by 2

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
            
SELECT
CASE
  WHEN HOUR(sale_time) < 12 THEN 'Morning'
    WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS shift,
  COUNT(*) AS order_count
FROM retail
GROUP BY shift;

  
  
