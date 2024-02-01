/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name, c.Name
FROM products AS p
INNER JOIN categories AS c ON c.CategoryID = p.CategoryID
WHERE c.Name = 'Computers';
  
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name, p.Price, r.Rating 
 FROM products AS p
 INNER JOIN reviews as r ON r.ProductID = p.ProductID
 WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS Total
FROM sales as s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.Name, d.Name
FROM departments AS d
INNER JOIN categories AS c ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';
   
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.Name, SUM(s.Quantity), SUM(s.PricePerUnit * s.Quantity)
 FROM products as p
 INNER JOIN sales as s ON s.ProductID = p.ProductID
 WHERE p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, MIN(r.Rating)
FROM products as p
INNER JOIN reviews AS r ON r.ProductID = p.ProductID
WHERE p.ProductID = 857
GROUP BY p.ProductID;
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT p.Name AS Product, e.FirstName, e.LastName, e.EmployeeID, SUM(s.Quantity)
FROM sales as s
INNER JOIN employees as e ON e.EmployeeID = s.EmployeeID
INNER JOIN products as p ON s.ProductID = p.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY e.LastName;