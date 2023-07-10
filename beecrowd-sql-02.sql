-- 2737
(SELECT name, customers_number
FROM lawyers
ORDER BY customers_number DESC
LIMIT 1)

UNION ALL

(SELECT name, customers_number
FROM lawyers
ORDER BY customers_number ASC
LIMIT 1)

UNION ALL

(SELECT 'Average', round(AVG(customers_number), 0)
FROM lawyers)

-- 2738
SELECT cd.name, round(((sc.math * 2) + (sc.specific * 3) + (sc.project_plan * 5)) / 10, 2)
AS media
FROM candidate cd
INNER join score sc
ON sc.candidate_id = cd.id
ORDER BY media DESC

-- 2739
SELECT name, Cast(extract (DAY FROM payday) AS Integer)
FROM loan

-- 2740
(SELECT 'Podium: ' || team 
FROM league 
ORDER BY position 
LIMIT 3)

UNION ALL
(WITH t AS (SELECT * FROM league 
ORDER BY position DESC 
LIMIT 2)

  SELECT 'Demoted: ' || team 
  FROM t 
  ORDER BY position ASC);

-- 2741
SELECT concat ('Approved: ','', name), grade
FROM students
WHERE grade > 6
ORDER BY grade DESC

-- 2742
SELECT lrg.name, round(lrg.omega * 1.618, 3) AS n
FROM dimensions dm
INNER join life_registry lrg 
ON lrg.dimensions_id = dm.id
WHERE lrg.name 
LIKE 'Richard%' 
AND dm.name 
IN ('C875', 'C774')
ORDER BY lrg.omega ASC

-- 2743
SELECT name, CHAR_LENGTH(name) AS tamanho
FROM people
ORDER BY tamanho DESC

-- 2744
SELECT id, password, md5(password)
FROM account;

-- 2745
SELECT name, round(salary * 0.1, 2)
FROM people
WHERE salary > 3000

-- 2746
SELECT replace(name, 'H1', 'X') AS name
FROM virus;

-- 2988
SELECT t.name, 
    COUNT(m.id) AS matches,
    SUM(CASE 
            WHEN m.team_1 = t.id AND m.team_1_goals > m.team_2_goals THEN 1 
            WHEN m.team_2 = t.id AND m.team_2_goals > m.team_1_goals THEN 1 
            ELSE 0 
        END) AS victories,
    SUM(CASE 
            WHEN m.team_1 = t.id AND m.team_1_goals < m.team_2_goals THEN 1 
            WHEN m.team_2 = t.id AND m.team_2_goals < m.team_1_goals THEN 1 
            ELSE 0 
        END) AS defeats,
    SUM(CASE 
            WHEN m.team_1 = t.id AND m.team_1_goals = m.team_2_goals THEN 1 
            WHEN m.team_2 = t.id AND m.team_2_goals = m.team_1_goals THEN 1 
            ELSE 0 
        END) AS draws,
    SUM(CASE 
            WHEN m.team_1 = t.id AND m.team_1_goals > m.team_2_goals THEN 3 
            WHEN m.team_2 = t.id AND m.team_2_goals > m.team_1_goals THEN 3 
            WHEN m.team_1 = t.id AND m.team_1_goals = m.team_2_goals THEN 1 
            WHEN m.team_2 = t.id AND m.team_2_goals = m.team_1_goals THEN 1 
            ELSE 0 
        END) AS score
FROM teams t
LEFT JOIN matches m ON t.id IN (m.team_1, m.team_2)
GROUP BY t.id
ORDER BY score DESC;

-- 2989
SELECT
    dp.nome AS Departamento,
    div.nome AS Divisao,
    ROUND(AVG(tsal.salario - tdesc.descontos), 2) AS media,
    ROUND(MAX(tsal.salario - tdesc.descontos), 2) AS maior
FROM
    departamento dp
    INNER JOIN divisao div ON dp.cod_dep = div.cod_dep
    INNER JOIN empregado emp ON div.cod_divisao = emp.lotacao_div
    INNER JOIN (
        SELECT
            emp.matr,
            COALESCE(SUM(venc.valor), 0) AS salario
        FROM
            empregado emp
            LEFT JOIN emp_venc ON emp.matr = emp_venc.matr
            LEFT JOIN vencimento venc ON emp_venc.cod_venc = venc.cod_venc
        GROUP BY
            emp.matr
    ) AS tsal ON emp.matr = tsal.matr
    INNER JOIN (
        SELECT
            emp.matr,
            COALESCE(SUM(desconto.valor), 0) AS descontos
        FROM
            empregado emp
            LEFT JOIN emp_desc ON emp.matr = emp_desc.matr
            LEFT JOIN desconto ON emp_desc.cod_desc = desconto.cod_desc
        GROUP BY
            emp.matr
    ) AS tdesc ON emp.matr = tdesc.matr
