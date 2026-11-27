# Etapa SQL — Mercado de Trabalho em Tecnologia

## Conteúdo
- `mercado_tecnologia.db`: banco SQLite já carregado.
- `sql/mercado_ddl.sql`: criação de tabelas, PK, FK, CHECK e índices.
- `sql/mercado_carga.sql`: carga completa das dimensões e da fato.
- `sql/mercado_consultas.sql`: cinco consultas analíticas.
- `sql/mercado_views.sql`: views dimensionais para o Power BI.
- `sql/mercado_conferencia.sql`: verificações de integridade.
- `csv/`: exportações de referência usadas na carga.
- `docs/modelo_relacional.md`: documentação do modelo.
- `evidencias/`: resultados reproduzíveis da conferência.

## Ordem de execução
Em um banco SQLite vazio, executar:
1. `sql/mercado_ddl.sql`
2. `sql/mercado_carga.sql`
3. `sql/mercado_views.sql`
4. `sql/mercado_conferencia.sql`
5. `sql/mercado_consultas.sql`

Os scripts foram testados em SQLite. O script de carga insere as dimensões antes da tabela fato para respeitar as chaves estrangeiras.

## Resultado da conferência executada
- fVagas: 1.052 registros.
- dEmpresa: 538.
- dCargo: 313.
- dFonte: 4.
- dLocalidade: 149.
- dModalidade: 4.
- dCalendario: 1.586.
- IDs de registro duplicados: 0.
- Violações de chave estrangeira: 0.
- Registros sem Data_ID: 99.
- Registros não simulados: 1.032.
- Registros simulados: 20.
- Registros não simulados com salário de referência: 16
