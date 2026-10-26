
USE biblioteca_saber;

-- 1. Editoras
INSERT INTO editoras (nome, cidade, pais) VALUES
('Horizonte Editorial', 'São Paulo', 'Brasil'),
('Editora Saber', 'Rio de Janeiro', 'Brasil'),
('Atlas Livros', 'Lisboa', 'Portugal'),
('Papiro Editora', 'Belo Horizonte', 'Brasil'),
('Aurora Publicações', 'Curitiba', 'Brasil');

-- 2. Autores
INSERT INTO autores
(nome, nacionalidade, data_nascimento) VALUES
('Machado de Assis', 'Brasileira', '1839-06-21'),
('Clarice Lispector', 'Brasileira', '1920-12-10'),
('J. K. Rowling', 'Britânica', '1965-07-31'),
('George Orwell', 'Britânica', '1903-06-25'),
('Carolina Maria de Jesus', 'Brasileira', '1914-03-14');

-- 3. Categorias
INSERT INTO categorias (nome, descricao) VALUES
('Romance', 'Narrativas literárias'),
('Fantasia', 'Obras com elementos fantásticos'),
('Ficção científica', 'Narrativas sobre ciência e tecnologia'),
('Literatura brasileira', 'Obras da literatura brasileira'),
('Distopia', 'Sociedades fictícias opressivas');

-- 4. Livros
INSERT INTO livros
(titulo, isbn, ano_publicacao, id_editora) VALUES
('Dom Casmurro', '9780000000001', 1899, 1),
('A Hora da Estrela', '9780000000002', 1977, 2),
('Harry Potter e a Pedra Filosofal', '9780000000003', 1997, 3),
('1984', '9780000000004', 1949, 4),
('Quarto de Despejo', '9780000000005', 1960, 5);

-- 5. Relacionamento livros e autores
INSERT INTO livros_autores (id_livro, id_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- 6. Relacionamento livros e categorias
INSERT INTO livros_categorias (id_livro, id_categoria) VALUES
(1, 1),
(1, 4),
(2, 1),
(2, 4),
(3, 2),
(4, 3),
(4, 5),
(5, 4);

-- 7. Leitores
INSERT INTO leitores
(nome, email, telefone, data_cadastro) VALUES
('Ana Souza', 'ana.souza@example.com', '(11) 90000-0001', '2026-01-10'),
('Bruno Lima', 'bruno.lima@example.com', '(21) 90000-0002', '2026-02-15'),
('Camila Alves', 'camila.alves@example.com', '(31) 90000-0003', '2026-03-20'),
('Diego Martins', 'diego.martins@example.com', '(41) 90000-0004', '2026-04-05'),
('Elisa Costa', 'elisa.costa@example.com', '(51) 90000-0005', '2026-05-12');

-- 8. Exemplares
INSERT INTO exemplares
(id_livro, codigo_patrimonio, estado, disponivel) VALUES
(1, 'BS-0001', 'BOM', TRUE),
(1, 'BS-0002', 'NOVO', FALSE),
(2, 'BS-0003', 'BOM', FALSE),
(2, 'BS-0004', 'REGULAR', FALSE),
(3, 'BS-0005', 'NOVO', TRUE),
(3, 'BS-0006', 'BOM', FALSE),
(4, 'BS-0007', 'BOM', TRUE),
(4, 'BS-0008', 'REGULAR', TRUE),
(5, 'BS-0009', 'NOVO', TRUE),
(5, 'BS-0010', 'BOM', TRUE);

-- 9. Empréstimos
INSERT INTO emprestimos
(id_exemplar, id_leitor, data_emprestimo,
 data_prevista, data_devolucao, multa) VALUES
(1, 1, '2026-10-01', '2026-10-15', '2026-10-14', 0.00),
(2, 2, '2026-09-20', '2026-10-04', NULL, 0.00),
(3, 3, '2026-10-10', '2026-10-24', NULL, 0.00),
(4, 4, '2026-10-20', '2026-11-03', NULL, 0.00),
(5, 5, '2026-08-01', '2026-08-15', '2026-08-20', 10.00),
(6, 1, '2026-10-22', '2026-11-05', NULL, 0.00),
(7, 2, '2026-09-01', '2026-09-15', '2026-09-14', 0.00);
