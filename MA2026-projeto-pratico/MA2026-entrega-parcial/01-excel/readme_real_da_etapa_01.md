# Etapa 01 - Excel Avancado: Mercado de Trabalho em Tecnologia

## Resumo da Etapa

Tratamento, padronizacao e organizacao dos dados brutos do mercado de trabalho em tecnologia em ambiente Excel. O processo mantem a base de dados original intocada (Read-Only) e estabelece uma estrutura com rastreabilidade, listas de cadastro auxiliar, regras de negocio e auditoria com reconciliacao de diferenca zero.

## Estrutura de Arquivos

* CafeData_01_Excel.xlsx: Planilha principal contendo as quatro abas obrigatorias do projeto.

## Estrutura das Abas do Arquivo

* Bruto: Copia intocada dos dados brutos de vagas capturados das plataformas (prova de origem de dados).

* Tratado (Tab_Vagas): Base estruturada de trabalho com colunas tratadas, calculadas, validaçoes e definicao de status de qualidade.

* Cadastros: Tabelas auxiliares e listas oficiais de apoio (Tab_Fontes, Tab_Modalidades, Tab_Status e Listas de Validacao).

* Auditoria (Tab_Auditoria): Registro individual dos 251 alertas e inconsistencias detectadas e Painel de Conferencias com reconciliacao de saldo zero.

## Colunas e Regras Aplicadas na Aba Tratado

* Linha_Origem: Identificador estatico da linha de origem na aba Bruto (garantia de rastreabilidade).
* Fonte: Identificacao da origem dos dados capturados via PROCX na Tab_Fontes.
* Cargo_Trat: Padronizacao do cargo utilizando PRI.MAIUSCULA e ARRUMAR.
* Comprimento_Cargo: Calculo de caracteres via NUM.CARACT.
* Termo_Buscado: Padronizacao do termo de busca em letras minusculas via MINUSCULA e ARRUMAR.
* Empresa_Trat: Tratamento de empresas nao informadas ("Nao informada" convertido para "Nao Informado").
* Localidade_Trat: Padronizacao geografica via PRI.MAIUSCULA e ARRUMAR.
* Salario_Minimo e Salario_Maximo: Formatacao numerica e conversao de valores.
* Data_Publicacao_Raw: Preservacao do registro de data original.
* Tem_Salario: Indicador binario via SE e OU (Sim/Nao) para presenca de informacao salarial.
* Alerta_Truncamento: Sinalizacao de cargos com mais de 80 caracteres ("Truncado" ou "OK").
* Alerta_Escala_Salario: Identificacao de salarios superiores a R$ 40.000,00 ("Salario Atipico (Escala Anual)" ou "OK").
* Status_Qualidade: Classificacao do registro via PROCX na Tab_Status (OK, Revisar ou Incompleto).
* Problemas: Consolidacao textual dos alertas encontrados na vaga via UNIRTEXTO.

## Painel de Conferencias e Reconciliacao (Aba Auditoria)

* Total de Registros Lidos (Bruto): 1.150
* Registros com Salario Informado: 182
* Registros sem Declaracao Salarial: 968
* Registros com Empresa Nao Informada: 214
* Alertas de Cargo Truncado (> 80 caracteres): 12
* Alertas de Salario Atipico / Escala Anual (> R$ 40.000,00): 5
* Linhas Inseridas na Tab_Auditoria: 251
* Reconciliacao (Detectados - Registrados): 0