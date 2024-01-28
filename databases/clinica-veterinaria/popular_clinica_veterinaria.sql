USE clinicavet;

-- Inserir Clientes
INSERT INTO Cliente (nome, endereco, telefone) VALUES
    ('João Silva', 'Rua A, 123', '(11) 1234-5678'),
    ('Maria Oliveira', 'Avenida B, 456', '(21) 9876-5432'),
    ('Carlos Santos', 'Rua C, 789', '(31) 5555-1234'),
    ('Ana Souza', 'Rua D, 321', '(41) 8765-4321'),
    ('Ricardo Lima', 'Avenida E, 654', '(51) 2345-6789');

-- Inserir Animais
INSERT INTO Animal (nome, especie, raca, cliente_id) VALUES
    ('Fido', 'Cachorro', 'Labrador', 1),
    ('Mittens', 'Gato', 'Siamês', 2),
    ('Bolt', 'Cachorro', 'Vira-lata', 1),
    ('Whiskers', 'Gato', 'Persa', 3),
    ('Luna', 'Cachorro', 'Golden Retriever', 4);

-- Inserir Enfermidades
INSERT INTO Enfermidade (nome, descricao) VALUES
    ('Febre', 'Elevação da temperatura corporal'),
    ('Otite', 'Inflamação no ouvido'),
    ('Fratura', 'Quebra de um osso'),
    ('Dermatite', 'Inflamação na pele'),
    ('Gripe', 'Infecção respiratória');

-- Relacionar Animais com Enfermidades
INSERT INTO Animal_Enfermidade (animal_id, enfermidade_id) VALUES
    (1, 1), -- Fido com Febre
    (1, 3), -- Fido com Fratura
    (2, 1), -- Mittens com Febre
    (3, 2), -- Bolt com Otite
    (4, 4), -- Whiskers com Dermatite
    (5, 5); -- Luna com Gripe

-- Inserir Veterinários
INSERT INTO Veterinario (nome, especialidade) VALUES
    ('Dra. Silva', 'Cirurgia'),
    ('Dr. Costa', 'Clínica Geral'),
    ('Dra. Pereira', 'Dermatologia'),
    ('Dr. Santos', 'Ortopedia'),
    ('Dra. Lima', 'Cardiologia');

-- Inserir Atendimentos
INSERT INTO Atendimento (veterinario_id, animal_id, data_atendimento) VALUES
    (1, 1, '2024-01-23'),
    (2, 2, '2024-01-24'),
    (3, 3, '2024-01-25'),
    (4, 4, '2024-01-26'),
    (5, 5, '2024-01-27');
