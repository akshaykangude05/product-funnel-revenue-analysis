/*
Purpose:
Estimate expected revenue assuming every session
successfully completed a purchase.

Expected Revenue = Total Sessions * Average Order Value
*/

WITH avg_order_value AS (
    SELECT
        AVG(revenue) AS aov
    FROM public_events
    WHERE event_type = 'purchase'
)
SELECT
    COUNT(DISTINCT session_id) AS total_sessions,
    aov,
    COUNT(DISTINCT session_id) * aov AS expected_revenue
FROM public_events
CROSS JOIN avg_order_value;
