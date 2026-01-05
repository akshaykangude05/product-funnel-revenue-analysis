/*
Purpose:
Count number of sessions reaching each funnel stage.
Used for funnel visualization in Power BI.
*/

SELECT
    COUNT(DISTINCT session_id) AS total_sessions,
    SUM(page_viewed) AS page_view_sessions,
    SUM(product_viewed) AS product_view_sessions,
    SUM(added_to_cart) AS add_to_cart_sessions,
    SUM(purchased) AS purchase_sessions
FROM valid_session_funnel;
