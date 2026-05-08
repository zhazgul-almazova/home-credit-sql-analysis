-- Final dataset creation
-- Joining all aggregated tables to main application table

CREATE TABLE final_dataset AS
SELECT 
    a."SK_ID_CURR",
    a."TARGET",
    a."AMT_INCOME_TOTAL",
    a."AMT_CREDIT",
    b.count_credits,
    b.total_credit,
    b.max_overdue,
    b.active_credits,
    p.prev_appl,
    p.prev_approved,
    p.prev_refused,
    p.prev_credits_amt,
    i.inst_count,
    i.total_instalment,
    i.total_paid,
    i.missed_payments
FROM hc_application_train a
LEFT JOIN bureau_agg b ON a."SK_ID_CURR" = b."SK_ID_CURR"
LEFT JOIN prev_appl_agg p ON a."SK_ID_CURR" = p."SK_ID_CURR"
LEFT JOIN inst_payments i ON a."SK_ID_CURR" = i."SK_ID_CURR";

SELECT * FROM final_dataset LIMIT 10;
