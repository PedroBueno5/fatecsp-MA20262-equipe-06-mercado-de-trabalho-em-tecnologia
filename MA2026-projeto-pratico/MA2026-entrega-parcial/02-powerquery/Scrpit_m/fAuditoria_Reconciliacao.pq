let
    Bruto = Table.RowCount(stg_Vagas_Bruto),
    Final = Table.RowCount(fVagas),
    Rejeitados = Table.RowCount(fVagas_Rejeitados),
    
    TabelaAuditoria = #table(
        {"Metrica", "Quantidade"},
        {
            {"Total Bruto (Staging)", Bruto},
            {"Total Tratado (fVagas)", Final},
            {"Total Rejeitados", Rejeitados},
            {"Diferença (Staging - (Final + Rejeitados))", Bruto - (Final + Rejeitados)}
        }
    )
in
    TabelaAuditoria