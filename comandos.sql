-- CREATE TABLE

CREATE TABLE IntGrafica (
    Id_Interface INT NOT NULL,
    Nome_Interface VARCHAR(50) NOT NULL,
    Id_Distro INT NOT NULL,
    PRIMARY KEY (Id_Interface),
    FOREIGN KEY (Id_Distro) REFERENCES Distro(Id_Distro)
);

CREATE TABLE Distro (
    Id_Distro INT NOT NULL,
    Nome_Distro VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id_Distro)
);

CREATE TABLE Kernel (
    Id_Kernel INT NOT NULL,
    Versao VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id_Kernel)
);

CREATE TABLE Usuario (
    Id_User INT NOT NULL,
    Nome_User VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Id_Distro INT NOT NULL,
    PRIMARY KEY (Id_User),
    FOREIGN KEY (Id_Distro) REFERENCES Distro(Id_Distro)
);

CREATE TABLE Bug (
    Id_Bug INT NOT NULL,
    Titulo VARCHAR(50) NOT NULL,
    Resumo VARCHAR(50) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    Id_Distro INT NOT NULL,
    Id_User INT NOT NULL,
    PRIMARY KEY (Id_Bug),
    FOREIGN KEY (Id_Distro) REFERENCES Distro(Id_Distro),
    FOREIGN KEY (Id_User) REFERENCES Usuario(Id_User)
);

CREATE TABLE Comentario (
    Id_Comentario INT NOT NULL,
    Data DATE NOT NULL,
    Id_User INT NOT NULL,
    Id_Bug INT NOT NULL,
    PRIMARY KEY (Id_Comentario),
    FOREIGN KEY (Id_User) REFERENCES Usuario(Id_User),
    FOREIGN KEY (Id_Bug) REFERENCES Bug(Id_Bug)
);

CREATE TABLE UpvoteDownVote (
    Id_Voto INT NOT NULL,
    Tipo_Voto VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id_Voto)
);

CREATE TABLE Tem (
    Id_Distro INT NOT NULL,
    Id_Kernel INT NOT NULL,
    FOREIGN KEY (Id_Distro) REFERENCES Distro(Id_Distro),
    FOREIGN KEY (Id_Kernel) REFERENCES Kernel(Id_Kernel)
);

CREATE TABLE Postar (
    Id_Bug INT NOT NULL,
    Id_User INT NOT NULL,
    FOREIGN KEY (Id_Bug) REFERENCES Bug(Id_Bug),
    FOREIGN KEY (Id_User) REFERENCES Usuario(Id_User)
);

CREATE TABLE Comentar (
    Id_Comentario INT NOT NULL,
    Id_User INT NOT NULL,
    FOREIGN KEY (Id_Comentario) REFERENCES Comentario(Id_Comentario),
    FOREIGN KEY (Id_User) REFERENCES Usuario(Id_User)
);

CREATE TABLE Votar (
    Id_Voto INT NOT NULL,
    Id_User INT NOT NULL,
    FOREIGN KEY (Id_Voto) REFERENCES UpvoteDownVote(Id_Voto),
    FOREIGN KEY (Id_User) REFERENCES Usuario(Id_User)
);

CREATE TABLE Possui (
    Id_Distro INT NOT NULL,
    Id_Interface INT NOT NULL,
    Id_Kernel INT NOT NULL,
    FOREIGN KEY (Id_Distro) REFERENCES Distro(Id_Distro),
    FOREIGN KEY (Id_Interface) REFERENCES IntGrafica(Id_Interface),
    FOREIGN KEY (Id_Kernel) REFERENCES Kernel(Id_Kernel)
);


-- POPULATE TABLE

INSERT INTO Distro (Id_Distro, Nome_Distro) 
VALUES 
(1, 'Ubuntu'),
(2, 'Fedora'),
(3, 'Debian'),
(4, 'Arch Linux'),
(5, 'Linux Mint'),
(6, 'openSUSE'),
(7, 'Manjaro'),
(8, 'CentOS'),
(9, 'elementary OS'),
(10, 'Kali Linux');

INSERT INTO Kernel (Id_Kernel, Versao) 
VALUES 
(1, '4.19'),
(2, '5.4'),
(3, '5.10'),
(4, '5.11'),
(5, '5.12'),
(6, '5.13'),
(7, '5.14'),
(8, '5.15'),
(9, '5.16'),
(10, '5.17');

