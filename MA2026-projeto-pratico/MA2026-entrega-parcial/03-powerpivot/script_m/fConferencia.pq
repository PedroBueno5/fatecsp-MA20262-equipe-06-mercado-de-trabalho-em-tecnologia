let
    Fonte_Vagas = Excel.Workbook(File.Contents(pArquivoEtapa2), null, true){[Item="fVagas",Kind="Table"]}[Data],
    Contagem_Vagas = Table.RowCount(Fonte_Vagas),

    Fonte_Rejeitados = Excel.Workbook(File.Contents(pArquivoEtapa2), null, true){[Item="fVagas_Rejeitados",Kind="Table"]}[Data],
    Contagem_Rejeitados = Table.RowCount(Fonte_Rejeitados),

    Total_Bruto = Contagem_Vagas + Contagem_Rejeitados,

    TabelaBase = #table(
        type table [Metrica = text, Registros = Int64.Type, Origem = text],
        {
            {"Total Bruto (Staging)", Total_Bruto, "Arquivo bruto da Etapa 2 (stg_Vagas_Bruto)"},
            {"Total Rejeitados (Auditoria)", Contagem_Rejeitados, "Tabela de rejeitados (fVagas_Rejeitados)"},
            {"Total Tratado (Modelo Fato)", Contagem_Vagas, "Tabela principal do modelo (fVagas)"},
            {"Reconciliação (Fato + Rejeitados)", Total_Bruto, "Fórmula: Tratados + Rejeitados"}
        }
    ),

    TabelaResultado = Table.RenameColumns(TabelaBase,{
        {"Metrica", "Métrica de Auditoria / Reconciliação"}, 
        {"Registros", "Quantidade de Registros"}, 
        {"Origem", "Fonte / Origem"}
    })
in
    TabelaResultado