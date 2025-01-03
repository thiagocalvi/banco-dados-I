-- 26-12-2024

use trabalho_02_bd;

-- Inserindo 15 usuários do sistema  
insert into USER (name, email, cpf, password) values
('Ana Silva', 'ana.silva@example.com', '302.913.750-30', 'senhaSegura123'),
('Carlos Oliveira', 'carlos.oliveira@example.com', '234.567.890-11', 'senha1234!'),
('Fernanda Costa', 'fernanda.costa@example.com', '345.678.901-22', 'minhaSenha@1'),
('João Souza', 'joao.souza@example.com', '456.789.012-33', 'joaoSenha$2024'),
('Mariana Almeida', 'mariana.almeida@example.com', '567.890.123-44', 'mariana@2024'),
('Beatriz Lima', 'beatriz.lima@example.com', '678.901.234-55', 'beatriz123#'),
('Eduardo Pereira', 'eduardo.pereira@example.com', '789.012.345-66', 'senhaEdu@123'),
('Gabriela Santos', 'gabriela.santos@example.com', '890.123.456-77', 'gabriela$2024'),
('Lucas Mendes', 'lucas.mendes@example.com', '901.234.567-88', 'lucasSenha@2024'),
('Ricardo Martins', 'ricardo.martins@example.com', '012.345.678-99', 'ricardo123*'),
('Isabela Rocha', 'isabela.rocha@example.com', '112.223.334-45', 'senhaIsa@123'),
('Thiago Carvalho', 'thiago.carvalho@example.com', '223.334.445-56', 'senhaThiago#2024'),
('Patrícia Borges', 'patricia.borges@example.com', '334.445.556-67', 'senhaPatricia$'),
('Renato Azevedo', 'renato.azevedo@example.com', '445.556.667-78', 'renatoSenha*123'),
('Juliana Mendes', 'juliana.mendes@example.com', '556.667.778-89', 'senhaJuliana#');


-- Inserindo 10 categorias de eventos
insert into CATEGORY (title, description) values
('Tecnologia', 'Eventos relacionados a inovações tecnológicas, programação e hackathons.'),
('Educação', 'Eventos focados em práticas pedagógicas, ensino e aprendizado.'),
('Cultura e Artes', 'Atividades voltadas para expressões artísticas e manifestações culturais.'),
('Sustentabilidade', 'Eventos sobre preservação ambiental e práticas sustentáveis.'),
('Astronomia e Ciências', 'Exploração do universo e outros temas científicos.'),
('Empreendedorismo', 'Palestras e workshops sobre negócios e desenvolvimento de empresas.'),
('Motivação e Liderança', 'Eventos para aprimorar habilidades pessoais e profissionais.'),
('Gastronomia', 'Cursos e oficinas sobre técnicas culinárias.'),
('Jogos e Entretenimento', 'Eventos voltados para diversão e interação por meio de jogos.'),
('Saúde e Bem-Estar', 'Atividades relacionadas a práticas saudáveis e esportivas.');


-- Inserindo 2 posições que os usuários podem assumir em eventos
insert into USER_ROLE (name) values
('Proprietário'),
('Colaborador');

-- Inserindo 7 eventos
insert into EVENT (title, description, n_subscribers, max_subscribers, location, code_form, acception_inscription) values
('Workshop de Programação', 'Aprenda técnicas avançadas de programação.', 15, 30, 'Centro de Convenções, Curitiba, PR', 'WORK123', true),
('Seminário de Sustentabilidade', 'Discussão sobre práticas de sustentabilidade.', 12, 50, 'Auditório Municipal, São Paulo, SP', 'SUST2024', true),
('Encontro de Astronomia', 'Explorando o cosmos e os mistérios do universo.', 15, 20, 'Planetário, Rio de Janeiro, RJ', 'ASTRO456', false),
('Feira de Tecnologia', 'Novidades no mundo da tecnologia e inovação.', 12, 100, 'Expo Center, Campinas, SP', 'TECH789', true),
('Congresso de Educação', 'Tendências na área de educação.', 8, 32, 'Teatro Central, Belo Horizonte, MG', 'EDUCA123', true),
('Hackathon Universitário', 'Desafios para estudantes de tecnologia.', 15, 15, 'Faculdade de Engenharia, Florianópolis, SC', 'HACK999', true),
('Palestra de Motivação', 'Inspiração para o desenvolvimento pessoal.', 20, 25, 'Centro Cultural, Recife, PE', 'MOTIVA567', false);

-- Inserindo as cateforias do eventos
insert into EVENT_CATEGORY (idCategory, idEvent) values
(1, 1), -- Tecnologia: Workshop de Programação
(4, 2), -- Sustentabilidade: Seminário de Sustentabilidade
(5, 3), -- Astronomia e Ciências: Encontro de Astronomia
(1, 4), -- Tecnologia: Feira de Tecnologia
(2, 5), -- Educação: Congresso de Educação
(1, 6), -- Tecnologia: Hackathon Universitário
(7, 7); -- Motivação e Liderança: Palestra de Motivação


