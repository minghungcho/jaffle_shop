{{ config(materialized = 'view') }}
WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),
orders AS (
    select * from {{ ref('stg_orders') }}
),
customer_orders AS (
	SELECT
		customer_id,
		min(order_date) AS first_order_date,
		max(order_date)	AS most_recent_order_date,
		count(order_id)	AS number_of_orders
	FROM
		orders
	GROUP BY
		customer_id
),
final AS (
	SELECT	A.customer_id,
			A.first_name,
			A.last_name,
			B.first_order_date,
			B.most_recent_order_date,
			nvl(B.number_of_orders, 0) AS number_of_orders
	FROM	customers A
			LEFT OUTER JOIN	customer_orders B USING (customer_id)
)
SELECT *
FROM final
