-- ==========================================================
-- Schema: Clínica Veterinária (MySQL 8+)
-- Tabelas (conforme imagem): Cliente, Animal, Veterinario,
-- Atendimento, Enfermidade, Animal_Enfermidade
-- Inclui: criação do schema + comentários + carga de dados (INSERTs)
-- ==========================================================

/* ----------------------------------------------------------
   (Opcional) Recria o banco
   ---------------------------------------------------------- */
DROP DATABASE IF EXISTS clinicavet;
CREATE DATABASE clinicavet
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_0900_ai_ci;

USE clinicavet;

/* ----------------------------------------------------------
   Tabela: Cliente
   Armazena informações dos tutores dos animais
   ---------------------------------------------------------- */
DROP TABLE IF EXISTS Animal_Enfermidade;
DROP TABLE IF EXISTS Atendimento;
DROP TABLE IF EXISTS Animal;
DROP TABLE IF EXISTS Enfermidade;
DROP TABLE IF EXISTS Veterinario;
DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
  cliente_id INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador único do cliente (tutor).',
  nome       VARCHAR(120) NOT NULL COMMENT 'Nome completo do tutor.',
  endereco   VARCHAR(200) NULL COMMENT 'Endereço do tutor.',
  telefone   VARCHAR(20)  NULL COMMENT 'Telefone de contato do tutor.',
  PRIMARY KEY (cliente_id)
) ENGINE=InnoDB COMMENT='Armazena informações dos tutores dos animais.';

/* ----------------------------------------------------------
   Tabela: Animal
   Registra dados dos animais atendidos
   ---------------------------------------------------------- */
CREATE TABLE Animal (
  animal_id  INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador único do animal.',
  nome       VARCHAR(80)  NOT NULL COMMENT 'Nome do animal.',
  especie    VARCHAR(60)  NOT NULL COMMENT 'Espécie do animal (ex.: cão, gato).',
  raca       VARCHAR(80)  NULL COMMENT 'Raça do animal.',
  cliente_id INT NOT NULL COMMENT 'Cliente (tutor) responsável pelo animal.',
  PRIMARY KEY (animal_id),
  KEY idx_animal_cliente (cliente_id),
  CONSTRAINT fk_animal_cliente
    FOREIGN KEY (cliente_id) REFERENCES Cliente (cliente_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB COMMENT='Registra dados dos animais atendidos.';

/* ----------------------------------------------------------
   Tabela: Veterinario
   Profissionais da clínica
   ---------------------------------------------------------- */
CREATE TABLE Veterinario (
  veterinario_id INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador único do veterinário.',
  nome           VARCHAR(120) NOT NULL COMMENT 'Nome do veterinário.',
  especialidade  VARCHAR(120) NULL COMMENT 'Especialidade do veterinário (ex.: cirurgia, dermatologia).',
  PRIMARY KEY (veterinario_id)
) ENGINE=InnoDB COMMENT='Profissionais da clínica.';

/* ----------------------------------------------------------
   Tabela: Enfermidade
   Catálogo de doenças e condições médicas
   ---------------------------------------------------------- */
CREATE TABLE Enfermidade (
  enfermidade_id INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador único da enfermidade.',
  nome           VARCHAR(120) NOT NULL COMMENT 'Nome da enfermidade/condição.',
  descricao      TEXT NULL COMMENT 'Descrição breve da enfermidade/condição.',
  PRIMARY KEY (enfermidade_id),
  UNIQUE KEY uk_enfermidade_nome (nome)
) ENGINE=InnoDB COMMENT='Catálogo de doenças e condições médicas.';

/* ----------------------------------------------------------
   Tabela: Atendimento
   Controla as consultas realizadas
   ---------------------------------------------------------- */
CREATE TABLE Atendimento (
  atendimento_id   INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador único do atendimento (consulta).',
  veterinario_id   INT NOT NULL COMMENT 'Veterinário responsável pelo atendimento.',
  animal_id        INT NOT NULL COMMENT 'Animal atendido.',
  data_atendimento DATE NOT NULL COMMENT 'Data em que o atendimento ocorreu.',
  PRIMARY KEY (atendimento_id),
  KEY idx_atendimento_vet (veterinario_id),
  KEY idx_atendimento_animal (animal_id),
  CONSTRAINT fk_atendimento_veterinario
    FOREIGN KEY (veterinario_id) REFERENCES Veterinario (veterinario_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT fk_atendimento_animal
    FOREIGN KEY (animal_id) REFERENCES Animal (animal_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB COMMENT='Controla as consultas realizadas.';

/* ----------------------------------------------------------
   Tabela: Animal_Enfermidade
   Tabela de junção para relacionar animais e suas enfermidades
   ---------------------------------------------------------- */
CREATE TABLE Animal_Enfermidade (
  animal_id      INT NOT NULL COMMENT 'FK para Animal.',
  enfermidade_id INT NOT NULL COMMENT 'FK para Enfermidade.',
  PRIMARY KEY (animal_id, enfermidade_id),
  KEY idx_ae_enfermidade (enfermidade_id),
  CONSTRAINT fk_ae_animal
    FOREIGN KEY (animal_id) REFERENCES Animal (animal_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_ae_enfermidade
    FOREIGN KEY (enfermidade_id) REFERENCES Enfermidade (enfermidade_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB COMMENT='Junção N:N entre Animal e Enfermidade.';
