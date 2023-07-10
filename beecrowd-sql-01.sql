-- 2602
select name from customers where state = 'RS';

-- 2603
SELECT name, street FROM customers WHERE city = 'Porto Alegre'; 

-- 2604
SELECT id, name FROM products WHERE price <10 OR price >100;

-- 2605
SELECT products.name,providers.name FROM products 
JOIN categories
ON id_categories = categories.id
JOIN providers
ON id_providers = providers.id
WHERE categories.id = 6;

-- 2606
SELECT P.id, P.name 
FROM products P, categories C 
WHERE P.id_categories	= C.id
AND C.name LIKE 'super%'

-- 2607
SELECT city
FROM providers
GROUP BY city
ORDER BY city ASC

-- 2608
SELECT MAX(price), MIN(price)
FROM products

-- 2609
SELECT productCategory.name,
SUM(amount)
FROM (select products.amount, products.id, categories.name as name from products
inner join categories on products.id_categories = categories.id) as productCategory
GROUP BY name;

-- 2610
SELECT round(AVG(price), 2)
FROM products

-- 2611
SELECT m.id, m.name  
FROM movies m
INNER join genres g
on m.id_genres = g.id
WHERE g.description = 'Action'

-- 2613
SELECT M.id, name
FROM movies M, prices P
WHERE M.id_prices = P.id
AND p.value < 2

-- 2614
SELECT c.name, r.rentals_date
FROM customers c
INNER join rentals r
on c.id = r.id_customers
where r.rentals_date >= '09/01/2016' 
AND r.rentals_date <= '09/30/2016';

-- 2615
SELECT city 
FROM customers 
GROUP BY city

-- 2616
SELECT c.id, c.name
FROM customers c
LEFT JOIN locations l
ON l.id_customers = c.id
WHERE l.locations_date ISNULL
ORDER by c.id

-- 2617
SELECT P.name, F.name 
FROM providers F, products P 
WHERE F.name = 'Ajax SA' 
AND F.id = P.id_providers

-- 2618
SELECT P.name, F.name, C.name 
FROM products P, providers F, categories C 
WHERE C.name = 'Imported' 
AND F.name = 'Sansul SA' 
AND P.id_providers = F.id 
AND P.id_categories = C.id

-- 2619
SELECT P.name, F.name, P.price
FROM products P, providers F, categories C
WHERE C.name = 'Super Luxury'
AND P.price > 1000 
AND P.id_providers = F.id 
AND P.id_categories = C.id

-- 2620
SELECT C.name, P.id
FROM customers C, orders P
WHERE C.id = P.id_customers
AND P.orders_date
BETWEEN '2016-01-01'
AND '2016-06-30'

-- 2621
SELECT P.name 
FROM providers K, products P 
WHERE K.id = P.id_providers 
AND K.name LIKE 'P%' 
AND P.amount BETWEEN 10 
AND 20

-- 2622
SELECT name
FROM customers, legal_person
WHERE id = id_customers

-- 2623
SELECT pd.name, ct.name
FROM products pd
INNER join categories ct
ON pd.id_categories = ct.id
WHERE pd.amount > 100
AND pd.id_categories in (1,2,3,6,9)
ORDER BY pd.id_categories ASC;

-- 2624
SELECT COUNT(DISTINCT city)
FROM customers

-- 2625
SELECT regexp_replace(np.cpf, '(\d{3})(\d{3})(\d{3})', '\1.\2.\3-')
FROM natural_person np
LEFT JOIN customers c
ON c.id = np.id_customers
