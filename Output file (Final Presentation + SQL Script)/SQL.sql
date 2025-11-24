--Sales Analysis---------------------------------------------------------------------------------------------------------------------------


-- Confirming if all my data is uploaded fine with data type correct
    
    SELECT * 
     FROM sales_table;
     
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Dates
--Operating days

SELECT 
    -- First and Last Operating Dates
    MIN(date) AS First_Operating_Date,                --1/1/2024
    MAX(date) AS Last_Operating_Date,                 --9/9/2016
FROM sales_table;
    
-----------------------------------------------------------------------------------------------------------------------------------------------

SELECT DISTINCT(sales)                                                  --Sales=1052
FROM sales_table;

-----------------------------------------------------------------------------------------------------------------------------------------------


SELECT  date,
        sales,
        cost_of_sales,
        quantity_sold,

    --Daily sales price per unit
    sales / NULLIF(quantity_sold, 0) AS daily_unit_price,

    --Average unit sales price (dataset level)
    AVG(sales / NULLIF(quantity_sold, 0)) OVER () AS avg_unit_price,

    --Gross profit
    (sales - cost_of_sales) AS gross_profit,

    --Daily % gross profit
    ((sales - cost_of_sales) / NULLIF(sales, 0)) * 100 AS daily_gross_profit_pct,

    --Daily gross profit per unit
    (sales - cost_of_sales) / NULLIF(quantity_sold, 0) AS gross_profit_per_unit

FROM sales_table
ORDER BY date;

-----------------------------------------------------------------------------------------------------------------------------------------------
