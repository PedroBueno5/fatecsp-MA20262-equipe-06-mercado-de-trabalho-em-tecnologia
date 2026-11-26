let
    Origem = stg_Vagas_Bruto,
    FiltrarRejeitados = Table.SelectRows(Origem, 
        each List.PositionOf(stg_Vagas_Bruto[ID_Vaga_Original], [ID_Vaga_Original]) <> [Linha_Origem] - 2
    )
in
    FiltrarRejeitados