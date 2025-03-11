CREATE SCHEMA IF NOT EXISTS `anafit` DEFAULT CHARACTER SET utf8 ;
USE `anafit`;

-- -----------------------------------------------------
-- Tabela `anafit`.`tb_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anafit`.`tb_cliente` (
  `cpf` BIGINT NOT NULL,
  `primeironome` VARCHAR(50) NOT NULL,
  `sobrenome` VARCHAR(50) NOT NULL,
  `datanasc` DATE NOT NULL,
  `peso` DECIMAL(5, 2) NOT NULL,
  `altura` DECIMAL(3, 2),
  `whatsapp` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) UNIQUE NOT NULL,
  `rua` VARCHAR(100) NOT NULL,
  `numero` INT(6) NOT NULL,
  `complemento` VARCHAR(150),
  `cep` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE = InnoDB;

-- -------------------------------------------------------
-- Tabela `anafit`.`tb_treino`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS `anafit`.`tb_treino` (
  `cpf_cliente` BIGINT NOT NULL,
  `diadasemana` DATE NOT NULL,
  `horario` TIME NOT NULL,
  `tipo` VARCHAR(50),
  PRIMARY KEY (`cpf_cliente`, `diadasemana`, `horario`),
  CONSTRAINT `fk_cpf_cliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `anafit`.`tb_cliente` (`cpf`) ON DELETE CASCADE
) ENGINE = InnoDB;


-- -------------------------------------------------------
-- Inserts nas tabelas tb_cliente e tb_treino 
-- -------------------------------------------------------

INSERT INTO `anafit`.`tb_cliente` 
(`cpf`, `primeironome`, `sobrenome`, `datanasc`, `peso`, `altura`, `whatsapp`, `email`, `rua`, `numero`, `complemento`, `cep`) 
VALUES
(11122233300, 'Emilia', 'Tevere', '1992-03-11', 49.00, 1.50, '+5511998765432', 'emilia.tevere@lugunica.com', 'Floresta da Sombra', 301, 'Cabana de Gelo', '12345000'),
(22233344411, 'Rem', 'Nox', '1993-09-02', 49.50, 1.55, '+5511987654321', 'rem.nox@mansaoroswaal.com', 'Avenida do Castelo', 404, 'Torre dos Demônios', '23456000'),
(33344455522, 'Ram', 'Nox', '1993-09-02', 48.00, 1.54, '+5511976543210', 'ram.nox@mansaoroswaal.com', 'Rua da Tempestade', 505, 'Mansão dos Nox', '34567000'),
(44455566633, 'Subaru', 'Natsuki', '1995-01-01', 70.00, 1.75, '+5511934567890', 'subaru.natsuki@lugunica.com', 'Avenida dos Heróis', 101, 'Casa de Dragon', '45678000'),
(55566677744, 'Beatrice', 'Azazel', '1997-06-01', 40.00, 1.45, '+5511945678901', 'beatrice.azazel@bibliotecamistica.com', 'Biblioteca do Século', 303, 'Sala de Livros Mágicos', '56789000');

INSERT INTO `anafit`.`tb_treino` 
(`diadasemana`, `horario`, `tipo`) 
VALUES
('2025-03-10', '08:00:00', 'Musculação'),
('2025-03-11', '09:30:00', 'Pilates'),
('2025-03-12', '07:00:00', 'Corrida'),
('2025-03-13', '18:00:00', 'Ioga'),
('2025-03-14', '06:30:00', 'Ciclismo');

-- -------------------------------------------------------
-- Updates nas tabelas tb_cliente e tb_treino 
-- -------------------------------------------------------

UPDATE `anafit`.`tb_cliente`
SET 
  `primeironome` = '', 
  `sobrenome` = '', 
  `datanasc` = '', 
  `peso` = '', 
  `altura` = '', 
  `whatsapp` = '', 
  `email` = '', 
  `rua` = '', 
  `numero` = '',
  `complemento` = '', 
  `cep` = ''
WHERE `cpf` = ''; 


UPDATE `anafit`.`tb_treino`
SET 
  `diadasemana` = '', 
  `horario` = '', 
  `tipo` = ''
WHERE `cpf_cliente` = '';


DELETE FROM `anafit`.`tb_treino` WHERE `tipo` = 'Ciclismo';




