CREATE TABLE ecommerce_events (
    event_time TEXT,
    event_type VARCHAR(50),
    product_id BIGINT,
    category_id NUMERIC,
    category_code TEXT,
    brand TEXT,
    price NUMERIC,
    user_id BIGINT,
    user_session TEXT
);

--- FIRST PRODUCT ANALYST QUERY ---

-- # FUNNEL --

SELECT
    event_type,
    COUNT(*) AS events
FROM ecommerce_events
GROUP BY event_type
ORDER BY events DESC;


-- # USERS ---

SELECT
    COUNT(DISTINCT user_id) AS unique_users
FROM ecommerce_events;


-- CALCULATING REVENUE ---

SELECT
    ROUND(SUM(price),2) AS total_revenue
FROM ecommerce_events
WHERE event_type = 'purchase';


--- TOP BRANDS BY REVENUE ---

SELECT
    brand,
    ROUND(SUM(price),2) AS revenue
FROM ecommerce_events
WHERE event_type = 'purchase'
    AND brand IS NOT NULL
GROUP BY brand
ORDER BY revenue DESC
LIMIT 10;


--- SESSIONS ----

SELECT
    COUNT(DISTINCT user_session) AS total_sessions
FROM ecommerce_events;


--- CONVERSION RATE ----

SELECT
    ROUND(
        100.0 *
        COUNT(DISTINCT CASE WHEN event_type='purchase' THEN user_id END)
        /
        COUNT(DISTINCT CASE WHEN event_type='view' THEN user_id END),
        2
    ) AS user_conversion_rate
FROM ecommerce_events;


---- AVERAGE ORDER VALUE (AOV) ----

SELECT
    ROUND(AVG(price),2) AS avg_order_value
FROM ecommerce_events
WHERE event_type='purchase';


--- SESSIONS REACHED ---

SELECT
    event_type,
    COUNT(DISTINCT user_session) AS sessions
FROM ecommerce_events
GROUP BY event_type
ORDER BY sessions DESC;


---- TOP CATEGORIES ---

SELECT
    category_code,
    COUNT(*) AS purchases
FROM ecommerce_events
WHERE event_type = 'purchase'
    AND category_code IS NOT NULL
GROUP BY category_code
ORDER BY purchases DESC
LIMIT 10;


--- REVENUE DRIVERS ---

SELECT
    category_code,
    ROUND(SUM(price),2) AS revenue
FROM ecommerce_events
WHERE event_type = 'purchase'
  AND category_code IS NOT NULL
GROUP BY category_code
ORDER BY revenue DESC
LIMIT 10;


--- high-value customers ----

SELECT
    user_id,
    ROUND(SUM(price),2) AS lifetime_value
FROM ecommerce_events
WHERE event_type='purchase'
GROUP BY user_id
ORDER BY lifetime_value DESC
LIMIT 10;


--- PORTFOLIO LEVEL ANALYSIS ----

SELECT
    brand,
    COUNT(*) AS purchases,
    ROUND(SUM(price),2) AS revenue,
    ROUND(AVG(price),2) AS avg_price
FROM ecommerce_events
WHERE event_type='purchase'
    AND brand IS NOT NULL
GROUP BY brand
ORDER BY revenue DESC
LIMIT 15;


--- CONVERSION BY BRAND ---

SELECT
    brand,
    COUNT(*) FILTER (WHERE event_type='view') AS views,
    COUNT(*) FILTER (WHERE event_type='purchase') AS purchases,
    ROUND(
        100.0 *
        COUNT(*) FILTER (WHERE event_type='purchase')
        /
        NULLIF(COUNT(*) FILTER (WHERE event_type='view'),0),
        2
    ) AS conversion_rate
FROM ecommerce_events
WHERE brand IS NOT NULL
GROUP BY brand
HAVING COUNT(*) FILTER (WHERE event_type='view') > 1000
ORDER BY conversion_rate DESC
LIMIT 20;

