-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/06/2024 às 15:34
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `teatro`
--
CREATE DATABASE IF NOT EXISTS `teatro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `teatro`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ingresso`
--

DROP TABLE IF EXISTS `ingresso`;
CREATE TABLE `ingresso` (
  `id_ingresso` int(11) NOT NULL,
  `valor` int(11) DEFAULT NULL CHECK (`valor` > 0),
  `assento` int(11) NOT NULL,
  `comprador` varchar(50) NOT NULL,
  `idade_comprador` int(11) DEFAULT NULL CHECK (`idade_comprador` >= 18),
  `id_sessao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pecateatral`
--

DROP TABLE IF EXISTS `pecateatral`;
CREATE TABLE `pecateatral` (
  `id_peca` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `num_cenas` int(11) NOT NULL,
  `num_musicas` int(11) NOT NULL,
  `tempo` varchar(25) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `classificacao` varchar(10) NOT NULL,
  `estreia` varchar(10) DEFAULT NULL,
  `id_roterista` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `roterista`
--

DROP TABLE IF EXISTS `roterista`;
CREATE TABLE `roterista` (
  `id_roterista` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `contato` varchar(15) NOT NULL,
  `biografia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessao`
--

DROP TABLE IF EXISTS `sessao`;
CREATE TABLE `sessao` (
  `id_sessao` int(11) NOT NULL,
  `data_hora` varchar(20) DEFAULT NULL,
  `id_peca` int(11) DEFAULT NULL,
  `id_teatro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `teatro`
--

DROP TABLE IF EXISTS `teatro`;
CREATE TABLE `teatro` (
  `id_teatro` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `contato` varchar(15) NOT NULL,
  `tamanho` int(11) DEFAULT NULL CHECK (`tamanho` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `ingresso`
--
ALTER TABLE `ingresso`
  ADD PRIMARY KEY (`id_ingresso`),
  ADD KEY `id_sessao` (`id_sessao`);

--
-- Índices de tabela `pecateatral`
--
ALTER TABLE `pecateatral`
  ADD PRIMARY KEY (`id_peca`),
  ADD KEY `id_roterista` (`id_roterista`);

--
-- Índices de tabela `roterista`
--
ALTER TABLE `roterista`
  ADD PRIMARY KEY (`id_roterista`);

--
-- Índices de tabela `sessao`
--
ALTER TABLE `sessao`
  ADD PRIMARY KEY (`id_sessao`),
  ADD KEY `id_peca` (`id_peca`),
  ADD KEY `id_teatro` (`id_teatro`);

--
-- Índices de tabela `teatro`
--
ALTER TABLE `teatro`
  ADD PRIMARY KEY (`id_teatro`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `ingresso`
--
ALTER TABLE `ingresso`
  ADD CONSTRAINT `ingresso_ibfk_1` FOREIGN KEY (`id_sessao`) REFERENCES `sessao` (`id_sessao`);

--
-- Restrições para tabelas `pecateatral`
--
ALTER TABLE `pecateatral`
  ADD CONSTRAINT `pecateatral_ibfk_1` FOREIGN KEY (`id_roterista`) REFERENCES `roterista` (`id_roterista`);

--
-- Restrições para tabelas `sessao`
--
ALTER TABLE `sessao`
  ADD CONSTRAINT `sessao_ibfk_1` FOREIGN KEY (`id_peca`) REFERENCES `pecateatral` (`id_peca`),
  ADD CONSTRAINT `sessao_ibfk_2` FOREIGN KEY (`id_teatro`) REFERENCES `teatro` (`id_teatro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