-- Inserindo as seções para os 8 eventos anteriormento criados
insert into EVENT_SECTION (idEvent, date, section_number, start_time, end_time) values
-- Workshop de Programação
(1, '2024-01-15', 1, '09:00:00', '12:00:00'),
(1, '2024-01-15', 2, '14:00:00', '17:00:00'),

-- Seminário de Sustentabilidade
(2, '2024-02-10', 1, '08:30:00', '11:30:00'),
(2, '2024-02-10', 2, '13:00:00', '16:00:00'),

-- Encontro de Astronomia
(3, '2024-03-05', 1, '19:00:00', '21:30:00'),

-- Feira de Tecnologia
(4, '2024-04-20', 1, '10:00:00', '12:30:00'),
(4, '2024-04-20', 2, '14:00:00', '16:30:00'),
(4, '2024-04-21', 1, '10:00:00', '12:00:00'),

-- Congresso de Educação
(5, '2024-05-15', 1, '09:00:00', '12:00:00'),
(5, '2024-05-15', 2, '13:30:00', '17:00:00'),

-- Hackathon Universitário
(6, '2024-06-12', 1, '08:00:00', '20:00:00'),

-- Palestra de Motivação
(7, '2024-07-08', 1, '18:00:00', '20:00:00');


-- Inserindo as posições dos usuários nos eventos
insert into USER_EVENT_ROLE (idEvent, idPosition, idUser, date) values
-- Evento 1: Workshop de Programação
(1, 1, 1, '2024-01-10'), -- Ana Silva como Proprietária
(1, 2, 6, '2024-01-10'), -- Beatriz Lima como Colaboradora

-- Evento 2: Seminário de Sustentabilidade
(2, 1, 2, '2024-02-10'), -- Carlos Oliveira como Proprietário
(2, 2, 7, '2024-02-10'), -- Eduardo Pereira como Colaborador

-- Evento 3: Encontro de Astronomia
(3, 1, 3, '2024-03-05'), -- Fernanda Costa como Proprietária
(3, 2, 8, '2024-03-05'), -- Gabriela Santos como Colaboradora

-- Evento 4: Feira de Tecnologia
(4, 1, 4, '2024-04-20'), -- João Souza como Proprietário
(4, 2, 9, '2024-04-20'), -- Lucas Mendes como Colaborador
(4, 2, 10, '2024-04-20'), -- Ricardo Martins como Colaborador

-- Evento 5: Congresso de Educação
(5, 1, 5, '2024-05-15'), -- Mariana Almeida como Proprietária
(5, 2, 11, '2024-05-15'), -- Isabela Rocha como Colaboradora

-- Evento 6: Hackathon Universitário
(6, 1, 1, '2024-06-12'), -- Ana Silva como Proprietária
(6, 2, 12, '2024-06-12'), -- Thiago Carvalho como Colaborador

-- Evento 7: Palestra de Motivação
(7, 1, 2, '2024-07-08'); -- Carlos Oliveira como Proprietário

