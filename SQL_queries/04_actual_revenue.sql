/*
Purpose:
Calculate actual revenue generated from completed purchases.
*/

SELECT
    COUNT(DISTINCT session_id) AS purchase_sessions,
    SUM(revenue) AS actual_revenue
FROM public_events
WHERE event_type = 'purchase';
