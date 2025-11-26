# Insights da Análise SQL – Superstore

Este relatório consolida os principais achados obtidos a partir das consultas SQL aplicadas ao dataset Superstore, com foco em receita, margem, comportamento de compra e sazonalidade. 
Além dos insights quantitativos, são apresentados impactos estratégicos que orientam ações práticas de negócio.

---

## 1. Visão Geral
- Total de pedidos analisados: 9994
- Receita total: R$ 2.297.200,86
- Número de clientes únicos: 793
- Ticket médio: R$ 458,61

Esses indicadores apresentam uma visão macro do desempenho comercial e servem como base para contextualizar os insights subsequentes.

---

## 2. Principais Insights

### Insight 1 — Concentração em poucos produtos
- Os 10 produtos mais vendidos representam 10,6% do volume total.
- Esses mesmos produtos representam 10,6% da receita total.

**Impacto:** Alta dependência de poucos itens, aumentando risco operacional e apontando necessidade de diversificação do portfólio.

---

### Insight 2 — Categoria 'Technology' domina a receita e a margem
- A categoria *Technology* soma 36.4% da receita total.
- A categoria *Technology* apresenta maior margem média (15.6%).

**Impacto:** Segmento crítico para o resultado: requer priorização em estoque, campanhas e proteção contra queda de demanda.

---

### Insight 3 — Estados 'California' e 'New York' lideram faturamento
- Estado 'California': R$ 457.687,63 em vendas.
- Estado 'New York': R$ 310.876,27 em vendas.

**Impacto:** Mercados-chave a serem protegidos e otimizados; indica oportunidade de expansão nas regiões de menor participação.

---

### Insight 4 — Pico sazonal em 11/2017
- Mês 11/2017 é consistentemente o período com maior volume (1840).

**Impacto:** Possibilita planejamento antecipado de estoque e ações promocionais para maximizar receita no principal período do ano.

---

## 3. Consultas Utilizadas
As queries utilizadas para gerar cada insight estão na pasta **queries**