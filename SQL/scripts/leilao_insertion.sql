USE leilao;
SHOW TABLES;

-- Comprador
DESC comprador;
INSERT INTO Comprador (cmp_nome,cmp_cpf,cmp_data_nascimento,cmp_telefone_1,cmp_telefone_2,
cmp_email,cmp_rua,cmp_numero,cmp_cep,cmp_complemento,cmp_estado,cmp_cidade,cmp_senha,cmp_data_cadastro
) VALUES
('Rafael Mendes', '111.222.333-44', '1991-04-15', '(11) 91234-0000', '(11) 99888-0000',
 'rafael.mendes@email.com', 'Rua das Acácias', 150, '06010-000', 'Apto 202', 'SP', 'São Paulo', 
 'rm2024', '2024-01-20'),

('Carla Fernandes', '555.666.777-88', '1987-12-08', '(21) 98877-1122', NULL, 
'carla.fernandes@email.com', 'Av. Copacabana', 320, '22000-000', NULL, 'RJ', 'Rio de Janeiro', 
'cf1987', '2024-02-15'),

('Vinícius Rocha', '999.888.777-66', '1995-09-21', '(31) 98765-1111', '(31) 97654-2222', 
'vinicius.rocha@email.com', 'Rua Ouro Preto', 480, '30100-000', 'Casa 1', 'MG', 'Belo Horizonte',
 'vr1995', '2024-03-12'),

('Juliana Lima', '123.987.456-32', '1993-06-30', '(41) 99999-1234', NULL, 
'juliana.lima@email.com', 'Rua Curitiba', 250, '80010-000', 'Bloco C', 'PR', 'Curitiba', 
'jl1993', '2024-04-05'),

('Eduardo Souza', '321.654.987-21', '1989-11-02', '(51) 97777-3333', '(51) 96666-4444', 
'eduardo.souza@email.com', 'Av. Independência', 75, '90010-000', NULL, 'RS', 'Porto Alegre', 
'es1989', '2024-05-18'),

('Marina Castro', '789.456.123-55', '1992-02-14', '(85) 98888-2222', NULL, 
'marina.castro@email.com', 'Av. Beira Rio', 600, '60010-000', 'Torre A', 'CE', 'Fortaleza', 
'mc1992', '2024-06-25');

SELECT * FROM comprador;

-- Leiloeiro
DESC leiloeiro;
INSERT INTO Leiloeiro (lil_nome,lil_cnpj, lil_telefone_1,lil_telefone_2,lil_email, lil_senha,
lil_data_cadastro,lil_cep,lil_estado,lil_cidade,lil_complemento,lil_rua,lil_numero,lil_tipo
) VALUES
('Leilões Alfa Ltda', '12.345.678/0001-90', '(11) 91234-5678', '(11) 99876-5432', 
'contato@leiloesalfa.com', 'senha123', '2024-01-15', '06000-000', 'SP', 'São Paulo', 
'Sala 301', 'Av. Paulista', 1000, 1),

('Banco Omega S.A.', '98.765.432/0001-55', '(21) 98888-1111', '(21) 97777-2222', 
'contato@bancoomega.com', 'bco2024', '2024-02-10', '20000-000', 'RJ', 'Rio de Janeiro', 
'Edifício Central', 'Rua das Laranjeiras', 250, 2),

('Leilões Brasil', '45.678.910/0001-23', '(31) 98765-4321', NULL,
 'suporte@leiloesbrasil.com', 'lb2024', '2024-03-05', '30000-000', 'MG', 'Belo Horizonte', 
 NULL, 'Av. Afonso Pena', 500, 1),

('Finanças Delta', '11.222.333/0001-44', '(41) 99999-8888', '(41) 98888-7777', 
'delta@financas.com', 'delta22', '2024-04-01', '80000-000', 'PR', 'Curitiba', 
'Bloco B', 'Rua XV de Novembro', 320, 2),

('Leilões do Sul', '55.666.777/0001-88', '(51) 97777-9999', NULL, 
'contato@leiloesdosul.com', 'souls22', '2024-05-20', '90000-000', 'RS', 'Porto Alegre', 
'Sala 10', 'Av. Borges de Medeiros', 45, 1),

('Banco Aurora', '22.333.444/0001-77', '(85) 98888-5555', '(85) 97777-4444', 
'contato@bancoaurora.com', 'aurora1', '2024-06-30', '60000-000', 'CE', 'Fortaleza',
 'Torre 2', 'Av. Beira Mar', 700, 2);
 
 SELECT * FROM Leiloeiro;

-- Tipo de Imóvel
DESC tipo_imovel;
INSERT INTO tipo_imovel (tpi_nome) VALUES
('Apartamento'),
('Casa'),
('Terreno'),
('Sala comercial');

SELECT * FROM tipo_imovel;

-- Imóvel
DESC imovel;
INSERT INTO Imovel (tpi_id,imv_descricao,imv_valor_avaliado,imv_rua,imv_cidade,imv_estado,imv_cep,
imv_numero,imv_complemento,imv_areaTotal,imv_qtd_banheiro,imv_vagas_garagem,imv_qtd_quarto,imv_img1,imv_img2,
imv_data_cadastro,imv_status,lil_id
) VALUES
(2, 'Casa ampla com jardim e piscina', 450000.00, 'Rua das Palmeiras', 'São Paulo', 'SP', '06000-001', 
120, 'Apto 1', 200.50, 3, 2, 4, 'leilao-go\SQL\imagens_imovel\casa_id_1.jpg', 
'leilao-go\SQL\imagens_imovel\casa_id_1_dentro.jpg', '2024-01-20', 1, 1),

