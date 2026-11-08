# Etapa 02 - Power Query: Mercado de Trabalho em Tecnologia

## Resumo da Etapa

Automacao do processo de ingestao, limpeza, padronizacao e auditabilidade dos dados de vagas de emprego na area de tecnologia via Power Query (Linguagem M). O fluxo garante a integridade dos dados capturados, separando os registros validos para analise da base de rejeitados.

## Estrutura dos Arquivos da Entrega

* CafeData_02_PowerQuery.xlsx: Arquivo principal contendo as consultas em Power Query e o painel de reconciliacao.
* scripts_m/: Scripts com o codigo fonte M das consultas (.pq).
* dados_limpos/fVagas.csv: Base tratada final exportada em UTF-8.
* evidencias/: Capturas de tela comprovando a reconciliacao e o painel de consultas.

## Parametro de Origem

* pArquivoEtapa1: Caminho configurado para a leitura dos dados brutos e cadastros de origem da Etapa 01.

## Consultas Desenvolvidas

* stg_Vagas_Bruto: Consulta de staging para leitura inicial dos dados brutos de vagas.
* fVagas: Tabela fato tratada contendo apenas registros validos com os campos: ID_Registro, Fonte, ID_Vaga_Original, Cargo_Original, Comprimento_Cargo, Termo_Buscado, Empresa, Localidade, Salario_Minimo, Salario_Maximo, Data_Publicacao_Raw, Linha_Origem.
* fVagas_Rejeitados: Tabela de auditoria que armazena os registros descartados por inconsistencias ou campos essenciais ausentes.
* fAuditoria_Reconciliacao: Consulta de controle responsavel por validar a contagem dos registros de entrada e saida.

## Reconciliacao de Auditoria (Diferenca ZERO)

Verificacao realizada na aba fConferencia para garantir zero perda de dados:

* Registros Brutos Lidos (stg_Vagas_Bruto): 1.150
* Registros Validos Aceitos (fVagas): 1.115
* Registros Inconsistentes Rejeitados (fVagas_Rejeitados): 35
* Total Reconciliado (Aceitos + Rejeitados): 1.150
* Diferenca de Reconciliacao: 0
