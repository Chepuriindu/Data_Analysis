create DATABASE EcommerceDB;

use EcommerceDB;

select top 10 * from global_ecommerce_sales;

SELECT 
    Order_ID,
    Customer_Name,
    Product_Name,
    Quantity,
    Total_Sales,
    Profit
FROM global_ecommerce_sales;


SELECT
    Order_ID,
    Customer_Name,
    Product_Name,
    Total_Sales
FROM global_ecommerce_sales
WHERE Total_Sales > 1000
ORDER BY Total_Sales DESC;


SELECT
    Product_Category,
    SUM(Total_Sales) AS Total_Revenue
FROM global_ecommerce_sales
GROUP BY Product_Category
ORDER BY Total_Revenue DESC;




SELECT
    Customer_Segment,
    AVG(Total_Sales) AS Average_Sales
FROM global_ecommerce_sales
GROUP BY Customer_Segment
ORDER BY Average_Sales DESC;


SELECT
    Product_Category,
    COUNT(Order_ID) AS Number_of_Orders
FROM global_ecommerce_sales
GROUP BY Product_Category
ORDER BY Number_of_Orders DESC;


CREATE TABLE customers (
    Customer_Name VARCHAR(100) PRIMARY KEY,
    Customer_Segment VARCHAR(50),
    Country VARCHAR(100),
    Region VARCHAR(100)
);

INSERT INTO customers (Customer_Name, Customer_Segment, Country, Region)
SELECT DISTINCT
    Customer_Name,
    Customer_Segment,
    Country,
    Region
FROM ecommerce_sales;

DROP TABLE customers;


CREATE TABLE customers (
    Customer_Name VARCHAR(100),
    Customer_Segment VARCHAR(50),
    Country VARCHAR(100),
    Region VARCHAR(100)
);
INSERT INTO customers
    (Customer_Name, Customer_Segment, Country, Region)
SELECT DISTINCT
    Customer_Name,
    Customer_Segment,
    Country,
    Region
FROM global_ecommerce_sales;

SELECT TOP 10 * FROM customers;



SELECT
    g.Order_ID,
    g.Customer_Name,
    g.Product_Name,
    g.Total_Sales,
    c.Customer_Segment,
    c.Country
FROM global_ecommerce_sales g
INNER JOIN customers c
    ON g.Customer_Name = c.Customer_Name;


SELECT
    g.Order_ID,
    g.Customer_Name,
    g.Product_Name,
    g.Total_Sales,
    c.Customer_Segment,
    c.Country
FROM global_ecommerce_sales g
LEFT JOIN customers c
    ON g.Customer_Name = c.Customer_Name;



SELECT
    g.Order_ID,
    g.Customer_Name,
    g.Product_Name,
    g.Total_Sales,
    c.Customer_Segment,
    c.Country
FROM global_ecommerce_sales g
RIGHT JOIN customers c
    ON g.Customer_Name = c.Customer_Name;




SELECT
    Order_ID,
    Customer_Name,
    Product_Name,
    Total_Sales
FROM global_ecommerce_sales
WHERE Total_Sales > (
    SELECT AVG(Total_Sales)
    FROM global_ecommerce_sales
)
ORDER BY Total_Sales DESC;



CREATE VIEW sales_analysis AS
SELECT
    Order_ID,
    Order_Date,
    Customer_Name,
    Product_Category,
    Product_Name,
    Quantity,
    Total_Sales,
    Profit,
    Payment_Method
FROM global_ecommerce_sales;
SELECT * FROM sales_analysis;


CREATE INDEX idx_customer_name
ON global_ecommerce_sales(Customer_Name);

SELECT
    name,
    type_desc
FROM sys.indexes
WHERE object_id = OBJECT_ID('global_ecommerce_sales');