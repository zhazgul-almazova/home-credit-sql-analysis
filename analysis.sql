-- Exploratory data analysis
-- Key findings on loan default risk factors

1. Class balance: default vs non-default
SELECT 
    "TARGET",
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM final_dataset
GROUP BY "TARGET";

2. Average metrics by target group
SELECT 
    "TARGET",
    ROUND(AVG("AMT_INCOME_TOTAL")) AS avg_income,
    ROUND(AVG("AMT_CREDIT")) AS avg_credit,
    ROUND(AVG(count_credits)) AS avg_credits_count,
    ROUND(AVG(missed_payments)) AS avg_missed_payments
FROM final_dataset
GROUP BY "TARGET";

3. Average refusals by target group
SELECT 
    "TARGET",
    ROUND(AVG(prev_refused)) AS avg_refused,
    ROUND(AVG(prev_appl)) AS avg_applications
FROM final_dataset
GROUP BY "TARGET";

4. Average overdue by target group
SELECT 
    "TARGET",
    ROUND(AVG(max_overdue)) AS avg_max_overdue,
    ROUND(AVG(missed_payments)) AS avg_missed_payments
FROM final_dataset
GROUP BY "TARGET";



