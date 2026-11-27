-- Camada analítica em estrela para o Power BI
CREATE VIEW vw_dim_empresa AS SELECT Empresa_ID, Empresa FROM dEmpresa;
CREATE VIEW vw_dim_cargo AS SELECT Cargo_ID, Cargo FROM dCargo;
CREATE VIEW vw_dim_fonte AS SELECT Fonte_ID, Fonte FROM dFonte;
CREATE VIEW vw_dim_localidade AS SELECT Localidade_ID, Localidade FROM dLocalidade;
CREATE VIEW vw_dim_modalidade AS SELECT Modalidade_ID, Modalidade FROM dModalidade;
CREATE VIEW vw_dim_calendario AS SELECT Data_ID, Data, Ano, Mes, NomeMes, AnoMes, Trimestre, DiaSemana, NomeDia, FimDeSemana, Mes_Inicio FROM dCalendario;
CREATE VIEW vw_fato_vagas AS
SELECT ID_Registro, Fonte_ID, Empresa_ID, Cargo_ID, Localidade_ID, Modalidade_ID, Data_ID,
       ID_Vaga_Original, Cargo_Original, Empresa_Original, Localidade_Original, Modalidade_Original,
       Data_Publicacao, Data_Publicacao_Data, Salario_Minimo, Salario_Maximo, Salario_Referencia,
       Tem_Salario, Status_Qualidade, Natureza_Dado, Eh_Simulado, URL_Vaga
FROM fVagas;
