-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 14-Jul-2021 às 17:26
-- Versão do servidor: 5.7.34-0ubuntu0.18.04.1
-- PHP Version: 7.2.34-18+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lifeweb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `rastreamento`
--

CREATE TABLE `rastreamento` (
  `id` int(11) NOT NULL,
  `veiculo_id` int(11) NOT NULL,
  `funcionario_id` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vel_registrada` int(11) NOT NULL,
  `latitude` varchar(256) NOT NULL,
  `longitude` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rastreamento`
--

INSERT INTO `rastreamento` (`id`, `veiculo_id`, `funcionario_id`, `data`, `vel_registrada`, `latitude`, `longitude`) VALUES
(1, 1, 1, '2019-07-15 14:01:16', 102, '-26.917633', '-49.355384'),
(2, 1, 2, '2019-07-15 16:26:42', 114, '-7.332858', '111.907535'),
(3, 1, 3, '2019-07-22 02:15:19', 95, '36.794952', '-119.754186');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rastreamento`
--
ALTER TABLE `rastreamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `veiculo_id` (`veiculo_id`),
  ADD KEY `funcionario_id` (`funcionario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rastreamento`
--
ALTER TABLE `rastreamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `rastreamento`
--
ALTER TABLE `rastreamento`
  ADD CONSTRAINT `rastreamento_ibfk_1` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculo` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rastreamento_ibfk_2` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionario` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
