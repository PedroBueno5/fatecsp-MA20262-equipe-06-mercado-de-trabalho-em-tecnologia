# Etapa VBA — Automação e auditoria da base de vagas

## Objetivo
O módulo `modAutomacaoVagas.bas` atualiza consultas/conexões do Excel e gera a aba `Relatorio_VBA` com data/hora, tabela analisada, quantidade de registros e colunas e quantidade/percentual de células vazias por coluna.

## Pré-requisitos
- Microsoft Excel para Windows com suporte a macros.
- Base de vagas carregada e formatada como Tabela do Excel (`Ctrl+T`).
- Consultas/conexões configuradas no arquivo, caso se deseje atualizar a origem.

## Instalação
1. Abra uma cópia do arquivo Excel com a base e salve como **Pasta de Trabalho Habilitada para Macro (*.xlsm)**.
2. Pressione `Alt + F11` para abrir o Editor do VBA.
3. Use **Arquivo > Importar arquivo** e selecione `modAutomacaoVagas.bas`.
4. Feche o editor e habilite macros, se solicitado.

## Execução
1. Pressione `Alt + F8`.
2. Selecione `AtualizarEAuditarVagas` e clique em **Executar**.
3. Consulte a aba `Relatorio_VBA`.

## Observações
- A macro analisa a primeira Tabela do Excel encontrada no arquivo. Se houver várias, organize a tabela principal para ser a primeira encontrada.
- Se não houver tabela, selecione a base e use `Ctrl+T`.
- A atualização depende das conexões e consultas já configuradas.
- A aba `Relatorio_VBA` é substituída a cada execução.

