-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generato il: Dic 11, 2013 alle 15:28
-- Versione del server: 5.5.34
-- Versione PHP: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `meetplanner`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `attrezzatura`
--

CREATE TABLE IF NOT EXISTS `attrezzatura` (
  `IdAttrezzatura` int(11) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Sala` int(11) NOT NULL,
  PRIMARY KEY (`IdAttrezzatura`,`Sala`),
  KEY `fk_Attrezzatura_Sala1_idx` (`Sala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `IdEvento` int(11) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Descrizione` varchar(45) DEFAULT NULL,
  `DataInizioDefinita` datetime DEFAULT NULL,
  `DataFineDefinita` datetime DEFAULT NULL,
  `Allegato` blob,
  `OrganizzatoreEmail` varchar(45) NOT NULL,
  `SalaDefinita` int(11) NOT NULL,
  PRIMARY KEY (`IdEvento`),
  KEY `fk_Evento_Organizzatore1_idx` (`OrganizzatoreEmail`),
  KEY `fk_Evento_Sala1_idx` (`SalaDefinita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `opzione`
--

CREATE TABLE IF NOT EXISTS `opzione` (
  `IdOpzione` int(11) NOT NULL,
  `Evento` int(11) NOT NULL,
  `DataInzio` datetime NOT NULL,
  `DataFine` datetime NOT NULL,
  `Punteggio` int(11) DEFAULT NULL,
  `Sala` int(11) NOT NULL,
  PRIMARY KEY (`IdOpzione`,`Sala`),
  KEY `fk_Opzione_Evento1_idx` (`Evento`),
  KEY `fk_Opzione_Sala1_idx` (`Sala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `organizzatore`
--

CREATE TABLE IF NOT EXISTS `organizzatore` (
  `Email` varchar(45) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Cognome` varchar(45) DEFAULT NULL,
  `Amministratore` tinyint(1) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `organizzatore`
--

INSERT INTO `organizzatore` (`Email`, `Nome`, `Cognome`, `Amministratore`, `Password`) VALUES
('fab1234@hotmail.it', 'Fabio', 'Ricchiuti', 1, 'fabio'),
('fabio@email.it', 'Fabio', 'Ricchiuti', 1, 'fabio');

-- --------------------------------------------------------

--
-- Struttura della tabella `rubrica`
--

CREATE TABLE IF NOT EXISTS `rubrica` (
  `Email_utente` varchar(45) NOT NULL,
  `Email_organizzatore` varchar(45) NOT NULL,
  PRIMARY KEY (`Email_utente`,`Email_organizzatore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `sala`
--

CREATE TABLE IF NOT EXISTS `sala` (
  `IdSala` int(11) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Ubicazione` varchar(45) DEFAULT NULL,
  `Capienza` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdSala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE IF NOT EXISTS `utente` (
  `Email` varchar(45) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Cognome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `votante`
--

CREATE TABLE IF NOT EXISTS `votante` (
  `IdVotante` varchar(45) NOT NULL,
  `Ticket` char(16) DEFAULT NULL,
  `Commento` varchar(45) DEFAULT NULL,
  `Votazione` tinyint(1) DEFAULT NULL,
  `Evento` int(11) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`IdVotante`),
  KEY `fk_Votante_Evento1_idx` (`Evento`),
  KEY `fk_Votante_Utente1_idx` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `voto`
--

CREATE TABLE IF NOT EXISTS `voto` (
  `IdVoto` varchar(45) NOT NULL,
  `Evento` int(11) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Opzione` int(11) NOT NULL,
  PRIMARY KEY (`IdVoto`),
  KEY `fk_Voto_Opzione1_idx` (`Opzione`),
  KEY `fk_Voto_Votante1_idx` (`Email`),
  KEY `fk_Voto_Evento1_idx` (`Evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `attrezzatura`
--
ALTER TABLE `attrezzatura`
  ADD CONSTRAINT `fk_Attrezzatura_Sala1` FOREIGN KEY (`Sala`) REFERENCES `sala` (`IdSala`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `fk_Evento_Organizzatore1` FOREIGN KEY (`OrganizzatoreEmail`) REFERENCES `organizzatore` (`Email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Evento_Sala1` FOREIGN KEY (`SalaDefinita`) REFERENCES `sala` (`IdSala`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `opzione`
--
ALTER TABLE `opzione`
  ADD CONSTRAINT `fk_Opzione_Evento1` FOREIGN KEY (`Evento`) REFERENCES `evento` (`IdEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Opzione_Sala1` FOREIGN KEY (`Sala`) REFERENCES `sala` (`IdSala`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `votante`
--
ALTER TABLE `votante`
  ADD CONSTRAINT `fk_Votante_Evento1` FOREIGN KEY (`Evento`) REFERENCES `evento` (`IdEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Votante_Utente1` FOREIGN KEY (`Email`) REFERENCES `utente` (`Email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `voto`
--
ALTER TABLE `voto`
  ADD CONSTRAINT `fk_Voto_Evento1` FOREIGN KEY (`Evento`) REFERENCES `evento` (`IdEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Voto_Opzione1` FOREIGN KEY (`Opzione`) REFERENCES `opzione` (`IdOpzione`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Voto_Votante1` FOREIGN KEY (`Email`) REFERENCES `votante` (`Email`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
