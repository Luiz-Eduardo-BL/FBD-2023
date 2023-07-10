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
    Resumo TEXT NOT NULL,
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
    Comentario TEXT NOT NULL,
    PRIMARY KEY (Id_Comentario),
    FOREIGN KEY (Id_User) REFERENCES Usuario(Id_User),
    FOREIGN KEY (Id_Bug) REFERENCES Bug(Id_Bug)
);

--ID_bug, Id_user
CREATE TABLE UpvoteDownVote (
    Id_Voto INT NOT NULL,
    Tipo_Voto VARCHAR(50) NOT NULL,
    PRIMARY KEY (Id_Voto)
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

