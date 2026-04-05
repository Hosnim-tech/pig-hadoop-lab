-- ============================================
--  PIG DEMO SCRIPT - Sales Analysis
--  Run: pig -x mapreduce /scripts/demo.pig
-- ============================================

sales = LOAD '/user/root/pig_data/sales.csv'
    USING PigStorage(',')
    AS (order_id:int, order_date:chararray, category:chararray,
        product:chararray, price:double, city:chararray);

DUMP sales;

electronics = FILTER sales BY category == 'Electronics';
DUMP electronics;

grouped = GROUP sales BY category;

category_revenue = FOREACH grouped GENERATE
    group AS category,
    COUNT(sales) AS num_orders,
    SUM(sales.price) AS total_revenue;

sorted_revenue = ORDER category_revenue BY total_revenue DESC;
DUMP sorted_revenue;

STORE sorted_revenue INTO '/user/root/pig_output/demo_revenue' USING PigStorage(',');
