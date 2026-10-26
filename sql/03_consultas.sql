-- Biblioteca Saber
-- Arquivo: 03_consultas.sql
-- Execute depois de 01_criacao.sql e 02_dados.sql.
USE biblioteca_saber;

-- 1. Listar todos os livros e suas editoras.
SELECT l.id_livro, l.titulo, l.ano_publicacao, e.nome AS editora
FROM livros l
INNER JOIN editoras e ON e.id_editora = l.id_editora
ORDER BY l.titulo;

-- 2. Listar livros e seus autores.
SELECT l.titulo, a.nome AS autor
FROM livros l
INNER JOIN livros_autores la ON la.id_livro = l.id_livro
INNER JOIN autores a ON a.id_autor = la.id_autor
ORDER BY l.titulo, a.nome;

-- 3. Listar livros e suas categorias.
SELECT l.titulo, c.nome AS categoria
FROM livros l
INNER JOIN livros_categorias lc ON lc.id_livro = l.id_livro
INNER JOIN categorias c ON c.id_categoria = lc.id_categoria
ORDER BY l.titulo, c.nome;

-- 4. Pesquisar leitores cujo nome começa com a letra A.
SELECT id_leitor, nome, email
FROM leitores
WHERE nome LIKE 'A%'
ORDER BY nome;

-- 5. Pesquisar títulos que contenham a palavra "estrela".
SELECT id_livro, titulo, ano_publicacao
FROM livros
WHERE titulo LIKE '%estrela%';

-- 6. Listar livros publicados entre 1950 e 2000.
SELECT titulo, ano_publicacao
FROM livros
WHERE ano_publicacao BETWEEN 1950 AND 2000
ORDER BY ano_publicacao;

-- 7. Listar empréstimos com dados do leitor e do exemplar.
SELECT em.id_emprestimo, le.nome AS leitor, ex.codigo_patrimonio,
       em.data_emprestimo, em.data_prevista, em.data_devolucao
FROM emprestimos em
INNER JOIN leitores le ON le.id_leitor = em.id_leitor
INNER JOIN exemplares ex ON ex.id_exemplar = em.id_exemplar
ORDER BY em.data_emprestimo DESC;

-- 8. Mostrar empréstimos que ainda não foram devolvidos.
SELECT em.id_emprestimo, le.nome AS leitor, l.titulo,
       em.data_emprestimo, em.data_prevista
FROM emprestimos em
INNER JOIN leitores le ON le.id_leitor = em.id_leitor
INNER JOIN exemplares ex ON ex.id_exemplar = em.id_exemplar
INNER JOIN livros l ON l.id_livro = ex.id_livro
WHERE em.data_devolucao IS NULL
ORDER BY em.data_prevista;

-- 9. Contar quantos livros existem em cada categoria.
SELECT c.nome AS categoria, COUNT(lc.id_livro) AS quantidade_livros
FROM categorias c
LEFT JOIN livros_categorias lc ON lc.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.nome
ORDER BY quantidade_livros DESC, c.nome;

-- 10. Contar quantos empréstimos cada leitor realizou.
SELECT le.nome AS leitor, COUNT(em.id_emprestimo) AS total_emprestimos
FROM leitores le
LEFT JOIN emprestimos em ON em.id_leitor = le.id_leitor
GROUP BY le.id_leitor, le.nome
ORDER BY total_emprestimos DESC, le.nome;

-- 11. Calcular o total de multas registradas.
SELECT SUM(multa) AS total_multas
FROM emprestimos;

-- 12. Mostrar leitores que possuem multa registrada em algum empréstimo.
SELECT DISTINCT le.nome AS leitor, em.multa
FROM leitores le
INNER JOIN emprestimos em ON em.id_leitor = le.id_leitor
WHERE em.multa > 0
ORDER BY em.multa DESC;

-- 13. Listar exemplares disponíveis e o título do livro correspondente.
SELECT ex.codigo_patrimonio, ex.estado, l.titulo
FROM exemplares ex
INNER JOIN livros l ON l.id_livro = ex.id_livro
WHERE ex.disponivel = TRUE
ORDER BY l.titulo;

-- 14. Contar exemplares por estado de conservação.
SELECT estado, COUNT(*) AS quantidade
FROM exemplares
GROUP BY estado
ORDER BY quantidade DESC, estado;

-- 15. Mostrar editoras que publicaram mais de um livro.
SELECT e.nome AS editora, COUNT(l.id_livro) AS total_livros
FROM editoras e
INNER JOIN livros l ON l.id_editora = e.id_editora
GROUP BY e.id_editora, e.nome
HAVING COUNT(l.id_livro) > 1
ORDER BY total_livros DESC, e.nome;

-- 16. Listar autores brasileiros.
SELECT nome, nacionalidade
FROM autores
WHERE nacionalidade LIKE '%brasileir%'
ORDER BY nome;

-- 17. Mostrar empréstimos feitos em setembro de 2026.
SELECT id_emprestimo, id_leitor, id_exemplar, data_emprestimo
FROM emprestimos
WHERE data_emprestimo BETWEEN '2026-09-01' AND '2026-09-30'
ORDER BY data_emprestimo;

-- 18. Calcular o total de multas por leitor.
SELECT le.nome AS leitor, SUM(em.multa) AS total_multas
FROM leitores le
INNER JOIN emprestimos em ON em.id_leitor = le.id_leitor
GROUP BY le.id_leitor, le.nome
HAVING SUM(em.multa) > 0
ORDER BY total_multas DESC;

-- 19. Mostrar livros com quantidade total de exemplares.
SELECT l.titulo, COUNT(ex.id_exemplar) AS total_exemplares
FROM livros l
LEFT JOIN exemplares ex ON ex.id_livro = l.id_livro
GROUP BY l.id_livro, l.titulo
ORDER BY total_exemplares DESC, l.titulo;

-- 20. Listar leitores e a quantidade de empréstimos ainda em aberto.
SELECT le.nome AS leitor,
       SUM(CASE WHEN em.data_devolucao IS NULL THEN 1 ELSE 0 END) AS emprestimos_abertos
FROM leitores le
LEFT JOIN emprestimos em ON em.id_leitor = le.id_leitor
GROUP BY le.id_leitor, le.nome
ORDER BY emprestimos_abertos DESC, le.nome;
