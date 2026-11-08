Etapa 01 - Excel Avancado: Painel de Vagas (Mercado de Trabalho)

Resumo da Etapa

Tratamento, organizacao e padronizacao dos dados brutos do mercado de trabalho em ambiente Excel, mantendo a base original intocada e criando uma estrutura auditavel de vagas, cadastros auxiliares e inconsistencias.

Estrutura de Arquivos

CafeData_01_Excel.xlsx: Planilha principal contendo as quatro abas obrigatorias do projeto.

Abas do Arquivo

Bruto: Copia fiel e intocada dos dados brutos capturados de vagas (prova de origem).

Tratado (Tab_Vagas): Base de trabalho com colunas tratadas, buscas via PROCX, colunas auxiliares de calculo e status de verificacao de qualidade.

Cadastros: Tabelas estruturadas de apoio (Tab_Fontes, Tab_Modalidades, Tab_Status e Listas de validacao).

Auditoria (Tab_Auditoria): Registro individual das vagas com inconsistencias e Painel de Conferencias com saldo zero.

Regras de Negocio e Tratamentos

Padronizacao de cargos e termos buscados via ARRUMAR, PRI.MAIUSCULA e MINUSCULA.

Tratamento de empresas ausentes ("Nao informada" convertido para "Nao Informado").

Identificacao e sinalizacao de cargos truncados (comprimento de texto maior que 80 caracteres).

Identificacao de vagas sem declaracao salarial (salario zero) e alerta de salarios atipicos/escala anual (acima de R$ 40.000,00).

Mapeamento de fontes oficiais via busca em tabela de cadastro com PROCX.

Painel de Conferencias (Auditoria)

Total de Registros Lidos (Bruto): 1.150

Registros com Salario Informado: 182

Registros sem Salario (Muitos Nulos): 968

Inconsistencias Registradas na Tab_Auditoria: 251

Diferenca da Reconciliacao (Detectados - Registrados): 0

Erros de Formula: 0
