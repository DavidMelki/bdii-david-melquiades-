use Hospital_BD;

-- 1)Quantos Pacientes existem no Hospital? 
SELECT COUNT(*) AS total_pacientes
FROM Paciente;

-- 2)Quantos médicos, enfermeiros e estoquistas existem? 
SELECT c.nome AS cargo, COUNT(*) AS quantidade
FROM Funcionario f
JOIN Cargo c ON f.id_cargo = c.id_cargo
WHERE c.nome IN ('Medico', 'Enfermeiro', 'Estoquista')
GROUP BY c.nome;

-- 3)Quantas consultas foram realizadas por cada médico? 
SELECT f.nome AS medico,
       COUNT(c.id_consulta) AS total_consultas
FROM Funcionario f
JOIN Cargo cg ON f.id_cargo = cg.id_cargo
LEFT JOIN Consulta c ON c.id_funcionario = f.id_funcionario
WHERE cg.nome = 'Medico'
GROUP BY f.nome;

-- 4)Qual a temperatura média por diagnóstico?
SELECT diagnostico,
       AVG(temperatura) AS temperatura_media
FROM Consulta
GROUP BY diagnostico;

-- 5)Quantas consultas tiveram temperatura acima de 38°C? 
SELECT COUNT(*) AS consultas_acima38
FROM Consulta
WHERE temperatura > 38.0;

-- 6)Quantos pacientes são do sexo masculino e quantos do sexo feminino?
SELECT sexo,
       COUNT(*) AS quantidade
FROM Paciente
GROUP BY sexo;