-- Inserindo inscrições nos eventos
insert into ENROLLMENT (idEvent, name, email, phone_number, cpf, gender, age, ticket, date, time) values
-- Inscrições para o Evento 1 (Workshop de Programação)
(1, 'Carlos Oliveira', 'carlos.oliveira@example.com', '44987654729', '234.567.890-11', 'M', 45, SHA2(CONCAT(1, '234.567.890-11'), 256), '2024-01-10', '16:58:00'), 
(1, 'Luiz Henrique', 'luiz.henrique@example.com', '11987654321', '115.384.040-52', 'M', 25, SHA2(CONCAT(1, '115.384.040-52'), 256), '2024-01-10', '14:35:00'),
(1, 'Clara Souza', 'clara.souza@example.com', '11987654322', '222.333.444-51', 'F', 30, SHA2(CONCAT(1, '222.333.444-51'), 256), '2024-01-10', '14:37:00'),
(1, 'Paulo Ricardo', 'paulo.ricardo@example.com', '11987654323', '514.872.280-07', 'M', 22, SHA2(CONCAT(1, '514.872.280-07'), 256), '2024-01-10', '14:40:00'),
(1, 'Juliana Mendes', 'juliana.mendes2@example.com', '11987654324', '908.792.710-00', 'F', 28, SHA2(CONCAT(1, '908.792.710-00'), 256), '2024-01-10', '14:42:00'),
(1, 'Renato Azevedo', 'renato.azevedo2@example.com', '11987654325', '118.203.290-70', 'M', 35, SHA2(CONCAT(1, '118.203.290-70'), 256), '2024-01-10', '14:45:00'),
(1, 'Carlos Silva', 'carlos.silva@example.com', '11987654326', '931.047.450-56', 'M', 27, SHA2(CONCAT(1, '931.047.450-56'), 256), '2024-01-10', '14:50:00'),
(1, 'Mariana Rocha', 'mariana.rocha@example.com', '11987654327', '416.328.900-38', 'F', 32, SHA2(CONCAT(1, '416.328.900-38'), 256), '2024-01-10', '14:52:00'),
(1, 'Gustavo Souza', 'gustavo.souza@example.com', '11987654328', '283.929.080-40', 'M', 26, SHA2(CONCAT(1, '283.929.080-40'), 256), '2024-01-10', '14:55:00'),
(1, 'Tatiane Costa', 'tatiane.costa@example.com', '11987654329', '352.778.130-71', 'F', 31, SHA2(CONCAT(1, '352.778.130-71'), 256), '2024-01-10', '14:58:00'),
(1, 'Felipe Almeida', 'felipe.almeida@example.com', '11987654330', '000.111.222-32', 'M', 29, SHA2(CONCAT(1, '000.111.222-32'), 256), '2024-01-10', '15:00:00'),
(1, 'Luciana Pereira', 'luciana.pereira@example.com', '11987654331', '111.222.333-43', 'F', 24, SHA2(CONCAT(1, '111.222.333-43'), 256), '2024-01-10', '15:05:00'),
(1, 'Ricardo Martins', 'ricardo.martins@example.com', '11987654332', '222.333.444-52', 'M', 33, SHA2(CONCAT(1, '222.333.444-52'), 256), '2024-01-10', '15:10:00'),
(1, 'Vanessa Silva', 'vanessa.silva@example.com', '11987654333', '333.444.555-67', 'F', 25, SHA2(CONCAT(1, '333.444.555-67'), 256), '2024-01-10', '15:15:00'),
(1, 'Eduardo Lima', 'eduardo.lima@example.com', '11987654334', '444.555.666-74', 'M', 36, SHA2(CONCAT(1, '444.555.666-74'), 256), '2024-01-10', '15:20:00'),
(1, 'Patrícia Costa', 'patricia.costa@example.com', '11987654335', '555.666.777-80', 'F', 29, SHA2(CONCAT(1, '555.666.777-80'), 256), '2024-01-10', '15:25:00'),


-- Inscrições para o Evento 2 (Seminário de Sustentabilidade)
(2, 'Amanda Silva', 'amanda.silva@example.com', '21987654321', '666.777.888-91', 'F', 27, SHA2(CONCAT(2, '666.777.888-91'), 256), '2024-02-05', '09:15:00'),
(2, 'Gabriel Costa', 'gabriel.costa@example.com', '21987654322', '177.888.999-00', 'M', 32, SHA2(CONCAT(2, '177.888.999-00'), 256), '2024-02-05', '09:17:00'),
(2, 'Fernanda Oliveira', 'fernanda.oliveira@example.com', '21987654323', '888.999.000-11', 'F', 29, SHA2(CONCAT(2, '888.999.000-11'), 256), '2024-02-05', '09:20:00'),
(2, 'Carlos Menezes', 'carlos.menezes@example.com', '21987654324', '999.000.111-22', 'M', 24, SHA2(CONCAT(2, '999.000.111-22'), 256), '2024-02-05', '09:22:00'),
(2, 'Beatriz Rocha', 'beatriz.rocha@example.com', '21987654325', '000.111.222-33', 'F', 35, SHA2(CONCAT(2, '000.111.222-33'), 256), '2024-02-05', '09:25:00'),
(2, 'Pedro Alves', 'pedro.alves@example.com', '21987654326', '111.222.333-44', 'M', 40, SHA2(CONCAT(2, '111.222.333-44'), 256), '2024-02-05', '09:30:00'),
(2, 'Larissa Santos', 'larissa.santos@example.com', '21987654327', '222.333.444-55', 'F', 31, SHA2(CONCAT(2, '222.333.444-55'), 256), '2024-02-05', '09:35:00'),
(2, 'Renato Lima', 'renato.lima@example.com', '21987654328', '333.444.555-66', 'M', 28, SHA2(CONCAT(2, '333.444.555-66'), 256), '2024-02-05', '09:40:00'),
(2, 'Juliana Pereira', 'juliana.pereira@example.com', '21987654329', '444.555.666-77', 'F', 26, SHA2(CONCAT(2, '444.555.666-77'), 256), '2024-02-05', '09:45:00'),
(2, 'Douglas Alves', 'douglas.alves@example.com', '21987654330', '555.666.777-88', 'M', 33, SHA2(CONCAT(2, '555.666.777-88'), 256), '2024-02-05', '09:50:00'),
(2, 'Carla Almeida', 'carla.almeida@example.com', '21987654331', '666.777.888-99', 'F', 25, SHA2(CONCAT(2, '666.777.888-99'), 256), '2024-02-05', '09:55:00'),
(2, 'Lucas Souza', 'lucas.souza@example.com', '21987654332', '777.888.999-00', 'M', 38, SHA2(CONCAT(2, '777.888.999-00'), 256), '2024-02-05', '10:00:00'),

