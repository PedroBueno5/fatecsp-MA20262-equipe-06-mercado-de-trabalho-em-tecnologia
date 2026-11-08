# Etapa 03 - Power Pivot & DAX: Mercado de Trabalho em Tecnologia

## Resumo da Etapa

Construção do modelo relacional em estrela (Star Schema) no Power Pivot do Excel a partir das tabelas tratadas na Etapa 02. Esta etapa estabelece a modelagem de dados conectando a tabela fato de vagas (`fVagas`), a dimensão de tempo (`dCalendario`), e mantendo a tabela de auditoria (`fVagas_Rejeitados`) fora do relacionamento, permitindo a criação de KPIs analíticos via DAX com auditabilidade total.

## Estrutura da Pasta `03-powerpivot/`

* `CafeData_03_PowerPivot.xlsx`: Arquivo principal contendo o Modelo de Dados, a aba de Validação (tabelas dinâmicas) e a aba de Conferência (funções `VALORCUBO`).
* `dax/medidas_preliminares.dax`: Código-fonte de todas as medidas DAX exportadas em formato UTF-8.
* `docs/modelo_relacional.md`: Documentação técnica detalhada das tabelas e relacionamentos do modelo relacional.
* `docs/diagrama_modelo.png`: Captura da tela da Exibição de Diagrama no Power Pivot.
* `scripts_m/dCalendario.pq`: Código M utilizado para a geração da dimensão de tempo contínua.
* `evidencias/`: Capturas de tela comprovando as tabelas dinâmicas de validação e a conferência de diferença zero.

## Parâmetro de Origem

* `pArquivoEtapa2`: Caminho para leitura dinâmica dos dados tratados e auditados no arquivo da Etapa 02 (`02-powerquery/CafeData_02_PowerQuery.xlsx`).

## Estrutura do Modelo de Dados

### 1. Tabelas Fato e Auditoria

* `fVagas`: Tabela fato principal contendo os 1.115 registros válidos de vagas de tecnologia.
* `Tratado`: Consulta de staging para auditabilidade dos dados limpos da Etapa 01/02.
* `fVagas_Rejeitados`: Tabela de auditoria isolada contendo os 35 registros descartados por inconsistências.

### 2. Dimensões

* `dCalendario`: Dimensão de tempo gerada via Power Query (coberta continuous de datas) e marcada como Tabela de Datas no Power Pivot.

## Medidas DAX Desenvolvidas

As seguintes medidas foram criadas na Área de Cálculo do modelo para responder à demanda e às faixas salariais do mercado de TI:

```dax
// Volume Total de Vagas Bruto da Base de Entrada
Total Vagas Bruto := COUNTROWS(Tratado)

// Total de Registros Descartados na Auditoria
Conf Linhas Rejeitados := COUNTROWS(fVagas_Rejeitados)

// Total de Vagas Válidas no Modelo Fato
Total Vagas := COUNTROWS(fVagas)

// Média do Salário Mínimo Ofertado
Media Salario Minimo := AVERAGE(fVagas[Salario_Minimo])

// Média do Salário Máximo Ofertado
Media Salario Maximo := AVERAGE(fVagas[Salario_Maximo])
```

## Painel de Validação e Conferência (`fConferencia`)

O modelo foi auditado utilizando funções `VALORCUBO` na aba `fConferencia`, garantindo 100% de precisão numérica em relação aos dados tratados na Etapa 02:

| Indicador | Etapa 02 (Referência) | Modelo Etapa 03 | Diferença |
| :--- | :---: | :---: | :---: |
| **Total Vagas Bruto** | 1.150 | 1.150 | **0** |
| **Total Vagas Validadas (`fVagas`)** | 1.115 | 1.115 | **0** |
| **Linhas Rejeitadas (`fVagas_Rejeitados`)** | 35 | 35 | **0** |
| **Integridade de Linhas Lidas** | 1.150 | 1.150 | **0** |

**Resultado da Auditoria:** Diferença Zero obtida em todos os testes de conciliação.