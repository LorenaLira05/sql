--Write a query that prints out the name and price of phones that have a price greater than the Samsung S5620 Monte.

SELECT   
  name, price 
FROM 
  phones
WHERE 
  price > (SELECT price 
FROM
  phones
WHERE 
  name = 'S5620 Monte'
);

--Write a query that prints the name and price for each phone.  In addition, print out the ratio of the phones price against max price of all phones (so price / max price). 
Rename this third column to price_ratio

SELECT name, price, price / (SELECT MAX(price) FROM phones) AS price_ratio
FROM phones;

--Calculate the average price of phones for each manufacturer.  Then print the highest average price. Rename this value to max_average_price.

SELECT MAX(avg_price) 
	AS max_average_price
FROM (
	SELECT AVG(price) AS avg_price
FROM 
  phones
GROUP BY 
   manufacturer
)AS 
  max_average_price ;

-- Show the name of the products that are not in the same department as products with a price less than 100.

SELECT 
    name, department
FROM
    products
WHERE
    department NOT IN (SELECT 
            department
        FROM
            products
        WHERE
            price < 100);

-- Show the name, department and price of products that costs more than all products in the 'Industrial' department.
SELECT 
    name, department, price
FROM
    products
WHERE
    price > (SELECT 
            MAX(price)
        FROM
            products
        WHERE
            department = 'Industrial');

-- Show the name of products that are more expensive than at least one product in the 'Industrial' department.

   SELECT 
    name, department, price
FROM
    products
WHERE
    price > SOME (SELECT 
            price
        FROM
            products
        WHERE
            department = 'Industrial');

-- Show the name, department and price of the most expensive product in each department.

SELECT 
    name, department, price
FROM
    products AS p1
WHERE
    p1.price = (SELECT 
            MAX(price)
        FROM
            products AS p2
        WHERE
            p1.department = p2.department);

--Using only subqueries, print the max price, min price, and average price of all phones. Rename each column to max_price, min_price, avg_price.

SELECT 
	(SELECT MAX(price) 
		FROM phones) 
			AS max_price,
	(SELECT min(price) 
		FROM phones) 
			AS min_price,
	(SELECT AVG(price) 
		FROM phones) 
			AS avg_price;

-- Write a query that will print the number of unique phone manufacturers.

SELECT 
	COUNT(DISTINCT MANUFACTURER)
FROM 
	phones;