-- Inscrições para o Evento 3 (Encontro de Astronomia)
(3, 'Juliana Santos', 'juliana.santos@example.com', '21987654301', '123.456.789-11', 'F', 28, SHA2(CONCAT(3, '123.456.789-11'), 256), '2024-01-12', '14:30:00'),
(3, 'Carlos Pereira', 'carlos.pereira@example.com', '21987654302', '234.567.890-22', 'M', 35, SHA2(CONCAT(3, '234.567.890-22'), 256), '2024-01-12', '14:35:00'),
(3, 'Mariana Lima', 'mariana.lima@example.com', '21987654303', '345.678.901-33', 'F', 26, SHA2(CONCAT(3, '345.678.901-33'), 256), '2024-01-12', '14:40:00'),
(3, 'Felipe Souza', 'felipe.souza@example.com', '21987654304', '456.789.012-42', 'M', 30, SHA2(CONCAT(3, '456.789.012-42'), 256), '2024-01-12', '14:45:00'),
(3, 'Amanda Costa', 'amanda.costa@example.com', '21987654305', '567.890.123-51', 'F', 33, SHA2(CONCAT(3, '567.890.123-51'), 256), '2024-01-12', '14:50:00'),
(3, 'Rodrigo Alves', 'rodrigo.alves@example.com', '21987654306', '678.901.234-65', 'M', 40, SHA2(CONCAT(3, '678.901.234-65'), 256), '2024-01-12', '14:55:00'),
(3, 'Isabela Rocha', 'isabela.rocha@example.com', '21987654307', '789.012.345-76', 'F', 29, SHA2(CONCAT(3, '789.012.345-76'), 256), '2024-01-12', '15:00:00'),
(3, 'Lucas Martins', 'lucas.martins@example.com', '21987654308', '890.123.456-87', 'M', 38, SHA2(CONCAT(3, '890.123.456-87'), 256), '2024-01-12', '15:05:00'),
(3, 'Tais Oliveira', 'tais.oliveira@example.com', '21987654309', '901.234.567-98', 'F', 25, SHA2(CONCAT(3, '901.234.567-98'), 256), '2024-01-12', '15:10:00'),
(3, 'Gustavo Rodrigues', 'gustavo.rodrigues@example.com', '21987654310', '012.345.678-09', 'M', 32, SHA2(CONCAT(3, '012.345.678-09'), 256), '2024-01-12', '15:15:00'),
(3, 'Patricia Souza', 'patricia.souza@example.com', '21987654311', '123.456.789-10', 'F', 27, SHA2(CONCAT(3, '123.456.789-10'), 256), '2024-01-12', '15:20:00'),
(3, 'Eduardo Pereira', 'eduardo.pereira@example.com', '21987654312', '234.567.890-21', 'M', 34, SHA2(CONCAT(3, '234.567.890-21'), 256), '2024-01-12', '15:25:00'),
(3, 'Sofia Almeida', 'sofia.almeida@example.com', '21987654313', '345.678.901-32', 'F', 28, SHA2(CONCAT(3, '345.678.901-32'), 256), '2024-01-12', '15:30:00'),
(3, 'Thiago Costa', 'thiago.costa@example.com', '21987654314', '456.789.012-43', 'M', 41, SHA2(CONCAT(3, '456.789.012-43'), 256), '2024-01-12', '15:35:00'),
(3, 'Renata Lima', 'renata.lima@example.com', '21987654315', '567.890.123-54', 'F', 36, SHA2(CONCAT(3, '567.890.123-54'), 256), '2024-01-12', '15:40:00'),