GROUP BY
    div.cod_divisao,
    div.nome,
    dp.nome
ORDER BY
    AVG(tsal.salario - tdesc.descontos) DESC

-- 2990
SELECT emp.cpf, emp.enome, dep.dnome
FROM empregados emp
INNER join departamentos dep 
ON emp.dnumero = dep.dnumero
LEFT join trabalha tb
ON emp.cpf = tb.cpf_emp
WHERE tb.pnumero IS NULL
ORDER BY emp.cpf

-- 2991
SELECT dep.nome AS "Nome Departamento",
    COUNT(emp.matr) AS "Numero de Empregados",
    round(AVG(tsal.salario - tdesc.descontos), 2) AS "Media Salarial",
    round(MAX(tsal.salario - tdesc.descontos), 2) AS "Maior Salario",
    (CASE WHEN MIN(tsal.salario - tdesc.descontos) = 0 THEN '0'
    ELSE round(MIN(tsal.salario - tdesc.descontos), 2)
    END) AS "Menor Salario"
FROM departamento dep
    INNER JOIN empregado emp ON dep.cod_dep = emp.lotacao
    INNER JOIN (
        SELECT emp.matr,
        COALESCE(SUM(venc.valor), 0) AS salario
        FROM empregado emp
        LEFT JOIN emp_venc ON emp.matr = emp_venc.matr
        LEFT JOIN vencimento venc ON emp_venc.cod_venc = venc.cod_venc
        GROUP BY emp.matr
    ) AS tsal ON emp.matr = tsal.matr
    INNER JOIN (
        SELECT emp.matr, 
        COALESCE(SUM(desconto.valor), 0) AS descontos
        FROM empregado emp
        LEFT JOIN emp_desc ON emp.matr = emp_desc.matr
        LEFT JOIN desconto ON emp_desc.cod_desc = desconto.cod_desc
        GROUP BY emp.matr
    ) AS tdesc ON emp.matr = tdesc.matr
GROUP BY dep.nome
ORDER BY "Media Salarial" DESC;

-- 2992

-- 2993
SELECT amount AS most_frequent_value
FROM value_table
GROUP BY amount 
ORDER BY COUNT(amount) DESC LIMIT 1

-- 2994
SELECT amount AS most_frequent_value
FROM value_table
GROUP BY amount 
ORDER BY COUNT(amount) DESC LIMIT 1

-- 2995
SELECT temperature, COUNT(mark) AS number_of_records
FROM records
GROUP BY mark, temperature
ORDER BY mark

-- 2996
SELECT packages.year, u1.name AS sender, u2.name AS receiver
FROM packages 
JOIN users u1 ON packages.id_user_sender = u1.id 
JOIN users u2 ON packages.id_user_receiver = u2.id
WHERE (packages.year = 2015 OR packages.color LIKE 'blue')
     AND u2.address <> 'Taiwan' ORDER BY packages.year DESC;

-- 2997

-- 2998
WITH cumulative_profit AS (
    SELECT
        clie.name AS name,
        clie.investment AS investment,
        op.month AS month,
        SUM(op.profit) OVER (PARTITION BY op.client_id ORDER BY op.month) AS cumulative_profit
    FROM
        clients clie
        JOIN operations op ON clie.id = op.client_id
),
payback AS (
    SELECT
        name,
        investment,
        MIN(month) AS payback_month,
        MIN(cumulative_profit) - investment AS payback_value
    FROM
        cumulative_profit
    WHERE
        cumulative_profit >= investment
    GROUP BY
        name,
        investment
)
SELECT *
FROM payback
ORDER BY payback_value DESC;
-- 2999

-- 3001
SELECT NAME,
    CASE WHEN TYPE = 'A' then 20.0
    WHEN TYPE = 'B' then 70.0 
    WHEN TYPE = 'C' then 530.5
    END AS price
FROM products
ORDER BY TYPE, id DESC