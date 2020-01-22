-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.productName, c.categoryName
FROM product AS p
JOIN category AS c
    ON p.supplierId = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id, s.companyName, o.shippedDate
FROM [order] AS o
JOIN shipper AS s
    ON o.shipVia = s.id
WHERE shippedDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT o.id, p.productName, oD.quantity
FROM orderDetail as oD
JOIN [order] as o
    ON oD.orderId = o.id
JOIN product as p
    ON oD.productId = p.id
WHERE o.id = 10251
ORDER BY p.productName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id AS 'orderId', c.companyName, e.lastName AS 'employeeSurname'
FROM [order] AS o
JOIN customer AS c
    ON o.customerId = c.id
JOIN employee AS e
    ON o.employeeId = e.id

-- STRETCH

-- Display CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

SELECT c.categoryName, COUNT(p.productName) as [count] 
FROM products AS p
JOIN categories AS c
	ON p.categoryId = c.categoryId
GROUP BY c.categoryName

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

SELECT DISTINCT orderId, SUM(quantity) AS itemCount
FROM orderDetails
GROUP BY orderId