-- Inscrições para o Evento 4 (Feira de Tecnologia)
(4, 'Ana Clara', 'ana.clara@example.com', '19987654321', '111.222.333-10', 'F', 26, SHA2(CONCAT(4, '111.222.333-10'), 256), '2024-01-15', '09:00:00'),
(4, 'Bruno Oliveira', 'bruno.oliveira@example.com', '19987654322', '222.333.444-21', 'M', 30, SHA2(CONCAT(4, '222.333.444-21'), 256), '2024-01-15', '09:05:00'),
(4, 'Carla Santos', 'carla.santos@example.com', '19987654323', '333.444.555-33', 'F', 25, SHA2(CONCAT(4, '333.444.555-33'), 256), '2024-01-15', '09:10:00'),
(4, 'Diego Costa', 'diego.costa@example.com', '19987654324', '444.555.666-44', 'M', 28, SHA2(CONCAT(4, '444.555.666-44'), 256), '2024-01-15', '09:15:00'),
(4, 'Elaine Rocha', 'elaine.rocha@example.com', '19987654325', '555.666.777-55', 'F', 33, SHA2(CONCAT(4, '555.666.777-55'), 256), '2024-01-15', '09:20:00'),
(4, 'Fernando Almeida', 'fernando.almeida@example.com', '19987654326', '666.777.888-66', 'M', 40, SHA2(CONCAT(4, '666.777.888-66'), 256), '2024-01-15', '09:25:00'),
(4, 'Gabriela Lima', 'gabriela.lima@example.com', '19987654327', '777.888.999-77', 'F', 22, SHA2(CONCAT(4, '777.888.999-77'), 256), '2024-01-15', '09:30:00'),
(4, 'Hugo Martins', 'hugo.martins@example.com', '19987654328', '888.999.000-88', 'M', 35, SHA2(CONCAT(4, '888.999.000-88'), 256), '2024-01-15', '09:35:00'),
(4, 'Isis Costa', 'isis.costa@example.com', '19987654329', '999.000.111-99', 'F', 29, SHA2(CONCAT(4, '999.000.111-99'), 256), '2024-01-15', '09:40:00'),
(4, 'Jorge Souza', 'jorge.souza@example.com', '19987654330', '000.111.222-00', 'M', 31, SHA2(CONCAT(4, '000.111.222-00'), 256), '2024-01-15', '09:45:00'),
(4, 'Karine Almeida', 'karine.almeida@example.com', '19987654331', '111.222.333-11', 'F', 24, SHA2(CONCAT(4, '111.222.333-11'), 256), '2024-01-15', '09:50:00'),
(4, 'Lucas Silva', 'lucas.silva@example.com', '19987654332', '222.333.444-22', 'M', 38, SHA2(CONCAT(4, '222.333.444-22'), 256), '2024-01-15', '09:55:00'),

-- Inscrições para o Evento 5 (Congresso de Educação)
(5, 'Amanda Silva', 'amanda.silva@example.com', '31987654321', '123.456.789-01', 'F', 29, SHA2(CONCAT(5, '123.456.789-01'), 256), '2024-01-20', '08:30:00'),
(5, 'Bruno Pereira', 'bruno.pereira@example.com', '31987654322', '178.445.660-86', 'M', 35, SHA2(CONCAT(5, '178.445.660-86'), 256), '2024-01-20', '08:35:00'),
(5, 'Carolina Oliveira', 'carolina.oliveira@example.com', '31987654323', '005.248.670-20', 'F', 27, SHA2(CONCAT(5, '005.248.670-20'), 256), '2024-01-20', '08:40:00'),
(5, 'Daniel Souza', 'daniel.souza@example.com', '31987654324', '893.587.470-13', 'M', 40, SHA2(CONCAT(5, '893.587.470-13'), 256), '2024-01-20', '08:45:00'),
(5, 'Elaine Costa', 'elaine.costa@example.com', '31987654325', '523.456.789-41', 'F', 33, SHA2(CONCAT(5, '523.456.789-41'), 256), '2024-01-20', '08:50:00'),
(5, 'Felipe Rodrigues', 'felipe.rodrigues@example.com', '31987654326', '623.456.789-52', 'M', 31, SHA2(CONCAT(5, '623.456.789-52'), 256), '2024-01-20', '08:55:00'),
(5, 'Gabriela Lima', 'gabriela.lima@example.com', '31987654327', '223.456.789-66', 'F', 25, SHA2(CONCAT(5, '223.456.789-66'), 256), '2024-01-20', '09:00:00'),
(5, 'Henrique Martins', 'henrique.martins@example.com', '31987654328', '823.456.739-77', 'M', 28, SHA2(CONCAT(5, '823.456.739-77'), 256), '2024-01-20', '09:05:00'),

