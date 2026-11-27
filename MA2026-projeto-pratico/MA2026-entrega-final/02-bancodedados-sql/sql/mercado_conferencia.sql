-- Consultas de conferência: os totais devem ser comparados com os CSVs da Etapa 3.
SELECT 'fVagas' AS Tabela, COUNT(*) AS Linhas FROM fVagas
UNION ALL SELECT 'dEmpresa', COUNT(*) FROM dEmpresa
UNION ALL SELECT 'dCargo', COUNT(*) FROM dCargo
UNION ALL SELECT 'dFonte', COUNT(*) FROM dFonte
UNION ALL SELECT 'dLocalidade', COUNT(*) FROM dLocalidade
UNION ALL SELECT 'dModalidade', COUNT(*) FROM dModalidade
UNION ALL SELECT 'dCalendario', COUNT(*) FROM dCalendario;

-- Chaves primárias duplicadas (resultado esperado: zero linhas)
SELECT ID_Registro, COUNT(*) AS Qtde FROM fVagas GROUP BY ID_Registro HAVING COUNT(*)>1;

-- Integridade referencial (resultado esperado: zero linhas)
PRAGMA foreign_key_check;

-- Datas sem correspondência no calendário (esperado: 99 conforme pacote da Etapa 3)
SELECT COUNT(*) AS Sem_Data_Valida FROM fVagas WHERE Data_ID IS NULL;

-- Separação de dados originais e simulados
SELECT Eh_Simulado, COUNT(*) AS Qtde FROM fVagas GROUP BY Eh_Simulado;

-- Salários disponíveis entre vagas não simuladas
SELECT COUNT(*) AS Vagas_Com_Salario
FROM fVagas WHERE Eh_Simulado='Não' AND Salario_Referencia IS NOT NULL;
