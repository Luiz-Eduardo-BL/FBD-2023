import psycopg2

-- Função para criar a visão útil
def criar_visao(conn):
    sql = """
    CREATE VIEW minha_visao AS
    SELECT B.Id_Bug, B.Titulo, B.Resumo, U.Nome_User, D.Nome_Distro
    FROM Bug B
    JOIN Usuario U ON B.Id_User = U.Id_User
    JOIN Distro D ON B.Id_Distro = D.Id_Distro
    WHERE B.Status = 'Aberto'
    """

    with conn.cursor() as cursor:
        cursor.execute(sql)

-- # Função para criar os usuários do banco de dados
def criar_usuarios(conn):
    -- # Usuário administrativo
    sql_admin = "CREATE USER usuario_admin WITH PASSWORD 'senha_admin' SUPERUSER"

    -- # Usuário somente leitura
    sql_readonly = "CREATE USER usuario_leitura WITH PASSWORD 'senha_leitura'"

    with conn.cursor() as cursor:
        cursor.execute(sql_admin)
        cursor.execute(sql_readonly)

-- # Conectar ao banco de dados
conn = psycopg2.connect(
    host="localhost",
    database="nome_do_banco",
    user="usuario_administrativo",
    password="senha_administrativa"
)

-- # Criar a visão útil
criar_visao(conn)

-- # Criar os usuários do banco de dados
criar_usuarios(conn)

-- # Fechar a conexão
conn.close()
