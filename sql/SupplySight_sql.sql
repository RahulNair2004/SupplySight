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

