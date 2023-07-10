-- retorna o número total de bugs para cada distro e agrupa os resultados pelo nome da distro.
SELECT D.Nome_Distro, COUNT(B.Id_Bug) AS Total_Bugs
FROM Distro D
INNER JOIN Bug B ON B.Id_Distro = D.Id_Distro
GROUP BY D.Nome_Distro;

-- retorna o título do bug e o nome do usuário associado a ele, ordenando os resultados em ordem crescente pelo título do bug.
SELECT B.Titulo, U.Nome_User
FROM Bug B
INNER JOIN Usuario U ON B.Id_User = U.Id_User
ORDER BY B.Titulo ASC;

-- retorna o nome do usuário e o número total de comentários feitos por cada usuário, incluindo aqueles que não fizeram nenhum comentário. 
SELECT U.Nome_User, COUNT(C.Id_Comentario) AS Total_Comentarios
FROM Usuario U
LEFT OUTER JOIN Comentario C ON U.Id_User = C.Id_User
GROUP BY U.Nome_User;

-- retorna o título do bug e o nome do usuário associado a ele, apenas para os bugs que pertencem à distro com o nome 'Ubuntu'.
SELECT B.Titulo, U.Nome_User
FROM Bug B
INNER JOIN Usuario U ON B.Id_User = U.Id_User
WHERE B.Id_Distro IN (SELECT Id_Distro FROM Distro WHERE Nome_Distro = 'Ubuntu');

-- retorna o título, resumo e nome do usuário dos bugs abertos que possuem pelo menos um comentário associado.
SELECT B.Titulo, B.Resumo, U.Nome_User
FROM Bug B
INNER JOIN Usuario U ON B.Id_User = U.Id_User
WHERE B.Status = 'Aberto'
  AND EXISTS (SELECT 1 FROM Comentario C WHERE C.Id_Bug = B.Id_Bug);

-- retorna o número total de bugs para cada combinação de distro e interface gráfica, incluindo as distros e interfaces gráficas que não possuem bugs associados.
SELECT D.Nome_Distro, I.Nome_Interface, COUNT(B.Id_Bug) AS Total_Bugs
FROM Distro D
INNER JOIN Possui P ON D.Id_Distro = P.Id_Distro
INNER JOIN IntGrafica I ON P.Id_Interface = I.Id_Interface
LEFT OUTER JOIN Bug B ON D.Id_Distro = B.Id_Distro
GROUP BY D.Nome_Distro, I.Nome_Interface;
