--Querys usadas para responder as hipóteses e montar o dashboard

-- Q1: Qual a proporção de clientes em default?
SELECT
  default_next_month,
  COUNT(*) AS total_clientes,
  ROUND(
    COUNT(*) / SUM(COUNT(*)) OVER () * 100,
    2
  ) AS porcent_clientes
FROM `fourth-caster-477813-t0.credit_analysis.credit_clean`
GROUP BY default_next_month
ORDER BY default_next_month;

-- hipótese 1: atraso recente aumenta a taxa de default?
SELECT
  PAY_0,
  COUNT(*) AS total_clientes,
  SUM(default_next_month) AS defaults,
  ROUND(SUM(default_next_month) / COUNT(*), 3) AS default_rate
FROM `fourth-caster-477813-t0.credit_analysis.credit_clean`
GROUP BY PAY_0
ORDER BY PAY_0;

--hipótese 2: limite de crédito sozinho indica menor risco?
SELECT
  default_next_month,
  COUNT(*) AS total_clientes,
  ROUND(AVG(limit_balance), 0) AS limite_medio
FROM `fourth-caster-477813-t0.credit_analysis.credit_clean`
WHERE limit_balance IS NOT NULL
GROUP BY default_next_month
ORDER BY default_next_month;

