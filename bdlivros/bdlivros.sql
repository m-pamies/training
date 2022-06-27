-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Out-2021 às 23:38
-- Versão do servidor: 8.0.26
-- versão do PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdlivros`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `amigos`
--

CREATE TABLE `amigos` (
  `id_amigo` int NOT NULL,
  `nome` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contacto` int DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `obs` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `amigos`
--

INSERT INTO `amigos` (`id_amigo`, `nome`, `contacto`, `email`, `obs`) VALUES
(1, 'Maria', 929292929, 'teste@gmail.com', ''),
(2, 'Gustavo', 929292929, '', ''),
(3, 'Manel', 929292929, '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `autores`
--

CREATE TABLE `autores` (
  `id_autor` int NOT NULL,
  `nome` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apelido` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_nacionalidade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `autores`
--

INSERT INTO `autores` (`id_autor`, `nome`, `apelido`, `id_nacionalidade`) VALUES
(1, 'António', 'Lobo Antunes', 1),
(3, 'Fernando', 'Pessoa', 1),
(4, 'Paulo', 'Coelho', 1),
(5, 'Maria', 'Coelho', 7),
(6, 'Maria', 'Lobo Antunes', 7),
(7, 'Karl Ove', 'Knausgard', 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `autores_livro`
--

CREATE TABLE `autores_livro` (
  `Id_livro` int NOT NULL,
  `Id_autor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `autores_livro`
--

INSERT INTO `autores_livro` (`Id_livro`, `Id_autor`) VALUES
(19, 3),
(4, 5),
(25, 5),
(4, 6),
(26, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `colecoes`
--

CREATE TABLE `colecoes` (
  `id_colecao` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `id_editora` int NOT NULL,
  `n_volumes` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `colecoes`
--

INSERT INTO `colecoes` (`id_colecao`, `nome`, `id_editora`, `n_volumes`) VALUES
(1, 'Não Aplicavel', 2, 0),
(2, 'Tony Chu', 3, 10),
(3, 'A minha luta', 4, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `editoras`
--

CREATE TABLE `editoras` (
  `id_editora` int NOT NULL,
  `editora` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `editoras`
--

INSERT INTO `editoras` (`id_editora`, `editora`) VALUES
(3, 'G-Floy'),
(1, 'Gradiva'),
(4, 'Leya'),
(2, 'Não aplicável');

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `Id_emprestimo` int NOT NULL,
  `Id_livro` int NOT NULL,
  `id_amigo` int NOT NULL,
  `data_emprestimo` date NOT NULL,
  `data_dev` date DEFAULT NULL,
  `obs` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `emprestimos`
--

INSERT INTO `emprestimos` (`Id_emprestimo`, `Id_livro`, `id_amigo`, `data_emprestimo`, `data_dev`, `obs`) VALUES
(1, 4, 1, '2021-10-12', NULL, NULL),
(2, 4, 1, '2021-10-09', '2021-10-12', ''),
(3, 25, 2, '2021-10-08', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero`
--

CREATE TABLE `genero` (
  `id_genero` int NOT NULL,
  `genero` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `genero`
--

INSERT INTO `genero` (`id_genero`, `genero`) VALUES
(3, 'Banda desenhada'),
(5, 'Biografias'),
(1, 'Ficção'),
(4, 'História'),
(2, 'Romance'),
(6, 'Viagens');

-- --------------------------------------------------------

--
-- Estrutura da tabela `idiomas`
--

CREATE TABLE `idiomas` (
  `id_idioma` int NOT NULL,
  `idioma` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `idiomas`
--

INSERT INTO `idiomas` (`id_idioma`, `idioma`) VALUES
(1, ''),
(10, 'Dinamarques'),
(5, 'Espanhol'),
(6, 'Esperanto'),
(4, 'Grego'),
(2, 'Italiano'),
(8, 'Japones'),
(7, 'Mandarim'),
(11, 'Português'),
(9, 'Russo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE `livros` (
  `Id_livro` int NOT NULL,
  `isbn` bigint NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `id_editora` int NOT NULL,
  `n_edicao` int NOT NULL,
  `data` date NOT NULL,
  `data_1_edicao` date NOT NULL,
  `id_colecao` int DEFAULT NULL,
  `volume` int DEFAULT NULL,
  `id_idioma` int NOT NULL,
  `id_genero` int NOT NULL,
  `id_localizacao` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`Id_livro`, `isbn`, `titulo`, `id_editora`, `n_edicao`, `data`, `data_1_edicao`, `id_colecao`, `volume`, `id_idioma`, `id_genero`, `id_localizacao`) VALUES
(4, 9789725305409, 'Adormecer', 1, 2, '2021-10-07', '2021-10-07', 1, 1, 2, 2, 1),
(19, 9789725305409, 'Declinio', 1, 2, '2021-10-05', '2021-10-05', 1, NULL, 6, 1, 1),
(25, 9789725306785, 'Planisfério Pessoal', 4, 5, '2007-01-01', '2006-02-08', 1, NULL, 11, 6, 4),
(26, 9789896414780, 'A morte do pai', 4, 1, '2014-12-08', '2014-12-08', 3, 1, 11, 5, 7);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `livro_autores`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `livro_autores` (
`Id_livro` int
,`isbn` bigint
,`titulo` varchar(100)
,`id_editora` int
,`n_edicao` int
,`data` date
,`data_1_edicao` date
,`id_colecao` int
,`volume` int
,`id_idioma` int
,`id_genero` int
,`id_localizacao` int
,`Id_autor` int
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `localizacao`
--

CREATE TABLE `localizacao` (
  `id_localizacao` int NOT NULL,
  `movel` varchar(20) NOT NULL,
  `prateleira` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `localizacao`
--

INSERT INTO `localizacao` (`id_localizacao`, `movel`, `prateleira`) VALUES
(1, 'Corredor 1', 2),
(3, 'Corredor 2', 1),
(4, 'Corredor 3', 4),
(5, 'Corredor 3', 4),
(6, 'Corredor 1', 5),
(7, 'Corredor 1', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nacionalidades`
--

CREATE TABLE `nacionalidades` (
  `id_nacionalidade` int NOT NULL,
  `nacionalidade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `nacionalidades`
--

INSERT INTO `nacionalidades` (`id_nacionalidade`, `nacionalidade`) VALUES
(8, 'Chinesa'),
(9, 'Dominicana'),
(7, 'Espanhola'),
(2, 'Inglesa'),
(11, 'Norueguesa'),
(1, 'Portuguesa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `user`, `pass`) VALUES
(1, 'admin', '12345678');

-- --------------------------------------------------------

--
-- Estrutura para vista `livro_autores`
--
DROP TABLE IF EXISTS `livro_autores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `livro_autores`  AS SELECT `l`.`Id_livro` AS `Id_livro`, `l`.`isbn` AS `isbn`, `l`.`titulo` AS `titulo`, `l`.`id_editora` AS `id_editora`, `l`.`n_edicao` AS `n_edicao`, `l`.`data` AS `data`, `l`.`data_1_edicao` AS `data_1_edicao`, `l`.`id_colecao` AS `id_colecao`, `l`.`volume` AS `volume`, `l`.`id_idioma` AS `id_idioma`, `l`.`id_genero` AS `id_genero`, `l`.`id_localizacao` AS `id_localizacao`, `a`.`Id_autor` AS `Id_autor` FROM (`livros` `l` left join `autores_livro` `a` on((`l`.`Id_livro` = `a`.`Id_livro`))) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`id_amigo`);

--
-- Índices para tabela `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id_autor`),
  ADD KEY `autores-nacionalidades` (`id_nacionalidade`);

--
-- Índices para tabela `autores_livro`
--
ALTER TABLE `autores_livro`
  ADD PRIMARY KEY (`Id_livro`,`Id_autor`),
  ADD KEY `autores_autores` (`Id_autor`);

--
-- Índices para tabela `colecoes`
--
ALTER TABLE `colecoes`
  ADD PRIMARY KEY (`id_colecao`),
  ADD KEY `colecoes-editoras` (`id_editora`);

--
-- Índices para tabela `editoras`
--
ALTER TABLE `editoras`
  ADD PRIMARY KEY (`id_editora`),
  ADD UNIQUE KEY `editora` (`editora`);

--
-- Índices para tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`Id_emprestimo`),
  ADD KEY `emprestimos-amigos` (`id_amigo`),
  ADD KEY `Id_livro` (`Id_livro`);

--
-- Índices para tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`),
  ADD UNIQUE KEY `genero` (`genero`);

--
-- Índices para tabela `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id_idioma`),
  ADD UNIQUE KEY `idiomas` (`idioma`);

--
-- Índices para tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`Id_livro`),
  ADD KEY `livro-editora` (`id_editora`),
  ADD KEY `livros-idioma` (`id_idioma`),
  ADD KEY `livros-genero` (`id_genero`),
  ADD KEY `livros-localizacao` (`id_localizacao`),
  ADD KEY `livros-colecao` (`id_colecao`);

--
-- Índices para tabela `localizacao`
--
ALTER TABLE `localizacao`
  ADD PRIMARY KEY (`id_localizacao`);

--
-- Índices para tabela `nacionalidades`
--
ALTER TABLE `nacionalidades`
  ADD PRIMARY KEY (`id_nacionalidade`),
  ADD UNIQUE KEY `nacionalidade` (`nacionalidade`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `amigos`
--
ALTER TABLE `amigos`
  MODIFY `id_amigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `colecoes`
--
ALTER TABLE `colecoes`
  MODIFY `id_colecao` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `editoras`
--
ALTER TABLE `editoras`
  MODIFY `id_editora` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `Id_emprestimo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `id_idioma` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `Id_livro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `localizacao`
--
ALTER TABLE `localizacao`
  MODIFY `id_localizacao` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `nacionalidades`
--
ALTER TABLE `nacionalidades`
  MODIFY `id_nacionalidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `autores`
--
ALTER TABLE `autores`
  ADD CONSTRAINT `autores-nacionalidades` FOREIGN KEY (`id_nacionalidade`) REFERENCES `nacionalidades` (`id_nacionalidade`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `autores_livro`
--
ALTER TABLE `autores_livro`
  ADD CONSTRAINT `autores_autores` FOREIGN KEY (`Id_autor`) REFERENCES `autores` (`id_autor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `livros-autores` FOREIGN KEY (`Id_livro`) REFERENCES `livros` (`Id_livro`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `colecoes`
--
ALTER TABLE `colecoes`
  ADD CONSTRAINT `colecoes-editoras` FOREIGN KEY (`id_editora`) REFERENCES `editoras` (`id_editora`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `emprestimos-amigos` FOREIGN KEY (`id_amigo`) REFERENCES `amigos` (`id_amigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `emprestimos_ibfk_1` FOREIGN KEY (`Id_livro`) REFERENCES `livros` (`Id_livro`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `livros`
--
ALTER TABLE `livros`
  ADD CONSTRAINT `livro-editora` FOREIGN KEY (`id_editora`) REFERENCES `editoras` (`id_editora`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `livros-colecao` FOREIGN KEY (`id_colecao`) REFERENCES `colecoes` (`id_colecao`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `livros-genero` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `livros-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id_idioma`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `livros-localizacao` FOREIGN KEY (`id_localizacao`) REFERENCES `localizacao` (`id_localizacao`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
