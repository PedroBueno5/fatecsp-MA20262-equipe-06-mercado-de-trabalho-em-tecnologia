# Modelo relacional — Mercado de Trabalho em Tecnologia

## Grão
Uma linha da tabela `fVagas` representa um registro de vaga identificado por `ID_Registro`. A estrutura segue a tabela fato da Etapa 3, sem criar um cabeçalho/itens artificial, pois uma vaga publicada é o evento analisado.

## Tabelas
- `fVagas`: fato com IDs dimensionais, campos originais, datas, salários, qualidade, natureza do dado e URL.
- `dEmpresa`: cadastro de empresas.
- `dCargo`: cadastro de cargos.
- `dFonte`: origem do registro.
- `dLocalidade`: localidade padronizada.
- `dModalidade`: modalidade de trabalho padronizada.
- `dCalendario`: calendário associado às datas válidas.

## Relacionamentos
Cada dimensão possui chave primária e se relaciona com `fVagas` por chave estrangeira (N:1 do ponto de vista da fato). `Data_ID` é anulável para os registros sem data válida. As demais chaves estrangeiras categóricas foram conferidas.

## Regras
- `ID_Registro` é chave primária da fato.
- IDs dimensionais são chaves primárias.
- Salários não podem ser negativos.
- Se mínimo e máximo estiverem presentes, máximo não pode ser menor que mínimo.
- `Eh_Simulado` e `Tem_Salario` aceitam `Sim` ou `Não`.
- Dados simulados permanecem identificados e separados dos dados fornecidos pelas fontes.

## Origem
Tabelas CSV exportadas do pacote da Etapa 3 (`dados_modelo/`). Os registros não foram reconstruídos nem enriquecidos por inferência nesta etapa.
