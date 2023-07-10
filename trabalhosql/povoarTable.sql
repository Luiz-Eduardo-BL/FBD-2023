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

INSERT INTO Comentario (Id_Comentario, Data, Id_User, Id_Bug, Comentario)
VALUES
(1, '2023-05-01', 1, 1, 'Ótimo trabalho na resolução desse bug!'),
(2, '2023-05-02', 2, 1, 'Ainda estou encontrando o mesmo problema.'),
(3, '2023-05-03', 3, 2, 'Estou ansioso pela correção desse bug.'),
(4, '2023-05-04', 4, 2, 'Não consigo reproduzir esse bug no meu ambiente.'),
(5, '2023-05-05', 5, 3, 'Esse bug está afetando seriamente a usabilidade.'),
(6, '2023-05-06', 6, 3, 'Encontrei uma solução alternativa para contornar esse problema.'),
(7, '2023-05-07', 7, 4, 'Confirmo que o bug foi corrigido na versão mais recente.'),
(8, '2023-05-08', 8, 4, 'Preciso de mais informações para entender melhor esse problema.'),
(9, '2023-05-09', 9, 5, 'O bug parece estar relacionado a um conflito de dependências.'),
(10, '2023-05-10', 10, 5, 'Estou disponível para ajudar na investigação desse bug.');


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
