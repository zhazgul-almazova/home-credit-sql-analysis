🇷🇺 Russian version: [README_RU.md](README_RU.md)

# Home Credit Default Risk — SQL Analysis

## Business Problem
Home Credit Group provides loans to clients who have little or no 
credit history. The challenge is identifying which clients are likely 
to default before approving their application. This project analyzes 
client behavior patterns to understand what drives loan default and 
which risk indicators should be prioritized during loan approval.

## Business Questions
1. What is the overall default rate and is the dataset balanced enough for analysis?
2. Do clients with poor payment history default more often?
3. Does income or loan size influence the likelihood of default?
4. Does previous credit history predict current default behavior?
5. Which factors are the strongest predictors of credit risk?

## Analysis Workflow
1. Imported 4 CSV files into PostgreSQL via DBeaver
2. Handled missing values using COALESCE where appropriate
3. Aggregated credit bureau history per client (`bureau_agg`)
4. Aggregated previous loan applications per client (`prev_appl_agg`)
5. Aggregated installment payment history per client (`inst_payments`)
6. Joined all tables to the main application table using LEFT JOIN
7. Performed exploratory analysis comparing default vs non-default clients

## SQL Skills Demonstrated
- LEFT JOIN across 4 tables
- Aggregations (SUM, COUNT, MAX, AVG)
- CASE WHEN for conditional counting
- COALESCE for null handling
- GROUP BY and ROUND
- CREATE TABLE AS SELECT

## Dataset

| File | Raw Rows | After Aggregation | Description |
|---|---|---|---|
| application_train | 307,511 | 307,511 | Main loan applications |
| bureau | 1,716,428 | 305,811 | Credit history from other banks |
| previous_application | 1,670,214 | 338,857 | Previous loan applications |
| installments_payments | 13,600,000+ | 339,587 | Installment payment history |

All transactional tables were aggregated to client level (`SK_ID_CURR`) before joining with the main application table.

## Metrics Table

| Metric | Non-Default (0) | Default (1) |
|---|---|---|
| Count | 282,686 | 24,825 |
| Share | 91.93% | 8.07% |
| Avg Income | 169,078 | 165,612 |
| Avg Credit Amount | 602,648 | 557,779 |
| Avg Credits Count | 6 | 6 |
| Avg Max Overdue | 6,359 | 8,922 |
| Avg Missed Payments | 4 | 5 |

## Repository Structure

```text
sql/
├── 01_bureau_agg.sql       — credit bureau aggregation
├── 02_prev_appl_agg.sql    — previous applications aggregation
├── 03_inst_payments.sql    — installment payments aggregation
├── 04_final_dataset.sql    — joining all tables
└── 05_analysis.sql         — exploratory analysis queries

Key Findings & Conclusions

1. Default rate: 8.07%

Only 1 in 12 clients defaulted. The dataset is heavily imbalanced,
which means that raw accuracy can be misleading. Risk models must
account for this imbalance.

2. Payment behavior is the strongest predictor

Defaulters missed more payments on average (5 vs 4) and had 40%
higher maximum overdue amounts (8,922 vs 6,359). Poor payment
discipline is the clearest early warning sign of future default.

3. Income and loan size are weak predictors

Defaulters had only slightly lower income (165,612 vs 169,078) and
smaller loans (557,779 vs 602,648). These differences are too small
to be reliable risk indicators on their own.

4. Credit history matters

Clients with higher historical overdue amounts are significantly more
likely to default, confirming that past behavior predicts future behavior.

5. Recommendations

Payment history and overdue amounts are stronger risk indicators than
income or loan size. Loan applications from clients with frequent
missed payments or high historical overdue amounts should be flagged
for additional review during loan approval.

Data Source

Kaggle — Home Credit Default Risk
