CREATE SCHEMA IF NOT EXISTS `anafit` DEFAULT CHARACTER SET utf8 ;
USE `anafit`;

-- -----------------------------------------------------
-- Tabela `anafit`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `anafit`.`cliente` (
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
-- Tabela `anafit`.`treino`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS `anafit`.`treino` (
  `diadasemana` DATE NOT NULL,
  `horario` TIME NOT NULL,
  `tipo` VARCHAR(50)
) ENGINE = InnoDB;

-- -------------------------------------------------------
-- Tabela `anafit`.`pagamento`
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS `anafit`.`pagamento` (
  `id_pagamento` INT AUTO_INCREMENT,
  `valor` DECIMAL(5,2) NOT NULL,
  `data_pagamento` DATE NOT NULL,
  `cpf` BIGINT,
  CONSTRAINT `fk_cpf` FOREIGN KEY (`cpf`) REFERENCES `anafit`.`cliente` (`cpf`),
  PRIMARY KEY (`id_pagamento`)
) ENGINE = InnoDB;

-- -------------------------------------------------------
-- INSERT nas tabelas cliente e treino 
-- -------------------------------------------------------

INSERT INTO `anafit`.`treino` 
(`diadasemana`, `horario`, `tipo`) 
VALUES
('2025-03-10', '08:00:00', 'Musculação'),
('2025-03-11', '09:30:00', 'Pilates'),
('2025-03-12', '07:00:00', 'Corrida'),
('2025-03-13', '18:00:00', 'Ioga'),
('2025-03-14', '06:30:00', 'Ciclismo');

INSERT INTO `anafit`.`cliente` 
(`cpf`, `primeironome`, `sobrenome`, `datanasc`, `peso`, `altura`, `whatsapp`, `email`, `rua`, `numero`, `complemento`, `cep`) 
VALUES
(12345678911, 'João', 'Silva', '1990-05-15', 72.30, 1.80, '+5511998765432', 'joao.silva@email.com', 'Rua das Flores', 120, 'Apt 301', '01234000'),
(12345678912, 'Maria', 'Oliveira', '1985-10-22', 58.00, 1.65, '+5511987654321', 'maria.oliveira@email.com', 'Avenida Paulista', 1000, 'Bloco B', '01310000'),
(12345678913, 'Carlos', 'Pereira', '1995-07-30', 85.50, 1.90, '+5511987432123', 'carlos.pereira@email.com', 'Rua dos Três Corações', 350, '', '01453000'),
(12345678914, 'Beatriz', 'Santos', '2000-02-10', 50.70, 1.70, '+5511976543210', 'beatriz.santos@email.com', 'Rua da Paz', 555, 'Sala 502', '02540000'),
(12345678915, 'Lucas', 'Costa', '1992-11-05', 77.40, 1.78, '+5511998764321', 'lucas.costa@email.com', 'Praça da Liberdade', 300, '', '03120000');

INSERT INTO pagamento(`valor`, `data_pagamento`, `cpf`)
VALUES
(150.00, '2025-03-01', 12345678911), -- Pagamento do João
(200.00, '2025-03-05', 12345678912), -- Pagamento da Maria
(300.00, '2025-03-10', 12345678913), -- Pagamento do Carlos
(250.00, '2025-03-02', 12345678911), -- Outro pagamento do João
(100.00, '2025-03-03', 12345678915); -- Pagamento de Lucas

-- -------------------------------------------------------
-- UPDATE nas tabelas cliente e treino 
-- -------------------------------------------------------
UPDATE `anafit`.`treino`
SET 
  `diadasemana` = '2024-03-14' 
WHERE `tipo` = 'Musculação' AND `diadasemana` = "2025-03-10";

UPDATE `anafit`.`treino`
SET 
  `horario` = '15:00:00'
WHERE `horario` IN('18:00:00', '06:30:00');

UPDATE cliente
SET peso = 66.50, datanasc = '1980-07-18'
WHERE  cpf = 44455566633;

-- -------------------------------------------------------
-- SELECT nas tabelas cliente e treino 
-- -------------------------------------------------------
SELECT * FROM `treino`; 

SELECT tipo FROM `treino`;

SELECT diadasemana, horario FROM `treino`;

SELECT * FROM cliente
WHERE datanasc BETWEEN '1992-01-01' AND '2000-12-31';

SELECT * FROM cliente
WHERE peso BETWEEN 66 AND 100;

SELECT * FROM cliente
WHERE peso = 58 OR peso = 100;

-- -------------------------------------------------------
-- SELECT(SOMAR) nas tabelas cliente e treino 
-- -------------------------------------------------------
SELECT SUM(peso) AS soma_peso FROM `cliente`;

SELECT COUNT(*) AS total_registros FROM `cliente`;

SELECT AVG(peso) AS media_peso FROM `cliente`;

SELECT MAX(peso) AS maior_peso FROM `cliente`;

SELECT MIN(peso) AS menor_peso FROM `cliente`;


SELECT -- Combinando SELECT
  SUM(peso) AS soma_peso,
  COUNT(*) AS total_registros,
  AVG(peso) AS media_peso,
  MAX(peso) AS maior_peso
  MIN(peso) AS menor_peso,
FROM `cliente`; 

-- -------------------------------------------------------
-- SELECT MENOR E MAIOR nas tabelas cliente e treino 
-- -------------------------------------------------------
SELECT * FROM `cliente`
WHERE altura > 1.78;

SELECT * FROM `cliente`
WHERE altura < 1.70;


SELECT * FROM `cliente` -- Combinando SELECT 2
WHERE altura > 1.78 OR altura < 1.70;

SELECT
  c.`cpf`,
  c.`primeironome`,
  c.`sobrenome`,
  p.`valor`,
  p.`data_pagamento`
FROM 
  `cliente` c
INNER JOIN
  `pagamento` p ON c.`cpf` = p.`cpf`
WHERE
  c.`cpf` = 12345678911;

-- -------------------------------------------------------
-- DELETE nas tabelas cliente e treino 
-- -------------------------------------------------------
DELETE FROM `anafit`.`treino` WHERE `tipo` = 'Ciclismo';

DELETE * FROM `treino`;

DROP TABLE `treino`;

DROP DATABASE `anafit`;