(1, 'Apartamento moderno próximo ao centro', 350000.00, 'Av. Paulista', 'São Paulo', 'SP', '06000-002', 
801, 'Apto 801', 95.00, 2, 1, 3, 'leilao-go\SQL\imagens_imovel\apartamento_id_2.png', 
'leilao-go\SQL\imagens_imovel\apartamento_id_2_dentro.png', '2024-02-15', 1, 2),

(3, 'Terreno plano ideal para construção', 250000.00, 'Rua do Bosque', 'Curitiba', 'PR', '80010-003',
 45, NULL, 500.00, 0, 0, 0, 'leilao-go\SQL\imagens_imovel\terreno_id_3.jpg',
 NULL, '2024-03-10', 1, 3),

(4, 'Sala comercial em prédio novo', 600000.00, 'Av. Beira Mar', 'Fortaleza', 'CE', '60010-004', 
1200, 'Sala 1200', 120.00, 1, 2, 0, 'leilao-go\SQL\imagens_imovel\salaComercial_id_4.jfif', 
'leilao-go\SQL\imagens_imovel\salaComercial_id_4_dentro.jfif', '2024-04-05', 1, 4);

SELECT * FROM imovel;

-- Status do Leilão
DESC status_leilao;
INSERT INTO status_leilao (stl_nome) VALUES
('Agendado'),
('Em andamento'),
('Encerrado'),
('Cancelado'),
('Suspenso'),
('Sem lances válidos');
SELECT*FROM status_leilao;

-- Tipo de Leilão
DESC tipo_leilao;
INSERT INTO tipo_leilao (tpl_nome) VALUES
('Judicial'),
('Extrajudicial'),
('Particular');
SELECT*FROM tipo_leilao;

-- Leilão
DESC leilao;
INSERT INTO Leilao (lei_descricao,lei_valor_minimo,lei_data_inicio,lei_data_fim,lei_data_cadastro,
imv_id,tpl_id,stl_id) VALUES
('Leilão residencial em SP', 400000.00, '2024-05-01', '2024-05-10',
 '2024-04-20', 1, 1, 1),

('Apartamento moderno no centro', 300000.00, '2024-06-05', '2024-06-15',
 '2024-05-25', 2, 2, 2),

('Terreno para construção', 250000.00, '2024-07-01', '2024-07-10', 
'2024-06-20', 3, 3, 3),

('Sala comercial à beira-mar', 550000.00, '2024-08-01', '2024-08-10',
 '2024-07-15', 4, 1, 1);

 SELECT * FROM leilao;

-- Lance
DESC lance;
INSERT INTO Lance (lnc_valor,lnc_data_hora,lei_id,cmp_id) VALUES
-- Lances no Leilão 1 (Casa em SP)
(410000.00, '2024-05-02 10:30:00', 1, 1),
(420000.00, '2024-05-03 14:15:00', 1, 2),
(430000.00, '2024-05-04 09:45:00', 1, 3),

-- Lances no Leilão 2 (Apartamento no centro)
(310000.00, '2024-06-06 11:00:00', 2, 4),
(320000.00, '2024-06-07 16:30:00', 2, 5),
(330000.00, '2024-06-08 10:00:00', 2, 6),

-- Lances no Leilão 3 (Terreno para construção)
(255000.00, '2024-07-02 12:00:00', 3, 1),
(260000.00, '2024-07-03 15:30:00', 3, 2),
(265000.00, '2024-07-04 09:15:00', 3, 3),

-- Lances no Leilão 4 (Sala comercial)
(560000.00, '2024-08-02 13:00:00', 4, 4),
(570000.00, '2024-08-03 10:30:00', 4, 5),
(580000.00, '2024-08-04 14:45:00', 4, 6);

SELECT * FROM lance;

-- Prazo de Pagamento
DESC prazo_pagamento;
INSERT INTO prazo_pagamento (prz_prazo) VALUES
('12 meses'),
('24 meses'),
('30 meses'),
('À vista');
SELECT * FROM prazo_pagamento;

-- Forma de Pagamento
DESC forma_pagamento;
INSERT INTO forma_pagamento (fmp_nome) VALUES
('Boleto'),
('Pix'),
('Cartão de crédito'),
('Empréstimo');
SELECT * FROM forma_pagamento;

-- Pagamento
DESC pagamento;
INSERT INTO pagamento (imv_id, prz_id, fmp_id) VALUES
-- Casa
(1, 1, 1),

-- Apartamento
(2, 4, 2),

-- Terreno
(3, 3, 4),

-- Sala comercial
(4, 4, 2);

SELECT * FROM pagamento;

-- Favorita
DESC favorita;
INSERT INTO Favorita (cmp_id, lei_id) VALUES
-- Comprador 1 favoritou Leilão 1 e 2
(1, 1),
(1, 2),

-- Comprador 2 favoritou Leilão 2 e 3
(2, 2),
(2, 3),

-- Comprador 3 favoritou Leilão 1 e 4
(3, 1),
(3, 4),

-- Comprador 4 favoritou Leilão 3
(4, 3),

-- Comprador 5 favoritou Leilão 4
(5, 4),

-- Comprador 6 favoritou Leilão 2 e 4
(6, 2),
(6, 4);

SELECT * FROM favorita;

