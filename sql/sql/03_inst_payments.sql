-- Installments payments aggregation
-- One row per client with payment history summary

CREATE TABLE inst_payments AS 
SELECT 
"SK_ID_CURR",
count(*) AS inst_count,
sum (COALESCE ("AMT_INSTALMENT",0 )) AS total_instalment,
sum (COALESCE ("AMT_PAYMENT",0)) AS total_paid,
sum (CASE WHEN "AMT_INSTALMENT" > "AMT_PAYMENT" then 1 else 0 end) as missed_payments
from hc_installments_payments
group by "SK_ID_CURR"
