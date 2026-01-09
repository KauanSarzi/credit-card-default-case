--versão limpa, sem mexer no raw
CREATE OR REPLACE TABLE 
  fourth-caster-477813-t0.credit_analysis.credit_clean AS
SELECT
  CAST(LIMIT_BAL AS NUMERIC) AS limit_balance,
  CAST(AGE AS INT64) AS age,

  CASE
    WHEN EDUCATION IN (1,2,3,4) THEN EDUCATION
    ELSE 4
  END AS education_clean,
  
  CASE 
    WHEN MARRIAGE IN (1,2,3) THEN MARRIAGE
    ELSE 3
  END AS marriage_clean,

  --mantido da mesma forma, pq representa comportamento de verdade
  PAY_0,PAY_2,PAY_3,PAY_4,PAY_5,PAY_6,

  BILL_AMT1,BILL_AMT2,BILL_AMT3,BILL_AMT4,BILL_AMT5,BILL_AMT6,

  PAY_AMT1,PAY_AMT2,PAY_AMT3,PAY_AMT4,PAY_AMT5,PAY_AMT6,

  default_payment_next_month AS default_next_month
FROM `fourth-caster-477813-t0.credit_analysis.credit_raw`
WHERE CAST(AGE AS INT64) BETWEEN 18 AND 100;





  