-- Inscrições para o Evento 6 (Hackathon Universitário)
(6, 'Lucas Almeida', 'lucas.almeida@example.com', '48987654321', '923.456.789-81', 'M', 22, SHA2(CONCAT(6, '923.456.789-81'), 256), '2024-01-25', '10:00:00'),
(6, 'Juliana Pereira', 'juliana.pereira@example.com', '48987654322', '023.456.789-91', 'F', 21, SHA2(CONCAT(6, '023.456.789-91'), 256), '2024-01-25', '10:05:00'),
(6, 'Marcos Silva', 'marcos.silva@example.com', '48987654323', '123.426.789-01', 'M', 23, SHA2(CONCAT(6, '123.426.789-01'), 256), '2024-01-25', '10:10:00'),
(6, 'Fernanda Costa', 'fernanda.costa@example.com', '48987654324', '223.456.789-12', 'F', 24, SHA2(CONCAT(6, '223.456.789-12'), 256), '2024-01-25', '10:15:00'),
(6, 'Rafael Souza', 'rafael.souza@example.com', '48987654325', '323.456.789-21', 'M', 25, SHA2(CONCAT(6, '323.456.789-21'), 256), '2024-01-25', '10:20:00'),
(6, 'Camila Almeida', 'camila.almeida@example.com', '48987654326', '423.456.789-23', 'F', 20, SHA2(CONCAT(6, '423.456.789-23'), 256), '2024-01-25', '10:25:00'),
(6, 'Thiago Rodrigues', 'thiago.rodrigues@example.com', '48987654327', '523.456.789-49', 'M', 26, SHA2(CONCAT(6, '523.456.789-49'), 256), '2024-01-25', '10:30:00'),
(6, 'Gabriela Martins', 'gabriela.martins@example.com', '48987654328', '623.456.789-53', 'F', 22, SHA2(CONCAT(6, '623.456.789-53'), 256), '2024-01-25', '10:35:00'),
(6, 'Eduardo Lima', 'eduardo.lima@example.com', '48987654329', '627.863.140-70', 'M', 23, SHA2(CONCAT(6, '627.863.140-70'), 256), '2024-01-25', '10:40:00'),
(6, 'Isabela Costa', 'isabela.costa@example.com', '48987654330', '081.468.560-98', 'F', 21, SHA2(CONCAT(6, '081.468.560-98'), 256), '2024-01-25', '10:45:00'),
(6, 'Carlos Pereira', 'carlos.pereira@example.com', '48987654331', '922.456.789-81', 'M', 25, SHA2(CONCAT(6, '922.456.789-81'), 256), '2024-01-25', '10:50:00'),
(6, 'Amanda Martins', 'amanda.martins@example.com', '48987654332', '332.823.730-58', 'F', 24, SHA2(CONCAT(6, '332.823.730-58'), 256), '2024-01-25', '10:55:00'),
(6, 'João Silva', 'joao.silva@example.com', '48987654333', '123.456.729-00', 'M', 22, SHA2(CONCAT(6, '123.456.729-00'), 256), '2024-01-25', '11:00:00'),
(6, 'Luciana Rocha', 'luciana.rocha@example.com', '48987654334', '342.533.990-70', 'F', 25, SHA2(CONCAT(6, '342.533.990-70'), 256), '2024-01-25', '11:05:00'),
(6, 'Ricardo Santos', 'ricardo.santos@example.com', '48987654335', '519.369.890-50', 'M', 26, SHA2(CONCAT(6, '519.369.890-50'), 256), '2024-01-25', '11:10:00'),

-- Inscrições para o Evento 7 (Palestra de Motivação)
(7, 'André Souza', 'andre.souza@example.com', '81987654321', '729.014.020-62', 'M', 30, SHA2(CONCAT(7, '729.014.020-62'), 256), '2024-02-01', '09:00:00'),
(7, 'Ana Oliveira', 'ana.oliveira@example.com', '81987654322', '081.959.730-94', 'F', 28, SHA2(CONCAT(7, '081.959.730-94'), 256), '2024-02-01', '09:05:00'),
(7, 'Carlos Pereira', 'carlos.pereira@example.com', '81987654323', '557.102.400-36', 'M', 32, SHA2(CONCAT(7, '557.102.400-36'), 256), '2024-02-01', '09:10:00'),
(7, 'Fernanda Santos', 'fernanda.santos@example.com', '81987654324', '785.605.630-40', 'F', 29, SHA2(CONCAT(7, '785.605.630-40'), 256), '2024-02-01', '09:15:00'),
(7, 'Gustavo Costa', 'gustavo.costa@example.com', '81987654325', '885.961.050-85', 'M', 35, SHA2(CONCAT(7, '885.961.050-85'), 256), '2024-02-01', '09:20:00'),
(7, 'Mariana Almeida', 'mariana.almeida@example.com', '81987654326', '527.027.660-72', 'F', 26, SHA2(CONCAT(7, '527.027.660-72'), 256), '2024-02-01', '09:25:00'),
(7, 'Ricardo Lima', 'ricardo.lima@example.com', '81987654327', '018.770.520-86', 'M', 33, SHA2(CONCAT(7, '018.770.520-86'), 256), '2024-02-01', '09:30:00'),
(7, 'Larissa Martins', 'larissa.martins@example.com', '81987654328', '823.456.789-77', 'F', 27, SHA2(CONCAT(7, '823.456.789-77'), 256), '2024-02-01', '09:35:00'),
(7, 'Lucas Almeida', 'lucas.almeida@example.com', '81987654329', '923.456.789-88', 'M', 31, SHA2(CONCAT(7, '923.456.789-88'), 256), '2024-02-01', '09:40:00'),
(7, 'Juliana Costa', 'juliana.costa@example.com', '81987654330', '023.456.789-99', 'F', 25, SHA2(CONCAT(7, '023.456.789-99'), 256), '2024-02-01', '09:45:00'),
(7, 'Roberto Silva', 'roberto.silva@example.com', '81987654331', '123.456.789-00', 'M', 34, SHA2(CONCAT(7, '123.456.789-00'), 256), '2024-02-01', '09:50:00'),
(7, 'Daniela Rocha', 'daniela.rocha@example.com', '81987654332', '223.456.789-11', 'F', 30, SHA2(CONCAT(7, '223.456.789-11'), 256), '2024-02-01', '09:55:00'),
(7, 'Jéssica Ferreira', 'jessica.ferreira@example.com', '81987654333', '323.456.789-22', 'F', 29, SHA2(CONCAT(7, '323.456.789-22'), 256), '2024-02-01', '10:00:00'),
(7, 'Paulo Souza', 'paulo.souza@example.com', '81987654334', '423.456.789-33', 'M', 28, SHA2(CONCAT(7, '423.456.789-33'), 256), '2024-02-01', '10:05:00'),
(7, 'Vanessa Lima', 'vanessa.lima@example.com', '81987654335', '523.456.789-44', 'F', 27, SHA2(CONCAT(7, '523.456.789-44'), 256), '2024-02-01', '10:10:00'),
(7, 'Eduardo Costa', 'eduardo.costa@example.com', '81987654336', '623.456.789-55', 'M', 26, SHA2(CONCAT(7, '623.456.789-55'), 256), '2024-02-01', '10:15:00'),
(7, 'Tatiane Pereira', 'tatiane.pereira@example.com', '81987654337', '723.456.789-66', 'F', 25, SHA2(CONCAT(7, '723.456.789-66'), 256), '2024-02-01', '10:20:00');

