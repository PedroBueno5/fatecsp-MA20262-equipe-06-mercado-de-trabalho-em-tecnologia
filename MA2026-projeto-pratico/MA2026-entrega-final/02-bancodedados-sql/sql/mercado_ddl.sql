-- Projeto: Mercado de Trabalho em Tecnologia | FATEC-SP
-- Banco SQLite. Execute uma vez em banco vazio.
PRAGMA foreign_keys = ON;

CREATE TABLE dFonte (Fonte_ID INTEGER PRIMARY KEY, Fonte TEXT NOT NULL UNIQUE);
CREATE TABLE dEmpresa (Empresa_ID INTEGER PRIMARY KEY, Empresa TEXT NOT NULL);
CREATE TABLE dCargo (Cargo_ID INTEGER PRIMARY KEY, Cargo TEXT NOT NULL);
CREATE TABLE dLocalidade (Localidade_ID INTEGER PRIMARY KEY, Localidade TEXT NOT NULL);
CREATE TABLE dModalidade (Modalidade_ID INTEGER PRIMARY KEY, Modalidade TEXT NOT NULL);
CREATE TABLE dCalendario (
 Data_ID INTEGER PRIMARY KEY, Data TEXT NOT NULL UNIQUE, Ano INTEGER, Mes INTEGER,
 NomeMes TEXT, AnoMes TEXT, Trimestre TEXT, DiaSemana INTEGER, NomeDia TEXT,
 FimDeSemana TEXT, Mes_Inicio TEXT
);
CREATE TABLE fVagas (
 ID_Registro TEXT PRIMARY KEY,
 Fonte_ID INTEGER NOT NULL REFERENCES dFonte(Fonte_ID),
 Empresa_ID INTEGER REFERENCES dEmpresa(Empresa_ID),
 Cargo_ID INTEGER REFERENCES dCargo(Cargo_ID),
 Localidade_ID INTEGER REFERENCES dLocalidade(Localidade_ID),
 Modalidade_ID INTEGER REFERENCES dModalidade(Modalidade_ID),
 Data_ID INTEGER REFERENCES dCalendario(Data_ID),
 ID_Vaga_Original TEXT, Cargo_Original TEXT, Empresa_Original TEXT,
 Localidade_Original TEXT, Modalidade_Original TEXT,
 Data_Publicacao TEXT, Data_Publicacao_Data TEXT,
 Salario_Minimo REAL CHECK(Salario_Minimo IS NULL OR Salario_Minimo >= 0),
 Salario_Maximo REAL CHECK(Salario_Maximo IS NULL OR Salario_Maximo >= 0),
 Salario_Referencia REAL CHECK(Salario_Referencia IS NULL OR Salario_Referencia >= 0),
 Tem_Salario TEXT CHECK(Tem_Salario IN ('Sim','Não')),
 Status_Qualidade TEXT, Natureza_Dado TEXT,
 Eh_Simulado TEXT CHECK(Eh_Simulado IN ('Sim','Não')),
 URL_Vaga TEXT,
 CHECK(Salario_Minimo IS NULL OR Salario_Maximo IS NULL OR Salario_Maximo >= Salario_Minimo)
);
CREATE INDEX idx_fvagas_data ON fVagas(Data_ID);
CREATE INDEX idx_fvagas_cargo ON fVagas(Cargo_ID);
CREATE INDEX idx_fvagas_empresa ON fVagas(Empresa_ID);
CREATE INDEX idx_fvagas_fonte ON fVagas(Fonte_ID);
