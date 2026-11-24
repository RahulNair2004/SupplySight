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

