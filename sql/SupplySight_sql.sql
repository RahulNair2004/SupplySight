-- Retrieve the data

Select * from dataco

/*
2.  Total revenue.
    Total profit.
    Total number of unique orders.
    Total quantity of products sold.
    Total number of unique customers. */

SELECT 
    ROUND(SUM("Sales")::NUMERIC, 2) AS total_revenue,
    ROUND(SUM("Benefit per order")::NUMERIC, 2) AS total_profit,
    COUNT(DISTINCT "Order Id") AS unique_orders,
    SUM("Order Item Quantity") AS total_quantity_sold,
    COUNT(DISTINCT "Customer Id") AS unique_customers
FROM dataco;


/* 
3.  Calculate the Average Order Value (AOV).
    Calculate the average profit generated per order.
    Calculate the average quantity of products per order. */

With order_totals AS (
	Select
		"Order Id",
		Sum("Sales") as total_order_value,
		Sum("Benefit per order") as total_profit,
		sum("Order Item Quantity") as total_quantity
	From dataco
	group by "Order Id"
)
Select
	round(avg(total_order_value)::numeric,2) as average_order_value,
	round(avg(total_profit)::numeric,2) as average_profit_per_order,
	round(avg(total_quantity)::numeric,2) as average_quantity_per_order
	from order_totals

-- 4 Porfit Margin Analysis
/* Calculate the overall profit margin percentage.
Calculate the average discount percentage offered.
Calculate the total discount amount. */

Select
	round(((sum("Benefit per order")/sum("Sales"))*100)::numeric,2) as profit_margin_perentage,
	round((avg("Order Item Discount Rate")*100)::numeric,2) as average_discount_percentage,
	round(sum("Order Item Discount")::numeric,2) as total_discount_amount
From dataco

-- 5. Customer & Order Performance
/* Find the top 10 customers based on total revenue.
Display their customer ID.
Calculate their total revenue.
Calculate their total profit.
Calculate their total number of unique orders.
Calculate their average order value. */

Select 
	"Customer Id",
	round((Sum("Sales")::numeric),2) as total_revenue,
	round((Sum("Order Profit Per Order")::numeric),2) as total_profit,
	Count(Distinct "Order Id") as total_unique_orders,
	round((Sum("Sales") / Count(Distinct "Order Id"))::numeric,2) as avg_order_value
from dataco 
group by "Customer Id"
order by total_revenue  desc
LIMIT 10

-- 6. Monthly Sales and Profit Analysis
/* Calculate monthly total revenue.
Calculate monthly total profit.
Calculate the number of unique orders per month.
Calculate monthly profit margin percentage.
Display results in chronological order. */

Select
	Date_Trunc('month',TO_timestamp("order date (DateOrders)",'MM/DD/YYYY HH24:MI')) as order_month,
	round(SUM("Sales")::numeric,2) as monthly_total_revenue,
	round(sum("Order Profit Per Order")::numeric,2) as monthly_total_profit,
	count(Distinct "Order Id") as unique_orders,
	round(((sum("Order Profit Per Order") / Nullif(sum("Sales"),0))*100)::numeric,2) as profit_margin_percentage
from dataco
group by 1 
order by order_month asc

-- 7. Month-over-Month Revenue Growth
/* Calculate total monthly revenue.
Display the previous month's revenue.
Calculate the absolute change in revenue.
Calculate month-over-month revenue growth percentage.
Identify months where revenue declined. */

WITH monthly_sales AS (
    SELECT 
        DATE_TRUNC('month', TO_TIMESTAMP("order date (DateOrders)", 'MM/DD/YYYY HH24:MI')) AS order_month,
        SUM("Sales") AS total_revenue
    FROM dataco
    GROUP BY 1
)
SELECT 
    order_month,
    ROUND(total_revenue::numeric, 2) AS monthly_total_revenue,
    ROUND(LAG(total_revenue) OVER (ORDER BY order_month ASC)::numeric, 2) AS previous_month_revenue,
    ROUND((total_revenue - LAG(total_revenue) OVER (ORDER BY order_month ASC))::numeric, 2) AS absolute_change,
    ROUND((((total_revenue - LAG(total_revenue) OVER (ORDER BY order_month ASC)) / NULLIF(LAG(total_revenue) OVER (ORDER BY order_month ASC), 0)) * 100)::numeric, 2) AS mom_growth_percentage,
    CASE 
        WHEN total_revenue < LAG(total_revenue) OVER (ORDER BY order_month ASC) THEN 'Declined'
        WHEN LAG(total_revenue) OVER (ORDER BY order_month ASC) IS NULL THEN 'First Month'
        ELSE 'Increased / Flat'
    END AS revenue_status
FROM monthly_sales
ORDER BY order_month ASC;

-- 8. Yearly Business Performance
/*  Year
	Total revenue
	Total profit
	Unique orders
	Unique customers
	Average order value
	Profit margin percentage */

