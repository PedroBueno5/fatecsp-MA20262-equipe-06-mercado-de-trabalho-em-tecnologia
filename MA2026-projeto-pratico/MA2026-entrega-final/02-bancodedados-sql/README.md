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
- Registros não simulados com salário de referência: 161.

## Ressalvas de qualidade
1. Os 20 registros simulados não representam anúncios reais. As consultas principais os excluem.
2. 99 registros estão sem Data_ID válido. Não foram atribuídas datas artificiais.
3. 1.024 dos 1.032 registros não simulados estão classificados como modalidade `Não informado`; portanto, a análise de modalidade é muito limitada.
4. Os salários apresentam valores extremos e a unidade/escala não foi validada na fonte. Não publicar interpretação salarial sem conferência.
5. 99 linhas multilinha permanecem preservadas para revisão; não foram divididas por suposição.
6. Há registros com cargo/empresa/localidade `Não informado`, que afetam rankings. Interpretar os resultados com essa ressalva.

## API
Os guias fornecidos descrevem o método e a necessidade de adaptar fontes externas ao tema, mas não identificam uma API específica para esta equipe. Nenhuma integração externa foi simulada ou declarada como concluída neste pacote. Se a proposta técnica exigir API, a fonte e o escopo devem ser aprovados/definidos antes de acrescentar dados ao banco.
