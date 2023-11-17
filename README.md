# Walmart Sales Data Analysis

## About
This project delves into Walmart Sales data, aiming to uncover insights about top-performing branches, product lines, sales trends, and customer behavior. The ultimate goal is to refine and optimize sales strategies. The dataset was sourced from the [Kaggle Walmart Sales Forecasting Competition](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting).


In this competition, historical sales data for 45 Walmart stores across diverse regions is provided. Each store comprises multiple departments, and the challenge involves forecasting sales for each department within each store. The dataset includes selected holiday markdown events, known to impact sales, yet predicting their effect on specific departments remains challenging. (source)

## Purposes Of The Project
The primary objective is to gain comprehensive insights into Walmart sales data, understanding the factors influencing sales across various branches.

## About Data
The dataset, acquired from the Kaggle Walmart Sales Forecasting Competition, encompasses sales transactions from three Walmart branches situated in Mandalay, Yangon, and Naypyitaw. It comprises 17 columns and 1000 rows:

| Column                     | Description                            | Data Type         |
|----------------------------|----------------------------------------|-------------------|
| invoice_id                 | Invoice of the sales made              | VARCHAR(30)       |
| branch                     | Branch where sales were made           | VARCHAR(5)        |
| city                       | Branch location                        | VARCHAR(30)       |
| customer_type              | Customer type                          | VARCHAR(30)       |
| gender                     | Gender of the purchasing customer      | VARCHAR(10)       |
| product_line               | Product line                           | VARCHAR(100)      |
| unit_price                 | Price of each product                  | DECIMAL(10, 2)    |
| quantity                   | Quantity of the product sold           | INT               |
| VAT                        | Tax amount on purchase                 | FLOAT(6, 4)       |
| total                      | Total purchase cost                    | DECIMAL(10, 2)    |
| date                       | Purchase date                          | DATE              |
| time                       | Purchase time                          | TIMESTAMP         |
| payment_method             | Payment amount                         | DECIMAL(10, 2)    |
| cogs                       | Cost Of Goods sold                     | DECIMAL(10, 2)    |
| gross_margin_percentage    | Gross margin percentage                | FLOAT(11, 9)      |
| gross_income               | Gross Income                           | DECIMAL(10, 2)    |
| rating                     | Rating                                 | FLOAT(2, 1)       |

## Analysis List

### Product Analysis
- Analyze product lines to identify top-performing and underperforming lines.

### Sales Analysis
- Examine sales trends to assess the effectiveness of different sales strategies.

### Customer Analysis
- Explore customer segments, purchase trends, and segment profitability.

## Approach Used
- **Data Wrangling:** Detect and handle NULL or missing values.
- **Database Creation:** Build tables and insert data.
- **Feature Engineering:** Generate new columns from existing data.
    - `time_of_day`: Insight into Morning, Afternoon, and Evening sales.
    - `day_name`: Days of the week for branch activity analysis.
    - `month_name`: Months for sales and profit analysis.
- **Exploratory Data Analysis (EDA):** Address project aims through data exploration.

## Conclusion

### Business Questions To Answer

#### Generic Question
- How many unique cities does the data have?
- Branch locations?

#### Product
- Unique product lines?
- Most common payment method?
- Top-selling product lines?
- Total revenue by month?
- Month with the largest COGS?
- Product line with the largest revenue?
- City with the largest revenue?
- Product line with the largest VAT?
- Categorize product lines as "Good" or "Bad" based on sales.

#### Sales
- Number of sales per time of day, per weekday?
- Customer types generating the most revenue?
- City with the highest VAT?
- Customer type paying the most VAT?
- Branches selling more products than average?
 
#### Customer
- Unique customer types?
- Unique payment methods?
- Most common customer type?
- Customer type with the most purchases?
- Gender distribution among customers?
- Gender distribution per branch?
- Time of day receiving the most ratings?
- Time of day receiving the most ratings per branch?
- Day of the week with the best average ratings?
- Day of the week with the best average ratings per branch?

### Revenue And Profit Calculations
- COGS: $COGS = unitPrice * quantity$
- VAT: $VAT = 5% * COGS$
- Total Sales: $total = VAT + COGS$
- Gross Profit: $grossProfit = total - COGS$
- Gross Margin Percentage: $\text{Gross Margin} = \frac{\text{gross income}}{\text{total revenue}}$

