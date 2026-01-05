/*
Purpose:
Calculate session drop-offs between funnel stages.
Helps identify where users exit the funnel.
*/

SELECT
    SUM(page_viewed) - SUM(product_viewed) AS drop_page_to_product,
    SUM(product_viewed) - SUM(added_to_cart) AS drop_product_to_cart,
    SUM(added_to_cart) - SUM(purchased) AS drop_cart_to_purchase
FROM valid_session_funnel;
