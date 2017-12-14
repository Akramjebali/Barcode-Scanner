-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2016 at 02:09 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scan`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent_portier`
--

CREATE TABLE IF NOT EXISTS `agent_portier` (
  `idAgentPortier` varchar(20) NOT NULL,
  `num_CIN` varchar(20) NOT NULL,
  `login` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  PRIMARY KEY (`idAgentPortier`),
  KEY `fk_num` (`num_CIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agent_portier`
--

INSERT INTO `agent_portier` (`idAgentPortier`, `num_CIN`, `login`, `pwd`) VALUES
('P001', '0000000', 'p', 'p');

-- --------------------------------------------------------

--
-- Table structure for table `cis_agentportier`
--

CREATE TABLE IF NOT EXISTS `cis_agentportier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `num_CIS` varchar(20) NOT NULL,
  `id_AgentPortier` varchar(20) NOT NULL,
  `datePointage` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_num_cis` (`num_CIS`),
  KEY `fk_idagentp` (`id_AgentPortier`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `cis_agentportier`
--

INSERT INTO `cis_agentportier` (`ID`, `num_CIS`, `id_AgentPortier`, `datePointage`) VALUES
(10, '9780123456786', 'P001', '2016-04-30 07:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `spectateur`
--

CREATE TABLE IF NOT EXISTS `spectateur` (
  `num_CIS` varchar(20) NOT NULL,
  `num_CIN` varchar(20) NOT NULL,
  `etat` varchar(20) NOT NULL,
  `img_code_barre` varchar(30) NOT NULL,
  PRIMARY KEY (`num_CIS`),
  KEY `fk_num_CIN` (`num_CIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spectateur`
--

INSERT INTO `spectateur` (`num_CIS`, `num_CIN`, `etat`, `img_code_barre`) VALUES
('9780123456786', '0000000', 'Autorise', '');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `num_CIN` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `photo` varchar(20) NOT NULL,
  `CINRecto` varchar(20) NOT NULL,
  `CINRVerso` varchar(20) NOT NULL,
  `login` varchar(30) NOT NULL,
  `mdp` varchar(30) NOT NULL,
  PRIMARY KEY (`num_CIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`num_CIN`, `nom`, `prenom`, `adresse`, `mail`, `photo`, `CINRecto`, `CINRVerso`, `login`, `mdp`) VALUES
('0000000', 'test', '', '', '', '', '', '', '', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agent_portier`
--
ALTER TABLE `agent_portier`
  ADD CONSTRAINT `fk_num` FOREIGN KEY (`num_CIN`) REFERENCES `utilisateur` (`num_CIN`);

--
-- Constraints for table `cis_agentportier`
--
ALTER TABLE `cis_agentportier`
  ADD CONSTRAINT `fk_idagentp` FOREIGN KEY (`id_AgentPortier`) REFERENCES `agent_portier` (`idAgentPortier`),
  ADD CONSTRAINT `fk_num_cis` FOREIGN KEY (`num_CIS`) REFERENCES `spectateur` (`num_CIS`);

--
-- Constraints for table `spectateur`
--
ALTER TABLE `spectateur`
  ADD CONSTRAINT `fk_num_CIN` FOREIGN KEY (`num_CIN`) REFERENCES `utilisateur` (`num_CIN`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