INSERT INTO IntGrafica (Id_Interface, Nome_Interface, Id_Distro) 
VALUES 
(1, 'Gnome', 1),
(2, 'KDE', 2),
(3, 'XFCE', 3),
(4, 'LXDE', 4),
(5, 'Cinnamon', 5),
(6, 'MATE', 6),
(7, 'Unity', 7),
(8, 'Deepin', 8),
(9, 'Budgie', 9),
(10, 'Pantheon', 10);

INSERT INTO Usuario (Id_User, Nome_User, Email, Id_Distro) 
VALUES 
(1, 'John Doe', 'john@example.com', 1),
(2, 'Jane Smith', 'jane@example.com', 2),
(3, 'David Johnson', 'david@example.com', 3),
(4, 'Emily Davis', 'emily@example.com', 4),
(5, 'Michael Wilson', 'michael@example.com', 5),
(6, 'Sarah Brown', 'sarah@example.com', 6),
(7, 'Daniel Taylor', 'daniel@example.com', 7),
(8, 'Olivia Miller', 'olivia@example.com', 8),
(9, 'James Anderson', 'james@example.com', 9),
(10, 'Sophia Martinez', 'sophia@example.com', 10);

INSERT INTO Bug (Id_Bug, Titulo, Resumo, Status, Id_Distro, Id_User) 
VALUES 
(1, 'Erro de login', 'Usuário não consegue fazer login', 'Aberto', 1, 1),
(2, 'Falha na renderização', 'Imagens não são exibidas corretamente', 'Em progresso', 2, 2),
(3, 'Crash ao salvar arquivo', 'O programa fecha inesperadamente', 'Aberto', 3, 3),
(4, 'Erro de formatação', 'Texto aparece com formatação incorreta', 'Fechado', 4, 4),
(5, 'Problema de desempenho', 'O sistema está lento', 'Aberto', 5, 5),
(6, 'Funcionalidade ausente', 'Recurso X não está disponível', 'Em progresso', 6, 6),
(7, 'Erro de conexão', 'Não é possível se conectar ao servidor', 'Aberto', 7, 7),
(8, 'Comportamento inesperado', 'Ação Y gera resultado inesperado', 'Fechado', 8, 8),
(9, 'Bug de segurança', 'Vulnerabilidade na autenticação', 'Aberto', 9, 9),
(10, 'Erro de exibição', 'Elementos da interface estão desalinhados', 'Em progresso', 10, 10);

INSERT INTO Comentario (Id_Comentario, Data, Id_User, Id_Bug)
VALUES
(1, '2023-05-01', 1, 1),
(2, '2023-05-02', 2, 1),
(3, '2023-05-03', 3, 2),
(4, '2023-05-04', 4, 2),
(5, '2023-05-05', 5, 3),
(6, '2023-05-06', 6, 3),
(7, '2023-05-07', 7, 4),
(8, '2023-05-08', 8, 4),
(9, '2023-05-09', 9, 5),
(10, '2023-05-10', 10, 5);

INSERT INTO UpvoteDownVote (Id_Voto, Tipo_Voto)
VALUES
(1, 'Upvote'),
(2, 'Downvote'),
(3, 'Upvote'),
(4, 'Upvote'),
(5, 'Downvote'),
(6, 'Upvote'),
(7, 'Downvote'),
(8, 'Downvote'),
(9, 'Upvote'),
(10, 'Upvote');

INSERT INTO Tem (Id_Distro, Id_Kernel)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO Postar (Id_Bug, Id_User)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO Comentar (Id_Comentario, Id_User)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Votar (Id_Voto, Id_User)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO Possui (Id_Distro, Id_Interface, Id_Kernel)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7),
    (8, 8, 8),
    (9, 9, 9),
    (10, 10, 10);


-- CONSULT TABLE

-- retorna o número total de bugs para cada distro, utilizando a função agregada COUNT e agrupando os resultados pelo nome da distro.
SELECT D.Nome_Distro, COUNT(B.Id_Bug) AS Total_Bugs
FROM Distro D
INNER JOIN Bug B ON B.Id_Distro = D.Id_Distro
GROUP BY D.Nome_Distro;

-- retorna o nome dos usuários que fizeram postagens no bug com Id_Bug igual a 1, utilizando uma consulta aninhada para obter os Id_Users correspondentes na tabela Postar.
SELECT U.Nome_User
FROM Usuario U
WHERE U.Id_User IN (SELECT P.Id_User FROM Postar P WHERE P.Id_Bug = 1);

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