-- Inserindo a presença dos participantes
insert into PRESENCE (enrollment_event_id, enrollment_cpf, idEvent, date, section_number, idUser) values
(1, '115.384.040-52', 1, '2024-01-15', 1, 1),
(1, '514.872.280-07', 1, '2024-01-15', 1, 1), 
(1, '118.203.290-70', 1, '2024-01-15', 1, 6), 
(1, '416.328.900-38', 1, '2024-01-15', 1, 6), 
(1, '283.929.080-40', 1, '2024-01-15', 1, 6), 
(1, '352.778.130-71', 1, '2024-01-15', 1, 6), 
(1, '000.111.222-32', 1, '2024-01-15', 1, 6), 
(1, '111.222.333-43', 1, '2024-01-15', 2, 1), 
(1, '222.333.444-52', 1, '2024-01-15', 2, 1), 
(1, '416.328.900-38', 1, '2024-01-15', 2, 1), 
(1, '115.384.040-52', 1, '2024-01-15', 2, 1),

(2, '666.777.888-91', 2, '2024-02-10', 1, 7),
(2, '177.888.999-00', 2, '2024-02-10', 1, 7),
(2, '888.999.000-11', 2, '2024-02-10', 1, 7),
(2, '999.000.111-22', 2, '2024-02-10', 1, 7),
(2, '000.111.222-33', 2, '2024-02-10', 1, 7),
(2, '111.222.333-44', 2, '2024-02-10', 1, 7),
(2, '222.333.444-55', 2, '2024-02-10', 1, 2),
(2, '333.444.555-66', 2, '2024-02-10', 1, 2),
(2, '444.555.666-77', 2, '2024-02-10', 1, 2),
(2, '555.666.777-88', 2, '2024-02-10', 1, 2),
(2, '666.777.888-99', 2, '2024-02-10', 1, 2),
(2, '777.888.999-00', 2, '2024-02-10', 1, 7),
(2, '666.777.888-91', 2, '2024-02-10', 2, 7),
(2, '177.888.999-00', 2, '2024-02-10', 2, 7),
(2, '444.555.666-77', 2, '2024-02-10', 2, 2),
(2, '555.666.777-88', 2, '2024-02-10', 2, 2),
(2, '666.777.888-99', 2, '2024-02-10', 2, 7),
(2, '777.888.999-00', 2, '2024-02-10', 2, 2),

(3, '123.456.789-11', 3, '2024-03-05', 1, 3),
(3, '234.567.890-22', 3, '2024-03-05', 1, 3),
(3, '345.678.901-33', 3, '2024-03-05', 1, 3),
(3, '456.789.012-42', 3, '2024-03-05', 1, 3),
(3, '567.890.123-51', 3, '2024-03-05', 1, 3),
(3, '678.901.234-65', 3, '2024-03-05', 1, 8),
(3, '789.012.345-76', 3, '2024-03-05', 1, 8),
(3, '890.123.456-87', 3, '2024-03-05', 1, 8),
(3, '901.234.567-98', 3, '2024-03-05', 1, 3),
(3, '012.345.678-09', 3, '2024-03-05', 1, 3),
(3, '123.456.789-10', 3, '2024-03-05', 1, 8),
(3, '234.567.890-21', 3, '2024-03-05', 1, 8),
(3, '345.678.901-32', 3, '2024-03-05', 1, 8),
(3, '456.789.012-43', 3, '2024-03-05', 1, 8),
(3, '567.890.123-54', 3, '2024-03-05', 1, 3),

