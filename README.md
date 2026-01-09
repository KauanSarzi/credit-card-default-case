# Credit Card Default Risk Analysis (BigQuery + Looker Studio)

Projeto de portfólio desenvolvido como **Capstone do Google Data Analytics Professional Certificate** com foco em um problema comum no mercado financeiro: **inadimplência (default)**.

## Objetivo
Entender **o tamanho do problema** de inadimplência e identificar **sinais de risco** que podem apoiar decisões de crédito.

---

## Dataset
- **Nome:** Default of Credit Card Clients (UCI / Kaggle)
- **Observações:** ~30 mil clientes
- **Tipo:** Dados públicos (open data)
- **Link:** [UCI Machine Learning Repository](https://www.kaggle.com/datasets/uciml/default-of-credit-card-clients-dataset)

> O dataset original possui ~30.000 linhas, porém durante a importação do CSV no BigQuery algumas linhas foram descartadas por erro de parsing (foi necessário permitir um número pequeno de registros inválidos para concluir a carga), deixando o tamanho do dataset em 29.993

---

## Ferramentas
- **Google BigQuery** (SQL) — limpeza, validação e queries
- **Looker Studio** — dashboard e visualizações
- **GitHub** — versionamento e portfólio

---

## Metodologia (Ciclo do Google)
Segui o ciclo: **Ask → Prepare → Process → Analyze → Share → Act**

### 1) Ask
#### Contexto de Negócio
Inadimplência em cartão de crédito é um problema crítico para instituições financeiras porque:
- **Perda financeira direta:** crédito concedido que não é recuperado
- **Custo de risco:** necessidade de provisões e aumento do custo de captação
- **Impacto na rentabilidade:** quanto maior o default, menor a margem da operação

Identificar **sinais de alerta precoce** permite:
- Ações preventivas (ex.: renegociação antes do default)
- Decisões de crédito mais assertivas (aprovar/negar com base em risco real)
- Redução de perdas operacionais

#### Perguntas de Negócio
1. Qual a proporção de clientes que entram em default?
2. O atraso recente no pagamento (PAY_0) está associado a maior risco?
3. O limite de crédito, sozinho, indica que o cliente é mais seguro?

#### Hipóteses

- **H0:** O default não é raro (tem um % relevante na base).

- **H1:** Atraso recente (PAY_0) é um sinal forte de risco

- **H2:** Limite de crédito ajuda, mas não explica risco sozinho
  
---

### 2) Prepare
Carreguei o CSV no BigQuery e fiz uma checagem inicial:
- contagem de linhas
- valores possíveis de variáveis importantes
- campos necessários para análise

### 3) Process (limpeza)
Criei uma tabela "clean" a partir da raw para não alterar os dados originais

Principais ajustes:
- **Idade**: mantive somente valores em faixa plausível (ex.: 18 a 100)
- **EDUCATION**: valores fora do padrão foram agrupados em uma categoria válida
- **MARRIAGE**: valores fora do padrão foram agrupados em uma categoria válida
- Padronizei nomes e tipos para facilitar análise

Checagens:
- `rows_raw` vs `rows_clean`
- distribuição de categorias após padronização
- `min(age)` / `max(age)`
- verificação de valores inválidos antes/depois

As queries usadas estão em: **scripts/create_credit_clean.sql** e **scripts/validation_checks.sql**

### 4) Analyze
Foquei em métricas simples e interpretáveis para crédito:
- `default_next_month` — flag binária de inadimplência (0 = sem default, 1 = com default)
- `PAY_0` — status de pagamento no último mês (0 = em dia, 1 = atraso 1 mês, 2+ = atraso maior)
- `limit_balance` — limite de crédito do cliente

Queries em: **scripts/analysis_querys.sql**

### 5) Share (Dashboard)
Montei um dashboard com 3 visões principais:
1. **Distribuição de clientes por status de inadimplência**
2. **Taxa de inadimplência por atraso no último mês (PAY_0)**
3. **Limite de crédito médio por status de inadimplência**

Print do dashboard: **dashboard/dashboard_screenshot.png**


### 6) Act (recomendações)
Com base nos gráficos, as recomendações são:
- Priorizar **comportamento recente** (PAY_0) como variável-chave de risco
- Evitar decisões baseadas somente no **limite de crédito**
- 3. Criar faixas simples de risco para operação:
   - PAY_0 ≤ 0 → risco mais baixo
   - PAY_0 = 1 → risco moderado (monitorar)
   - PAY_0 ≥ 2 → risco alto (ação preventiva / revisão)

---

## Principais Insights
**1) Dimensão do problema**
- **O que eu vi:** aproximadamente **22%** dos clientes entram em default na base analisada.  
- **Por que importa:** é um volume relevante e justifica tratar risco como prioridade (não é um caso “raro”).  
- **Decisão que isso apoia:** segmentar risco e priorizar ações preventivas para grupos mais vulneráveis

**2) Atraso recente é o sinal mais forte**
- **O que eu vi:** a taxa de default cresce conforme aumenta o nível de atraso no último mês (PAY_0).  
- **Por que importa:** comportamento recente de pagamento é um indicador forte e fácil de usar em regras de risco.  
- **Decisão que isso apoia:** clientes com PAY_0 ≥ 1 devem ser monitorados e tratados com mais cautela

**3) Limite alto não garante segurança**
- **O que eu vi:** clientes sem default tendem a ter limite médio maior, mas ainda existem clientes com default mesmo com limite alto
- **Por que importa:** limite de crédito isoladamente pode gerar falsas conclusões  
- **Decisão que isso apoia:** usar limite como apoio, mas sempre combinado com histórico de pagamento 

---

## Limitações / Observações
- Em valores extremos de PAY_0 (muito altos), pode haver **poucos clientes**, o que pode inflar a taxa.
- O dataset é de **Taiwan (2005)**, então comportamento pode ser diferente no Brasil ou em carteiras mais recentes.
- Não há informações de renda ou score de crédito, que seriam úteis para análise mais completa.

---

## Autor
**Kauan Sarzi da Rocha**
- LinkedIn: [Kauan Sarzi](https://linkedin.com/in/kauan-sarzi)
- Email: kauansarzi24@gmail.com
  
---

