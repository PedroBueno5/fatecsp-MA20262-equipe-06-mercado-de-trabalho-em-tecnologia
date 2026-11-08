let
    Fonte = stg_Vagas_Bruto,
    SemLinhasEmBranco = Table.SelectRows(Fonte, each ([Cargo_Original] <> null and [Cargo_Original] <> "") or ([ID_Vaga_Original] <> null and [ID_Vaga_Original] <> "")),
    SemIDVagaVazio = Table.SelectRows(SemLinhasEmBranco, each [ID_Vaga_Original] <> null and Text.Trim(Text.From([ID_Vaga_Original])) <> ""),
    #"Tipo Alterado com Localidade" = Table.TransformColumnTypes(SemIDVagaVazio, {{"Salario_Minimo", type number}}, "pt-BR"),
    #"Tipo Alterado com Localidade1" = Table.TransformColumnTypes(#"Tipo Alterado com Localidade", {{"Salario_Maximo", type number}}, "pt-BR"),
    #"Texto Aparado" = Table.TransformColumns(#"Tipo Alterado com Localidade1",{{"Cargo_Original", Text.Trim, type text}}),
    #"Duplicatas Removidas" = Table.Distinct(#"Texto Aparado", {"ID_Vaga_Original"}),
    DataConvertida = Table.TransformColumns(#"Duplicatas Removidas", {{"Data_Publicacao_Raw", each if _ = null then null else Date.From(Text.Start(Text.From(_), 10)), type date}})
in
    DataConvertida