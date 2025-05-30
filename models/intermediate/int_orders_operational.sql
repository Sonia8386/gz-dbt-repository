SELECT
orders_id,
date_date,
quantity,
purchase_cost,
margin,
revenue,
shipping_fee,
ship_cost,
logcost,
ROUND((margin+shipping_fee-logcost-ship_cost),2) AS operational_margin
FROM {{ref("int_orders_margin")}}
LEFT JOIN
{{ref("stg_raw__ship")}}
USING (orders_id)
ORDER BY orders_id DESC