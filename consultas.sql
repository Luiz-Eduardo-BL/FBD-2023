-- Numero de Bugs postados para cada resultado:
SELECT Status, COUNT(*) AS Numero_Bugs
FROM Bug
GROUP BY Status;

-- Comentarios postados sobre a distro Ubuntu
SELECT Nome_Distro, COUNT(*) AS Numero_Comentarios
FROM Distro
INNER JOIN Tem ON Distro.Id_Distro = Tem.Id_Distro
INNER JOIN Bug ON Tem.Id_Distro = Bug.Id_Bug
INNER JOIN Comentario ON Bug.Id_Bug = Comentario.Id_Bug
WHERE Nome_Distro = 'Kali Linux'
GROUP BY Nome_Distro;

