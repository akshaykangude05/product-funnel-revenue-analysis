/*
Purpose:
Create a session-level funnel table indicating whether
each session reached each funnel stage.
*/

CREATE OR REPLACE VIEW valid_session_funnel AS
SELECT
    session_id,
    user_id,

    MAX(CASE WHEN event_type = 'page_view' THEN 1 ELSE 0 END) AS page_viewed,
    MAX(CASE WHEN event_type = 'product_view' THEN 1 ELSE 0 END) AS product_viewed,
    MAX(CASE WHEN event_type = 'add_to_cart' THEN 1 ELSE 0 END) AS added_to_cart,
    MAX(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchased

FROM public_events
GROUP BY session_id, user_id;
