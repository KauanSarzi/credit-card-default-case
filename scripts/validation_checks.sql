--CHECAGENS PADRÃO PARA CONFIRMAR A LIMPEZA 

 -- check 1:comparar quantidade de linhas
SELECT
  (SELECT COUNT(*) FROM `fourth-caster-477813-t0.credit_analysis.credit_raw`) AS raw_rows,
  (SELECT COUNT(*) FROM `fourth-caster-477813-t0.credit_analysis.credit_clean`) AS clean_rows;

--check 2:idade mínima e máxima na clean
SELECT 
  COUNT(*) AS total_rows,
  MIN(age) AS min_age,
  MAX(age) AS max_age
FROM `fourth-caster-477813-t0.credit_analysis.credit_clean`;

-- check 3:distribuição de education_clean 
SELECT
  education_clean,
  COUNT(*) AS total
FROM `fourth-caster-477813-t0.credit_analysis.credit_clean`
GROUP BY education_clean
ORDER BY education_clean;

--check 4:distribuição de marriage_clean
SELECT
  marriage_clean,
  COUNT(*) AS total
FROM `fourth-caster-477813-t0.credit_analysis.credit_clean`
GROUP BY marriage_clean
ORDER BY marriage_clean;

--check 5:verificar se default é binario
SELECT
  default_next_month,
  COUNT(*) AS total
FROM `fourth-caster-477813-t0.credit_analysis.credit_clean`
GROUP BY default_next_month
ORDER BY default_next_month;

--check6:ver nulos nas principais colunas
SELECT
  COUNTIF(limit_balance IS NULL) AS null_limit_balance,
  COUNTIF(age IS NULL) AS null_age,
  COUNTIF(default_next_month IS NULL) AS null_default,
  COUNTIF(pay_0 IS NULL) AS null_pay_0
FROM `fourth-caster-477813-t0.credit_analysis.credit_clean`;

--check 7: ver quantidade de clientes por PAY_0 para saber gps pequenos
SELECT
  pay_0,
  COUNT(*) AS total_clientes
FROM `fourth-caster-477813-t0.credit_analysis.credit_clean`
GROUP BY pay_0
ORDER BY pay_0;