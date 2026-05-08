-- Bureau data aggregation
-- One row per client with credit history summary

CREATE TABLE bureau_agg AS
SELECT 
    "SK_ID_CURR",
    COUNT(*) AS count_credits,
    SUM(COALESCE("AMT_CREDIT_SUM", 0)) AS total_credit,
    MAX(COALESCE("AMT_CREDIT_MAX_OVERDUE", 0)) AS max_overdue,
    SUM(CASE WHEN "CREDIT_ACTIVE" = 'Active' THEN 1 ELSE 0 END) AS active_credits
FROM bureau
GROUP BY "SK_ID_CURR";
