SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id IN (1, 2)
ORDER BY return_date DESC

SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id = 1 OR customer_id = 2
ORDER BY return_date DESC

SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id NOT IN (1, 2)
FETCH FIRST 10 ROW ONLY

SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id <> 1 AND customer_id != 2
FETCH FIRST 10 ROW ONLY

SELECT customer_id
FROM rental
WHERE CAST (return_date AS DATE) = '2005-05-27'
ORDER BY customer_id

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id 
IN (
    SELECT customer_id
FROM rental
WHERE CAST (return_date AS DATE) = '2005-05-27'
)
ORDER BY customer_id