
-- ============================================
-- PROJETO: BIBLIOTECA SABER
-- SGBD: MySQL
-- Arquivo: 01_criacao.sql
-- ============================================

CREATE DATABASE IF NOT EXISTS biblioteca_saber
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE biblioteca_saber;

-- 1. Tabela de editoras
CREATE TABLE editoras (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    pais VARCHAR(60) NOT NULL
) ENGINE=InnoDB;

-- 2. Tabela de autores
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    nacionalidade VARCHAR(60) NOT NULL,
    data_nascimento DATE
) ENGINE=InnoDB;

-- 3. Tabela de categorias
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE,
    descricao VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

-- 4. Tabela de livros
CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(180) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao YEAR NOT NULL,
    id_editora INT NOT NULL,

    CONSTRAINT fk_livros_editoras
        FOREIGN KEY (id_editora)
        REFERENCES editoras(id_editora)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 5. Relacionamento entre livros e autores (N:N)
CREATE TABLE livros_autores (
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,

    PRIMARY KEY (id_livro, id_autor),

    FOREIGN KEY (id_livro)
        REFERENCES livros(id_livro)
        ON DELETE CASCADE,

    FOREIGN KEY (id_autor)
        REFERENCES autores(id_autor)
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 6. Relacionamento entre livros e categorias (N:N)
CREATE TABLE livros_categorias (
    id_livro INT NOT NULL,
    id_categoria INT NOT NULL,

    PRIMARY KEY (id_livro, id_categoria),

    FOREIGN KEY (id_livro)
        REFERENCES livros(id_livro)
        ON DELETE CASCADE,

    FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 7. Tabela de leitores
CREATE TABLE leitores (
    id_leitor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    data_cadastro DATE NOT NULL
) ENGINE=InnoDB;

-- 8. Tabela de exemplares físicos
CREATE TABLE exemplares (
    id_exemplar INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT NOT NULL,
    codigo_patrimonio VARCHAR(30) NOT NULL UNIQUE,

    estado ENUM(
        'NOVO',
        'BOM',
        'REGULAR',
        'DANIFICADO'
    ) NOT NULL DEFAULT 'BOM',

    disponivel BOOLEAN NOT NULL DEFAULT TRUE,

    FOREIGN KEY (id_livro)
        REFERENCES livros(id_livro)
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 9. Tabela de empréstimos
CREATE TABLE emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_exemplar INT NOT NULL,
    id_leitor INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    multa DECIMAL(8,2) NOT NULL DEFAULT 0.00,

    CONSTRAINT chk_datas_emprestimo
        CHECK (data_prevista >= data_emprestimo),

    CONSTRAINT chk_multa
        CHECK (multa >= 0),

    FOREIGN KEY (id_exemplar)
        REFERENCES exemplares(id_exemplar)
        ON DELETE RESTRICT,

    FOREIGN KEY (id_leitor)
        REFERENCES leitores(id_leitor)
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Conferir se o banco foi criado
SHOW TABLES;
