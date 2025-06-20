----- Running Total
WITH Sales_Data AS(
SELECT
  date,
  product,
  sales
FROM
  UNNEST([
    STRUCT(DATE '2025-01-01' AS date, 'Product A' AS product, 10 AS sales),
    STRUCT(DATE '2025-01-01' AS date, 'Product B' AS product, 15 AS sales),
    STRUCT(DATE '2025-01-01' AS date, 'Product C' AS product, 8 AS sales),
    STRUCT(DATE '2025-01-02' AS date, 'Product A' AS product, 12 AS sales),
    STRUCT(DATE '2025-01-02' AS date, 'Product B' AS product, 18 AS sales),
    STRUCT(DATE '2025-01-02' AS date, 'Product C' AS product, 9 AS sales),
    STRUCT(DATE '2025-01-03' AS date, 'Product A' AS product, 11 AS sales),
    STRUCT(DATE '2025-01-03' AS date, 'Product B' AS product, 14 AS sales),
    STRUCT(DATE '2025-01-03' AS date, 'Product C' AS product, 10 AS sales),
    STRUCT(DATE '2025-01-04' AS date, 'Product A' AS product, 13 AS sales),
    STRUCT(DATE '2025-01-04' AS date, 'Product B' AS product, 16 AS sales),
    STRUCT(DATE '2025-01-04' AS date, 'Product C' AS product, 7 AS sales),
    STRUCT(DATE '2025-01-05' AS date, 'Product A' AS product, 14 AS sales),
    STRUCT(DATE '2025-01-05' AS date, 'Product B' AS product, 19 AS sales),
    STRUCT(DATE '2025-01-05' AS date, 'Product C' AS product, 11 AS sales),
    STRUCT(DATE '2025-01-06' AS date, 'Product A' AS product, 15 AS sales),
    STRUCT(DATE '2025-01-06' AS date, 'Product B' AS product, 17 AS sales),
    STRUCT(DATE '2025-01-06' AS date, 'Product C' AS product, 12 AS sales),
    STRUCT(DATE '2025-01-07' AS date, 'Product A' AS product, 13 AS sales),
    STRUCT(DATE '2025-01-07' AS date, 'Product B' AS product, 20 AS sales),
    STRUCT(DATE '2025-01-07' AS date, 'Product C' AS product, 9 AS sales),
    STRUCT(DATE '2025-01-08' AS date, 'Product A' AS product, 14 AS sales),
    STRUCT(DATE '2025-01-08' AS date, 'Product B' AS product, 18 AS sales),
    STRUCT(DATE '2025-01-08' AS date, 'Product C' AS product, 13 AS sales),
    STRUCT(DATE '2025-01-09' AS date, 'Product A' AS product, 16 AS sales),
    STRUCT(DATE '2025-01-09' AS date, 'Product B' AS product, 15 AS sales),
    STRUCT(DATE '2025-01-09' AS date, 'Product C' AS product, 14 AS sales),
    STRUCT(DATE '2025-01-10' AS date, 'Product A' AS product, 15 AS sales),
    STRUCT(DATE '2025-01-10' AS date, 'Product B' AS product, 17 AS sales),
    STRUCT(DATE '2025-01-10' AS date, 'Product C' AS product, 12 AS sales)
  ])
)
SELECT 
  date
  ,SUM(Sales) OVER() AS Overall_Sales
  ,SUM(Sales) OVER(ORDER BY Date) AS running
  ,SUM(Sales) OVER(PARTITION BY Product) AS Product_Wise_Total_Sales
  ,SUM(Sales) OVER(PARTITION BY Product ORDER BY date) AS Running_Sales
  ,SUM(Sales) OVER(PARTITION BY Product ORDER BY date ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS Two_Days_Rolling_Total
  ,SUM(Sales) OVER(PARTITION BY Product ORDER BY date ROWS BETWEEN 5 PRECEDING AND CURRENT ROW) AS Five_Days_Rolling_Total
  ,SUM(Sales) OVER(PARTITION BY Product ORDER BY date ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS One_Day_lead_Rolling_Total
  ,SUM(Sales) OVER(PARTITION BY Product ORDER BY date ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS Two_Day_lead_Rolling_Total
  ,SUM(Sales) OVER(PARTITION BY Product ORDER BY date ROWS BETWEEN CURRENT ROW AND 5 FOLLOWING) AS Five_Day_lead_Rolling_Total
FROM Sales_Data
