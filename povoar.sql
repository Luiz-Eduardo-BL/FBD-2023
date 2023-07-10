INSERT INTO Distro (Id_Distro, Nome_Distro) VALUES(1, 'Ubuntu'),(2, 'Fedora'),(3, 'Arch Linux'),(4, 'Debian'),(5, 'OpenSUSE'),(6, 'CentOS'),(7, 'Linux Mint'),(8, 'Manjaro'),(9, 'Elementary OS'),(10, 'Gentoo');

INSERT INTO Kernel (Id_Kernel, Versao) VALUES(1, '5.13.0'),(2, '4.19.0'),(3, '5.10.0'),(4, '5.4.0'),(5, '5.8.0'),(6, '5.11.0'),(7, '5.12.0'),(8, '5.9.0'),(9, '5.6.0'),(10, '5.7.0');

INSERT INTO IntGrafica (Id_Interface, Nome_Interface) VALUES(1, 'X11'),(2, 'Wayland'),(3, 'Mir'),(4, 'Mac'),(5, 'Windows'),(6, 'Gnome'),(7, 'KDE'),(8, 'XFCE'),(9, 'Cinnamon'),(10, 'i3');

INSERT INTO Usuario (Id_User, Nome_User, Email) VALUES(1, 'João', 'joao@example.com'),(2, 'Maria', 'maria@example.com'),(3, 'Pedro', 'pedro@example.com'),(4, 'Ana', 'ana@example.com'),(5, 'Carlos', 'carlos@example.com'),(6, 'Laura', 'laura@example.com'),(7, 'José', 'jose@example.com'),(8, 'Mariana', 'mariana@example.com'),(9, 'Fernando', 'fernando@example.com'),(10, 'Lúcia', 'lucia@example.com');

INSERT INTO Bug (Id_Bug, Resumo, Status, Data, Id_User) VALUES(1, 'Erro de autenticação', 'Open', '2023-03-01', 1),(2, 'Problema na exibição de imagens', 'Closed', '2023-04-01', 2),(3, 'Erro ao salvar configurações', 'Open', '2023-05-01', 3),(4, 'Crash ao abrir o aplicativo', 'Closed', '2023-06-01', 4),(5, 'Incompatibilidade com sistema operacional', 'Open', '2023-07-01', 5),(6, 'Problema na sincronização de dados', 'Closed', '2023-08-01', 6),(7, 'Erro na geração de relatórios', 'Open', '2023-09-01', 7),(8, 'Falha no processamento de pagamentos', 'Closed', '2023-10-01', 8),(9, 'Erro no formulário de cadastro', 'Open', '2023-11-01', 9),(10, 'Lentidão no carregamento da página inicial', 'Closed', '2023-12-01', 10);

INSERT INTO Comentario (Id_Comentario, Comentario, Id_Bug) VALUES(1, 'Esse bug ocorre apenas no Internet Explorer.', 1),(2, 'O problema foi resolvido na última atualização.', 2),(3, 'Estou enfrentando o mesmo erro no meu dispositivo.', 3),(4, 'Reiniciar o aplicativo resolve temporariamente o crash.', 4),(5, 'Verifique se você possui a versão mais recente do sistema operacional.', 5),(6, 'Tente limpar o cache do aplicativo para resolver a sincronização.', 6),(7, 'Esse bug está afetando os relatórios mensais.', 7),(8, 'O erro ocorre apenas em pagamentos com cartão de crédito.', 8),(9, 'Há um problema na validação do campo de telefone.', 9),(10, 'A otimização do código melhorou a velocidade de carregamento.', 10);

INSERT INTO UpvoteDownvote (Id_Voto, Tipo_Voto) VALUES(1, 'Upvote'),(2, 'Downvote'),(3, 'Upvote'),(4, 'Upvote'),(5, 'Downvote'),(6, 'Upvote'),(7, 'Downvote'),(8, 'Upvote'),(9, 'Downvote'),(10, 'Upvote');