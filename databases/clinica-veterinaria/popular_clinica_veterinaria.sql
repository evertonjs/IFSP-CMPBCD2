USE clinicavet;

-- ==========================================================
-- POPULAÇÃO DE DADOS (INSERTs)
-- Observação: a ordem respeita as chaves estrangeiras.
-- ==========================================================

/* -------------------------
   Cliente
   ------------------------- */
INSERT INTO Cliente (nome, endereco, telefone) VALUES
('Ana Paula Ribeiro', 'Rua das Flores, 120 - Campinas/SP', '(19) 99999-1001'),
('Bruno Henrique Souza', 'Av. Brasil, 850 - Campinas/SP', '(19) 98888-2002'),
('Carla Menezes', 'Rua do Lago, 55 - Valinhos/SP', '(19) 97777-3003'),
('Diego Almeida', 'Rua Central, 10 - Sumaré/SP', '(19) 96666-4004'),
('Fernanda Lima', 'Av. Paulista, 1000 - São Paulo/SP', '(11) 95555-5005');

/* -------------------------
   Animal
   ------------------------- */
INSERT INTO Animal (nome, especie, raca, cliente_id) VALUES
('Luna',  'Gato', 'Siamês',         1),
('Thor',  'Cão',  'Labrador',       1),
('Mel',   'Cão',  'Shih Tzu',       2),
('Nina',  'Gato', 'SRD',            3),
('Bob',   'Cão',  'Vira-lata',      3),
('Kiara', 'Cão',  'Golden Retriever', 4),
('Paco',  'Ave',  'Calopsita',      4),
('Tico',  'Coelho', 'Mini Lop',     5);

/* -------------------------
   Veterinario
   ------------------------- */
INSERT INTO Veterinario (nome, especialidade) VALUES
('Dra. Mariana Silva', 'Clínica geral'),
('Dr. Rafael Santos',  'Cirurgia'),
('Dra. Juliana Costa', 'Dermatologia'),
('Dr. Pedro Nogueira', 'Animais exóticos');

/* -------------------------
   Enfermidade
   ------------------------- */
INSERT INTO Enfermidade (nome, descricao) VALUES
('Otite', 'Inflamação no ouvido; pode causar coceira e dor.'),
('Dermatite', 'Irritação/inflamação na pele; pode ter origem alérgica.'),
('Gastroenterite', 'Inflamação do trato gastrointestinal com vômito/diarreia.'),
('Verminoses', 'Infecção por vermes intestinais; exige vermifugação adequada.'),
('Conjuntivite', 'Inflamação ocular; pode ser infecciosa ou alérgica.'),
('Fratura', 'Quebra de osso, geralmente por trauma.');

/* -------------------------
   Animal_Enfermidade (N:N)
   ------------------------- */
INSERT INTO Animal_Enfermidade (animal_id, enfermidade_id) VALUES
(1, 5), -- Luna: Conjuntivite
(2, 4), -- Thor: Verminoses
(3, 2), -- Mel: Dermatite
(3, 1), -- Mel: Otite
(4, 3), -- Nina: Gastroenterite
(5, 4), -- Bob: Verminoses
(6, 6), -- Kiara: Fratura
(7, 3), -- Paco: Gastroenterite
(8, 2); -- Tico: Dermatite

/* -------------------------
   Atendimento
   ------------------------- */
INSERT INTO Atendimento (veterinario_id, animal_id, data_atendimento) VALUES
(1, 2, '2026-01-08'),
(1, 1, '2026-01-10'),
(3, 3, '2026-01-12'),
(2, 6, '2026-01-15'),
(1, 5, '2026-01-18'),
(4, 7, '2026-01-20'),
(1, 4, '2026-02-02'),
(3, 8, '2026-02-04'),
(2, 6, '2026-02-06'),
(1, 2, '2026-02-10'),
(4, 7, '2026-02-12'),
(3, 3, '2026-02-15');