(4, '111.222.333-10', 4, '2024-04-20', 1, 10),
(4, '222.333.444-21', 4, '2024-04-20', 1, 10),
(4, '333.444.555-33', 4, '2024-04-20', 1, 4),
(4, '444.555.666-44', 4, '2024-04-20', 1, 4),
(4, '555.666.777-55', 4, '2024-04-20', 1, 10),
(4, '666.777.888-66', 4, '2024-04-20', 1, 10),
(4, '777.888.999-77', 4, '2024-04-20', 1, 4),
(4, '888.999.000-88', 4, '2024-04-20', 1, 9),
(4, '999.000.111-99', 4, '2024-04-20', 1, 9),
(4, '000.111.222-00', 4, '2024-04-20', 1, 4),
(4, '111.222.333-11', 4, '2024-04-20', 1, 9),
(4, '111.222.333-10', 4, '2024-04-20', 2, 10),
(4, '222.333.444-21', 4, '2024-04-20', 2, 9),
(4, '444.555.666-44', 4, '2024-04-20', 2, 4),
(4, '555.666.777-55', 4, '2024-04-20', 2, 4),
(4, '777.888.999-77', 4, '2024-04-20', 2, 9),
(4, '888.999.000-88', 4, '2024-04-20', 2, 9),
(4, '999.000.111-99', 4, '2024-04-20', 2, 4),
(4, '111.222.333-11', 4, '2024-04-20', 2, 4),
(4, '222.333.444-22', 4, '2024-04-20', 2, 9),

(5, '123.456.789-01', 5, '2024-05-15', 1, 11),
(5, '178.445.660-86', 5, '2024-05-15', 1, 11),
(5, '005.248.670-20', 5, '2024-05-15', 1, 5),
(5, '223.456.789-66', 5, '2024-05-15', 1, 5),
(5, '823.456.739-77', 5, '2024-05-15', 1, 5),
(5, '893.587.470-13', 5, '2024-05-15', 2, 5),
(5, '523.456.789-41', 5, '2024-05-15', 2, 11),
(5, '623.456.789-52', 5, '2024-05-15', 2, 5),
(5, '223.456.789-66', 5, '2024-05-15', 2, 5),
(5, '823.456.739-77', 5, '2024-05-15', 2, 5),

(6, '923.456.789-81', 6, '2024-06-12', 1, 12),
(6, '023.456.789-91', 6, '2024-06-12', 1, 12),
(6, '123.426.789-01', 6, '2024-06-12', 1, 12),
(6, '223.456.789-12', 6, '2024-06-12', 1, 1),
(6, '323.456.789-21', 6, '2024-06-12', 1, 12),
(6, '423.456.789-23', 6, '2024-06-12', 1, 1),
(6, '523.456.789-49', 6, '2024-06-12', 1, 12),
(6, '623.456.789-53', 6, '2024-06-12', 1, 12),
(6, '627.863.140-70', 6, '2024-06-12', 1, 12),
(6, '081.468.560-98', 6, '2024-06-12', 1, 12),
(6, '922.456.789-81', 6, '2024-06-12', 1, 1),
(6, '332.823.730-58', 6, '2024-06-12', 1, 1),
(6, '123.456.729-00', 6, '2024-06-12', 1, 1),
(6, '342.533.990-70', 6, '2024-06-12', 1, 12),
(6, '519.369.890-50', 6, '2024-06-12', 1, 1),

(7, '729.014.020-62', 7, '2024-07-08', 1, 2),
(7, '081.959.730-94', 7, '2024-07-08', 1, 2),
(7, '785.605.630-40', 7, '2024-07-08', 1, 2),
(7, '885.961.050-85', 7, '2024-07-08', 1, 2),
(7, '527.027.660-72', 7, '2024-07-08', 1, 2),
(7, '923.456.789-88', 7, '2024-07-08', 1, 2),
(7, '023.456.789-99', 7, '2024-07-08', 1, 2),
(7, '123.456.789-00', 7, '2024-07-08', 1, 2),
(7, '223.456.789-11', 7, '2024-07-08', 1, 2),
(7, '323.456.789-22', 7, '2024-07-08', 1, 2),
(7, '423.456.789-33', 7, '2024-07-08', 1, 2),
(7, '723.456.789-66', 7, '2024-07-08', 1, 2);
