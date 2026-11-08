# Etapa 02 - Power Query

## 📌 Resumo da Etapa

Automatização da leitura, limpeza e consolidação dos dados brutos de vendas das filiais através de consultas na linguagem M (Power Query), separando dados válidos de registros rejeitados.

## 📁 Estrutura da Entrega

* **`CafeData_02_PowerQuery.xlsx`**: Arquivo principal do Excel com as consultas estruturadas.
* **`scripts_m/`**: Códigos fonte das consultas em linguagem M (`.pq`).
* **`dados_limpos/`**: Exportação da tabela fato tratada (`fVendas.csv` em UTF-8).
* **`evidencias/`**: Capturas de tela das conferências e do painel de consultas.

## ⚙️ Parâmetros Utilizados

* **`pPastaVendas`**: Caminho da pasta contendo as planilhas das filiais (`dados_brutos/vendas/`).
* **`pArquivoEtapa1`**: Arquivo de cadastros da Etapa 1 (`CafeData_01_Excel.xlsx`).
* **`pArquivoMetas`**: Arquivo com as metas mensais (`metas_mensais.xlsx`).

## 📊 Principais Consultas

* **`stg_Vendas_Bruto`**: Leitura automatizada da pasta de vendas.
* **`fVendas`**: Tabela fato final tratada, validada e sem nulos ou duplicatas.
* **`Rejeitados`**: Registro de linhas descartadas com o motivo da inconsistência.
* **`dProduto` / `dFilial`**: Tabelas de dimensão importadas dos cadastros da Etapa 1.
* **`fMetas`**: Dados de metas mensais despivotados para formato longo.

## 🔄 Relatório de Reconciliação (Auditoria)

Validado na aba `Conferencia` com diferença zero:

* **Linhas Lidas (Staging)**: Linhas totais importadas de todas as filiais.
* **Aceitas (`fVendas`)**: Registros válidos no modelo fato.
* **Rejeitadas (`Rejeitados`)**: Linhas descartadas por regras de negócio.
* **Diferença**: **0** *(Linhas Lidas - Aceitas - Rejeitadas)*