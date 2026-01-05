/*
Purpose:
Generate KPI metrics for dashboard cards.
*/

WITH sessions AS (
    SELECT COUNT(DISTINCT session_id) AS total_sessions
    FROM public_events
),
purchases AS (
    SELECT COUNT(DISTINCT session_id) AS purchase_sessions
    FROM public_events
    WHERE event_type = 'purchase'
),
revenue AS (
    SELECT SUM(revenue) AS total_revenue
    FROM public_events
    WHERE event_type = 'purchase'
)
SELECT
    s.total_sessions,
    p.purchase_sessions,
    ROUND((p.purchase_sessions::DECIMAL / s.total_sessions) * 100, 2)
        AS purchase_conversion_pct,
    r.total_revenue
FROM sessions s
JOIN purchases p ON 1=1
JOIN revenue r ON 1=1;
