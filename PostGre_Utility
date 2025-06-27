
-- Compute the cost to ship each item. Shipping is the maximum of (weight * $2) or $30.

SELECT name, weight, GREATEST(30, 2 * weight)
FROM products;

-- All products are on sale! Price is the least of the products price * 0.5 or $400

SELECT 
  name, least(400, price * 0,5)
FROM
  products;

  --Print each product and its price. Also print a description of the price. If price>600 then 'high', if price>300 then 'medium', else print 'cheap'
  
  SELECT 
    name,
    price,
    CASE
        WHEN price > 600 THEN 'high'
        WHEN price > 300 THEN 'medium'
        ELSE 'cheap'
    END AS description
FROM
    products;
