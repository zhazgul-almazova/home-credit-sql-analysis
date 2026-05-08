-- Previous applications aggregation
-- One row per client with application history summary

CREATE TABLE prev_appl_agg AS
SELECT "SK_ID_CURR",
    count(*) AS prev_appl,
    sum(COALESCE("AMT_CREDIT", 0)) AS prev_credits_amt,
    sum(CASE WHEN "NAME_CONTRACT_STATUS" = 'Approved' THEN 1 ELSE 0 END) AS prev_approved,
    sum(CASE WHEN "NAME_CONTRACT_STATUS" = 'Refused' THEN 1 ELSE 0 END) AS prev_refused
FROM hc_previous_application
GROUP BY "SK_ID_CURR";
