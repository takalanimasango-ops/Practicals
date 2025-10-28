SELECT *
FROM Joinspractical2.retail_sale_dataset.products;



-----------------------------------------------------------------------------------------

--Q1 List all orders along with the customer name and product name.
--Expected Output Columns:
--OrderID, OrderDate, CustomerName, ProductName, Quantity


SELECT o.orderid,
       o.orderdate,
       c.customername,
       p.productname,
       o.quantity
FROM Joinspractical2.retail_sale_dataset.orders AS o
INNER JOIN Joinspractical2.retail_sale_dataset.customers AS c 
ON o.customerid = c.customerid
INNER JOIN Joinspractical2.retail_sale_dataset.products AS p
ON o.productid = p.productid;

---------------------------------------------------------------------------------------------------

--Q2 Which customers have placed at least one order?
--Expected Output Columns:
--CustomerID, CustomerName, Country, OrderID, OrderDate

SELECT c.customerid,
       c.customername,
       c.country,
       o.orderid,
       o.orderdate
FROM Joinspractical2.retail_sale_dataset.customers AS c
INNER JOIN Joinspractical2.retail_sale_dataset.orders AS o 
ON c.customerid = o.customerid;
       

---------------------------------------------------------------------------------------------------

--Q3.Question: List all customers and any orders they might have placed. Include customers who have not placed any orders. 
--Expected Output Columns: 
--CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity 

SELECT c.customerid,
       c.customername,
       c.country,
       o.orderid,
       o.orderdate,
       o.productid,
       o.quantity
FROM Joinspractical2.retail_sale_dataset.customers AS c
LEFT JOIN Joinspractical2.retail_sale_dataset.orders AS o
ON c.customerid = o.customerid;

---------------------------------------------------------------------------------------------------

--Q4List all products and how many times each was ordered (if any).
--Expected Output Columns:
--ProductID, ProductName, TotalOrders (TotalOrders is the count of how many times the product appears in orders)

SELECT p.productid,
       p.productname,
       COUNT(o.orderid) AS totalorders
FROM Joinspractical2.retail_sale_dataset.products AS p
LEFT JOIN Joinspractical2.retail_sale_dataset.orders AS o
ON p.productid = o.productid
GROUP BY p.productid, p.productname;


---------------------------------------------------------------------------------------------------

--Q5Find all orders along with product details, including any products that might not have been ordered.
--Expected Output Columns:
--OrderID, OrderDate, ProductID, ProductName, Price, Quantity

SELECT o.orderid,
       o.orderdate,
       p.productid,
       p.productname,
       p.price,
       o.quantity
FROM Joinspractical2.retail_sale_dataset.orders AS o
RIGHT JOIN Joinspractical2.retail_sale_dataset.products AS p
ON o.productid = p.productid;


---------------------------------------------------------------------------------------------------

--Q6Which customers have made orders, and include customers even if they have never placed an order.
--Expected Output Columns:
--CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT c.customerid,
       c.customername,
       c.country,
       o.orderid,
       o.orderdate,
       o.productid,
       o.quantity
FROM Joinspractical2.retail_sale_dataset.orders AS o
RIGHT JOIN Joinspractical2.retail_sale_dataset.customers AS c
ON o.customerid = c.customerid;


---------------------------------------------------------------------------------------------------

--Q7List all customers and orders, showing NULLs where customers have not ordered or where orders have no customer info. 
--Expected Output Columns: 
--CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity 

SELECT c.customerid,
       c.customername,
       c.country,
       o.orderid,
       o.orderdate,
       o.productid,
       o.quantity
FROM Joinspractical2.retail_sale_dataset.customers AS c
FULL OUTER JOIN Joinspractical2.retail_sale_dataset.orders AS o
ON c.customerid = o.customerid;


---------------------------------------------------------------------------------------------------

--Q8Question: List all products and orders, showing NULLs where products were never ordered or orders are missing product info. 
--Expected Output Columns: 
--ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity

SELECT p.productid,
       p.productname,
       p.price,
       o.orderid,
       o.orderdate,
       o.customerid,
       o.quantity
FROM Joinspractical2.retail_sale_dataset.products AS p
FULL OUTER JOIN Joinspractical2.retail_sale_dataset.orders AS o
ON p.productid = o.productid;



---------------------------------------------------------------------------------------------------





