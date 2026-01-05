/*
Purpose:
Calculate revenue leakage due to funnel drop-offs.

Revenue Leakage = Expected Revenue - Actual Revenue
*/

WITH actual AS (
    SELECT
        SUM(revenue) AS actual_revenue
    FROM public_events
    WHERE event_type = 'purchase'
),
expected AS (
    SELECT
        COUNT(DISTINCT session_id) * AVG(revenue) AS expected_revenue
    FROM public_events
    WHERE event_type = 'purchase'
)
SELECT
    expected.expected_revenue,
    actual.actual_revenue,
    expected.expected_revenue - actual.actual_revenue AS revenue_leakage
FROM expected, actual;
