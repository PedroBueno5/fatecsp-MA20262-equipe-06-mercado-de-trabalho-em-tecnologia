-- Cinco perguntas analíticas sobre o mercado de trabalho em tecnologia.
-- C1: cargos com maior volume de vagas (exclui simulados)
SELECT c.Cargo, COUNT(*) AS Quantidade_Vagas
FROM fVagas v JOIN dCargo c ON c.Cargo_ID=v.Cargo_ID
WHERE v.Eh_Simulado='Não'
GROUP BY c.Cargo ORDER BY Quantidade_Vagas DESC LIMIT 10;

-- C2: empresas com maior volume de anúncios (exclui simulados)
SELECT e.Empresa, COUNT(*) AS Quantidade_Vagas
FROM fVagas v JOIN dEmpresa e ON e.Empresa_ID=v.Empresa_ID
WHERE v.Eh_Simulado='Não'
GROUP BY e.Empresa ORDER BY Quantidade_Vagas DESC LIMIT 10;

-- C3: distribuição por modalidade (inclui categoria Não informado)
SELECT m.Modalidade, COUNT(*) AS Quantidade_Vagas,
       ROUND(100.0*COUNT(*)/(SELECT COUNT(*) FROM fVagas WHERE Eh_Simulado='Não'),2) AS Percentual
FROM fVagas v JOIN dModalidade m ON m.Modalidade_ID=v.Modalidade_ID
WHERE v.Eh_Simulado='Não'
GROUP BY m.Modalidade ORDER BY Quantidade_Vagas DESC;

-- C4: evolução mensal com data válida (exclui simulados)
SELECT substr(v.Data_Publicacao_Data,1,7) AS AnoMes, COUNT(*) AS Quantidade_Vagas
FROM fVagas v
WHERE v.Eh_Simulado='Não' AND v.Data_Publicacao_Data IS NOT NULL AND v.Data_Publicacao_Data<>''
GROUP BY substr(v.Data_Publicacao_Data,1,7) ORDER BY AnoMes;

-- C5: distribuição de salários disponíveis por cargo (salário de referência)
SELECT c.Cargo, COUNT(v.Salario_Referencia) AS Vagas_Com_Salario,
       ROUND(AVG(v.Salario_Referencia),2) AS Salario_Medio_Referencia,
       ROUND(MIN(v.Salario_Referencia),2) AS Salario_Minimo_Referencia,
       ROUND(MAX(v.Salario_Referencia),2) AS Salario_Maximo_Referencia
FROM fVagas v JOIN dCargo c ON c.Cargo_ID=v.Cargo_ID
WHERE v.Eh_Simulado='Não' AND v.Salario_Referencia IS NOT NULL
GROUP BY c.Cargo HAVING COUNT(v.Salario_Referencia)>=2
ORDER BY Salario_Medio_Referencia DESC LIMIT 15;
