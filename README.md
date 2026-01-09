# Credit Card Default Risk Analysis (BigQuery + Looker Studio)

Projeto de portfólio desenvolvido como **Capstone do Google Data Analytics Professional Certificate** com foco em um problema comum no mercado financeiro: **inadimplência (default)**.

## Objetivo
Entender **o tamanho do problema** de inadimplência e identificar **sinais de risco** que podem apoiar decisões de crédito.

Perguntas que eu quis responder:
1. Qual a proporção de clientes que entram em default?
2. O atraso recente no pagamento (PAY_0) está associado a maior risco?
3. O limite de crédito, sozinho, indica que o cliente é mais seguro?

---

## Dataset
- **Nome:** Default of Credit Card Clients (UCI / Kaggle)
- **Observações:** ~30 mil clientes
- **Tipo:** Dados públicos (open data)

> Importante: o dataset é público e a fonte deve ser citada para evitar plágio.

---

## Ferramentas
- **Google BigQuery** (SQL) — limpeza, validação e queries
- **Looker Studio** — dashboard e visualizações
- **GitHub** — versionamento e portfólio

---

## Metodologia (Ciclo do Google)
Segui o ciclo: **Ask → Prepare → Process → Analyze → Share → Act**

### 1) Ask
Defini as perguntas acima focadas em risco e inadimplência.

### 2) Prepare
Carreguei o CSV no BigQuery e fiz uma checagem inicial:
- contagem de linhas
- valores possíveis de variáveis importantes
- campos necessários para análise

### 3) Process (limpeza)
Criei uma tabela "clean" a partir da raw para não alterar os dados originais.

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
- **Taxa de default** (default_next_month)
- **Atraso recente** (PAY_0)
- **Limite de crédito** (limit_balance)

Queries em: **scripts/analysis_querys.sql**

### 5) Share (Dashboard)
Montei um dashboard com 3 visões principais:
1. **Distribuição de clientes por status de inadimplência**
2. **Taxa de inadimplência por atraso no último mês (PAY_0)**
3. **Limite de crédito médio por status de inadimplência**

📷 Print do dashboard: **dashboard/dashboard.png**

### 6) Act (recomendações)
Com base nos gráficos, as recomendações são:
- Priorizar **comportamento recente** (PAY_0) como variável-chave de risco
- Evitar decisões baseadas somente no **limite de crédito**
- Criar faixas operacionais de risco 

---

## Principais Insights
**1) Dimensão do problema**
- Aproximadamente **22%** dos clientes entram em default na base analisada.

**2) Atraso recente é o sinal mais forte**
- A taxa de inadimplência cresce bastante conforme aumenta o atraso no último mês (PAY_0).
- A partir de atraso ≥ 1, o risco aumenta de forma relevante.

**3) Limite alto não garante segurança**
- Clientes sem default tendem a ter **limite médio maior**, mas ainda existem inadimplentes com limites altos.
- Portanto, limite de crédito isoladamente não é um bom critério de risco.

---

## Como reproduzir (passo a passo)
1. Importar o dataset para o BigQuery (tabela raw)
2. Executar o script de limpeza:
   - `scripts/create_credit_clean.sql`
3. Rodar validações:
   - `scripts/validation_checks.sql`
4. Rodar queries de análise:
   - `scripts/analysis_querys.sql`
5. Conectar o Looker Studio no BigQuery e montar os gráficos

---

## Autor
**Kauan Sarzi da Rocha**
- LinkedIn: Kauan Sarzi
  
---

