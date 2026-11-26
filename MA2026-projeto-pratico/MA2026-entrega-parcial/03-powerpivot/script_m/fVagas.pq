let
    Fonte = cad_Etapa2{[Item = "fVagas", Kind = "Table"]}[Data],
    Tipos = Table.TransformColumnTypes(Fonte, {
        {"ID_Registro", type text}, 
        {"Fonte", type text}, 
        {"ID_Vaga_Original", type text}, 
        {"Cargo_Original", type text}, 
        {"Empresa", type text}, 
        {"Localidade", type text}, 
        {"Salario_Minimo", Currency.Type}, 
        {"Salario_Maximo", Currency.Type}, 
        {"Data_Publicacao_Raw", type date}, 
        {"Linha_Origem", Int64.Type}}
    )
in
    Tipos