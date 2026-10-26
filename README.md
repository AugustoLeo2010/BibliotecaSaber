# Biblioteca Saber

Projeto acadêmico de planejamento, criação e teste de um banco de dados relacional para uma biblioteca.

## Objetivo

Organizar informações de livros, editoras, autores, categorias, leitores, exemplares e empréstimos. O projeto demonstra modelagem lógica, normalização, integridade referencial e consultas SQL, além de um site explicativo desenvolvido com HTML, CSS e JavaScript.

## Tecnologias

- MySQL
- SQL
- HTML5
- CSS3
- JavaScript
- Git e GitHub

## Estrutura do projeto

```text
Biblioteca-Saber/
├── sql/
│   ├── 01_criacao.sql
│   ├── 02_dados.sql
│   ├── 03_consultas.sql
│   └── 04_normalizacao.sql
├── index.html
├── style.css
├── script.js
└── README.md
```

## Como executar o banco localmente

1. Abra o MySQL Workbench ou outro cliente MySQL.
2. Execute `sql/01_criacao.sql` para criar o banco e as tabelas.
3. Execute `sql/02_dados.sql` uma única vez para inserir os dados de exemplo.
4. Execute `sql/03_consultas.sql` para testar as consultas.
5. `sql/04_normalizacao.sql` contém comentários de apoio teórico.

> Atenção: `01_criacao.sql` usa `CREATE DATABASE IF NOT EXISTS`, mas as tabelas existentes não são apagadas automaticamente. Para evitar erros de chave duplicada, não execute `02_dados.sql` repetidamente no mesmo banco sem limpar os dados ou recriar o banco.

## Modelo de dados

- `editoras` 1:N `livros`
- `livros` N:N `autores`, por meio de `livros_autores`
- `livros` N:N `categorias`, por meio de `livros_categorias`
- `livros` 1:N `exemplares`
- `leitores` 1:N `emprestimos`
- `exemplares` 1:N `emprestimos` ao longo do tempo

O diagrama lógico deve ser adicionado ao repositório como imagem ou PDF.

## Consultas incluídas

O arquivo `sql/03_consultas.sql` contém 20 consultas usando, entre outros recursos:
`INNER JOIN`, `LEFT JOIN`, `WHERE`, `LIKE`, `BETWEEN`, `GROUP BY`, `HAVING`, `ORDER BY`, `COUNT`, `SUM` e `CASE`.

## Como abrir o site

Abra `index.html` no navegador. Para publicar, envie os arquivos para um repositório GitHub e habilite GitHub Pages nas configurações do repositório, selecionando a branch e a pasta raiz apropriadas.

## Hospedagem do banco

O banco pode ser publicado em um serviço compatível com MySQL, como Aiven ou Azure Database for MySQL, conforme a disponibilidade e as condições atuais do provedor. Após criar a instância, importe os scripts SQL pelo cliente compatível e configure as credenciais com segurança.

**Não coloque senhas, usuários administrativos ou strings de conexão privadas no repositório GitHub ou no JavaScript do site.**

## Dump do banco

Para exportar estrutura e dados com MySQL Workbench, use **Server > Data Export**, selecione `biblioteca_saber`, marque estrutura e dados e exporte para um arquivo SQL. Guarde o dump no local solicitado pelo professor, respeitando as regras de segurança.

## Integrantes

- Preencha com os nomes dos integrantes.

## Observações

- Verifique os resultados das consultas no seu banco antes de apresentar capturas de tela.
- Ajuste o conteúdo e as referências conforme as exigências do professor.