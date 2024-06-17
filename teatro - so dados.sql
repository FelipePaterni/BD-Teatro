-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/06/2024 às 15:35
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `teatro`
--

--
-- Despejando dados para a tabela `ingresso`
--

INSERT INTO `ingresso` (`id_ingresso`, `valor`, `assento`, `comprador`, `idade_comprador`, `id_sessao`) VALUES
(1, 50, 101, 'Fernanda Oliveira', 28, 1),
(2, 70, 205, 'Rafael Souza', 35, 2),
(3, 60, 301, 'Juliana Santos', 19, 3);

--
-- Despejando dados para a tabela `pecateatral`
--

INSERT INTO `pecateatral` (`id_peca`, `nome`, `num_cenas`, `num_musicas`, `tempo`, `descricao`, `classificacao`, `estreia`, `id_roterista`) VALUES
(1, 'O Fantasma da Ópera', 20, 15, '2 horas', 'Uma história de amor e mistério ambientada em uma ópera famosa.', 'Livre', '15/07/2023', 1),
(2, 'Hamlet', 25, 10, '2 horas e meia', 'Uma tragédia clássica de William Shakespeare.', '12 anos', '10/05/2023', 2),
(3, 'O PEQUENO PRÍNCIPE – UMA AVENTURA BRASILEIRA', 30, 20, '1 hora', 'Essa é uma história de um menino que viaja por muitos planetas tentando compreender o Amor e a Vida. ', 'Livre', '20/09/2023', 3);

--
-- Despejando dados para a tabela `roterista`
--

INSERT INTO `roterista` (`id_roterista`, `nome`, `contato`, `biografia`) VALUES
(1, 'João Silva', '(11) 9999-8888', 'João Silva é um roteirista premiado com diversas peças no currículo.'),
(2, 'Maria Souza', '(21) 7777-6666', 'Maria Souza é uma roterista conhecida por suas comédias leves e satíricas.'),
(3, 'Carlos Oliveira', '(31) 5555-4444', 'Carlos Oliveira é um roterista iniciante, buscando explorar novos temas no teatro.');

--
-- Despejando dados para a tabela `sessao`
--

INSERT INTO `sessao` (`id_sessao`, `data_hora`, `id_peca`, `id_teatro`) VALUES
(1, '15/07/2023 19:00', 1, 1),
(2, '10/05/2023 20:00', 2, 2),
(3, '20/09/2023 18:30', 3, 3);

--
-- Despejando dados para a tabela `teatro`
--

INSERT INTO `teatro` (`id_teatro`, `nome`, `endereco`, `contato`, `tamanho`) VALUES
(1, 'Teatro Municipal', 'Rua dos Artistas, 123', '(11) 3333-2222', 500),
(2, 'Teatro Nacional', 'Av. Cultural, 456', '(21) 8888-9999', 700),
(3, 'Teatro da Cidade', 'Praça das Artes, 789', '(31) 4444-3333', 300);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
