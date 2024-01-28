-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS clinicavet;
USE clinicavet;

-- Criação da Tabela Cliente
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

-- Criação da Tabela Animal
CREATE TABLE Animal (
    animal_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    especie VARCHAR(50),
    raca VARCHAR(50),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Criação da Tabela Enfermidade
CREATE TABLE Enfermidade (
    enfermidade_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao TEXT
);

-- Tabela de Junção para Animal e Enfermidade (relacionamento muitos para muitos)
CREATE TABLE Animal_Enfermidade (
    animal_id INT,
    enfermidade_id INT,
    PRIMARY KEY (animal_id, enfermidade_id),
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id),
    FOREIGN KEY (enfermidade_id) REFERENCES Enfermidade(enfermidade_id)
);

-- Criação da Tabela Veterinario
CREATE TABLE Veterinario (
    veterinario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    especialidade VARCHAR(100)
);

-- Criação da Tabela Atendimento
CREATE TABLE Atendimento (
    atendimento_id INT PRIMARY KEY AUTO_INCREMENT,
    veterinario_id INT,
    animal_id INT,
    data_atendimento DATE,
    FOREIGN KEY (veterinario_id) REFERENCES Veterinario(veterinario_id),
    FOREIGN KEY (animal_id) REFERENCES Animal(animal_id)
);