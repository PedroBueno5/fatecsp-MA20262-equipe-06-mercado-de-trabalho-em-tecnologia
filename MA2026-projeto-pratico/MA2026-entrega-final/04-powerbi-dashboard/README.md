# Dashboard — Mercado de Trabalho em Tecnologia

## 1. Apresentação

Este dashboard faz parte do projeto acadêmico **Mercado de Trabalho em Tecnologia**, desenvolvido no curso da FATEC-SP.

O objetivo é apresentar uma visão geral das oportunidades de trabalho na área de Tecnologia no Brasil, permitindo analisar os dados de vagas por cargo, modalidade de trabalho e período.

## 2. Ferramenta utilizada

- Microsoft Power BI Desktop
- Linguagem DAX para criação de indicadores
- Banco de dados SQLite como base do projeto
- Arquivos CSV para importação das tabelas

## 3. Estrutura dos dados

O modelo de dados é composto por sete tabelas:

- fVagas
- dEmpresa
- dCargo
- dFonte
- dLocalidade
- dModalidade
- dCalendario

## 4. Indicadores e visualizações

O dashboard apresenta:

- Total de vagas cadastradas;
- Total de vagas reais, desconsiderando os registros simulados;
- Quantidade de vagas por cargo;
- Distribuição das vagas por modalidade de trabalho;
- Evolução das vagas ao longo dos meses.

## 5. Medidas DAX

**Total de Vagas**
```dax
Total de Vagas = COUNTROWS(fVagas)
```

**Vagas Reais**
```dax
Vagas Reais =
CALCULATE(
    COUNTROWS(fVagas),
    fVagas[Eh_Simulado] = "Não"
)
```

## 6. Observações sobre os dados

A base possui 1.052 registros, sendo 1.032 classificados como reais e 20 como simulados.

Os dados apresentam limitações de preenchimento, incluindo registros sem datas válidas e informações de modalidade não informadas. Essas limitações devem ser consideradas na interpretação dos gráficos.

## 7. Arquivo da entrega

O arquivo principal desta etapa é:

`Mercado_Trabalho_Tecnologia_G6.pbix`
