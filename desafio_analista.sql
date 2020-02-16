-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Fev-2020 às 17:52
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `desafio_analista`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `Cargo` varchar(255) NOT NULL,
  `Salario` decimal(20,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`idCargo`, `Cargo`, `Salario`) VALUES
(1, 'Analista de Sistema', '5000'),
(2, 'Desenvolvedor', '2500');

-- --------------------------------------------------------

--
-- Estrutura da tabela `orgao`
--

CREATE TABLE `orgao` (
  `idOrgao` int(11) NOT NULL,
  `Orgao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `orgao`
--

INSERT INTO `orgao` (`idOrgao`, `Orgao`) VALUES
(1, 'Secretaria da Fazenda'),
(2, 'Tribunal de Contas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sistema`
--

CREATE TABLE `sistema` (
  `idSistema` int(11) NOT NULL,
  `Sistema` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sistema`
--

INSERT INTO `sistema` (`idSistema`, `Sistema`) VALUES
(1, 'Modulo Financeiro'),
(2, 'Modulo de Cadastro'),
(3, 'Modulo de Relatorios'),
(4, 'Modulo de Configuracao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `CPF` varchar(20) DEFAULT NULL,
  `Status` char(1) NOT NULL,
  `Cargo_idCargo` int(11) NOT NULL,
  `Orgao_idOrgao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Nome`, `CPF`, `Status`, `Cargo_idCargo`, `Orgao_idOrgao`) VALUES
(1, 'Usuario01', '11122233344', 'A', 1, 1),
(2, 'Usuario02', '55566677788', 'A', 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_has_sistema`
--

CREATE TABLE `usuario_has_sistema` (
  `Usuario_idUsuario` int(11) NOT NULL,
  `Usuario_Cargo_idCargo` int(11) NOT NULL,
  `Usuario_Orgao_idOrgao` int(11) NOT NULL,
  `Sistema_idSistema` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario_has_sistema`
--

INSERT INTO `usuario_has_sistema` (`Usuario_idUsuario`, `Usuario_Cargo_idCargo`, `Usuario_Orgao_idOrgao`, `Sistema_idSistema`) VALUES
(1, 1, 1, 1),
(1, 1, 1, 3),
(2, 2, 2, 2),
(2, 2, 2, 4);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idCargo`);

--
-- Índices para tabela `orgao`
--
ALTER TABLE `orgao`
  ADD PRIMARY KEY (`idOrgao`);

--
-- Índices para tabela `sistema`
--
ALTER TABLE `sistema`
  ADD PRIMARY KEY (`idSistema`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`,`Cargo_idCargo`,`Orgao_idOrgao`),
  ADD KEY `fk_Usuario_Cargo_idx` (`Cargo_idCargo`),
  ADD KEY `fk_Usuario_Orgao1_idx` (`Orgao_idOrgao`);

--
-- Índices para tabela `usuario_has_sistema`
--
ALTER TABLE `usuario_has_sistema`
  ADD PRIMARY KEY (`Usuario_idUsuario`,`Usuario_Cargo_idCargo`,`Usuario_Orgao_idOrgao`,`Sistema_idSistema`),
  ADD KEY `fk_Usuario_has_Sistema_Sistema1_idx` (`Sistema_idSistema`),
  ADD KEY `fk_Usuario_has_Sistema_Usuario1_idx` (`Usuario_idUsuario`,`Usuario_Cargo_idCargo`,`Usuario_Orgao_idOrgao`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `orgao`
--
ALTER TABLE `orgao`
  MODIFY `idOrgao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `sistema`
--
ALTER TABLE `sistema`
  MODIFY `idSistema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Cargo` FOREIGN KEY (`Cargo_idCargo`) REFERENCES `cargo` (`idCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Orgao1` FOREIGN KEY (`Orgao_idOrgao`) REFERENCES `orgao` (`idOrgao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario_has_sistema`
--
ALTER TABLE `usuario_has_sistema`
  ADD CONSTRAINT `fk_Usuario_has_Sistema_Sistema1` FOREIGN KEY (`Sistema_idSistema`) REFERENCES `sistema` (`idSistema`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_has_Sistema_Usuario1` FOREIGN KEY (`Usuario_idUsuario`,`Usuario_Cargo_idCargo`,`Usuario_Orgao_idOrgao`) REFERENCES `usuario` (`idUsuario`, `Cargo_idCargo`, `Orgao_idOrgao`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
