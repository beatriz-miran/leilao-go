create database leilao;
use leilao;

-- COMPRADOR
CREATE TABLE Comprador (
    cmp_id INTEGER PRIMARY KEY,
    cmp_nome VARCHAR(100),
    cmp_cpf VARCHAR(14) UNIQUE,
    cmp_data_nascimento DATE,
    cmp_telefone_1 VARCHAR(15),
    cmp_telefone_2 VARCHAR(15),
    cmp_email VARCHAR(60) UNIQUE,
    cmp_rua VARCHAR(100),
    cmp_numero VARCHAR(10),
    cmp_cep VARCHAR(10),
    cmp_complemento VARCHAR(30),
    cmp_estado VARCHAR(2),
    cmp_cidade VARCHAR(50),
    cmp_senha VARCHAR(10),
    cmp_data_cadastro DATE
);

-- ESPECIALISTA
CREATE TABLE Especialista (
    esp_id INTEGER PRIMARY KEY,
    esp_nome VARCHAR(60),
    esp_cpf VARCHAR(14) UNIQUE,
    esp_data_nascimento DATE,
    esp_telefone_1 VARCHAR(15),
    esp_telefone_2 VARCHAR(15),
    esp_email VARCHAR(30) UNIQUE,
    esp_creci VARCHAR(10) UNIQUE,
    esp_rua VARCHAR(100),
    esp_numero INTEGER,
    esp_cep VARCHAR(10),
    esp_complemento VARCHAR(30),
    esp_estado VARCHAR(2),
    esp_cidade VARCHAR(50),
    esp_senha VARCHAR(100),
    esp_data_cadastro DATE
);

-- TIPO DE LEILOEIRO
CREATE TABLE tipo_leiloeiro (
    til_id INTEGER PRIMARY KEY,
    til_nome VARCHAR(30)
);

-- LEILOEIRO
CREATE TABLE Leiloeiro (
    lil_id INTEGER PRIMARY KEY,
    lil_nome VARCHAR(60),
    lil_cnpj VARCHAR(18) UNIQUE,
    lil_telefone_1 VARCHAR(15),
    lil_telefone_2 VARCHAR(15),
    lil_email VARCHAR(30) UNIQUE,
    lil_senha VARCHAR(10),
    lil_data_cadastro DATE,
    lil_cep VARCHAR(10),
    lil_estado VARCHAR(2),
    lil_cidade VARCHAR(50),
    lil_complemento VARCHAR(30),
    lil_rua VARCHAR(100),
    lil_numero INTEGER,
    til_id INTEGER,
    FOREIGN KEY (til_id) REFERENCES tipo_leiloeiro(til_id)
);

-- STATUS DO IMÓVEL
CREATE TABLE status_imovel (
    sti_id INTEGER PRIMARY KEY,
    sti_nome VARCHAR(20)
);

-- TIPO DE IMÓVEL
CREATE TABLE tipo_imovel (
    tpi_id INTEGER PRIMARY KEY,
    tpi_nome VARCHAR(20)
);

-- IMÓVEL
CREATE TABLE Imovel (
    imv_id INTEGER PRIMARY KEY,
    tpi_id INTEGER,
    imv_descricao VARCHAR(255),
    imv_valor_avaliado DECIMAL(10,2),
    imv_rua VARCHAR(100),
    imv_cidade VARCHAR(50),
    imv_estado VARCHAR(2),
    imv_cep VARCHAR(10),
    imv_numero INTEGER,
    imv_complemento VARCHAR(30),
    imv_areaTotal DECIMAL(10,2),
    imv_qtd_banheiro INTEGER,
    imv_vagas_garagem INTEGER,
    imv_qtd_quarto INTEGER,
    imv_img1 VARCHAR(100),
    imv_img2 VARCHAR(100),
    imv_data_cadastro DATE,
    sti_id INTEGER,
    lil_id INTEGER,
    FOREIGN KEY (tpi_id) REFERENCES tipo_imovel(tpi_id),
    FOREIGN KEY (sti_id) REFERENCES status_imovel(sti_id),
    FOREIGN KEY (lil_id) REFERENCES Leiloeiro(lil_id)
);

-- STATUS DO LEILÃO
CREATE TABLE status_leilao (
    stl_id INTEGER PRIMARY KEY,
    stl_nome VARCHAR(30)
);

-- TIPO DE LEILÃO
CREATE TABLE tipo_leilao (
    tpl_id INTEGER PRIMARY KEY,
    tpl_nome VARCHAR(30)
);

-- LEILÃO
CREATE TABLE Leilao (
    lei_id INTEGER PRIMARY KEY,
    lei_descricao VARCHAR(60),
    lei_valor_minimo DECIMAL(10,2),
    lei_data_inicio DATE,
    lei_data_fim DATE,
    lei_data_cadastro DATE,
    imv_id INTEGER,
    tpl_id INTEGER,
    stl_id INTEGER,
    FOREIGN KEY (imv_id) REFERENCES Imovel(imv_id),
    FOREIGN KEY (tpl_id) REFERENCES tipo_leilao(tpl_id),
    FOREIGN KEY (stl_id) REFERENCES status_leilao(stl_id)
);

-- LANCE
CREATE TABLE Lance (
    lnc_id INTEGER PRIMARY KEY,
    lnc_valor DECIMAL(10,2),
    lnc_data_hora DATETIME,
    lei_id INTEGER,
    cmp_id INTEGER,
    FOREIGN KEY (lei_id) REFERENCES Leilao(lei_id),
    FOREIGN KEY (cmp_id) REFERENCES Comprador(cmp_id)
);

-- NOTIFICAÇÃO
CREATE TABLE Notificacao (
    ntf_id INTEGER PRIMARY KEY,
    ntf_titulo VARCHAR(100),
    ntf_mensagem VARCHAR(255),
    ntf_data_hora_envio DATETIME
);

-- PRAZO DE PAGAMENTO
CREATE TABLE prazo_pagamento (
    prz_id INTEGER PRIMARY KEY,
    prz_prazo VARCHAR(10)
);

-- FORMA DE PAGAMENTO
CREATE TABLE forma_pagamento (
    fmp_id INTEGER PRIMARY KEY,
    fmp_nome VARCHAR(30)
);

-- TABELAS DE RELACIONAMENTO

CREATE TABLE Favorita (
    cmp_id INTEGER,
    lei_id INTEGER,
    PRIMARY KEY (cmp_id, lei_id),
    FOREIGN KEY (cmp_id) REFERENCES Comprador(cmp_id),
    FOREIGN KEY (lei_id) REFERENCES Leilao(lei_id)
);

CREATE TABLE visualiza (
    cmp_id INTEGER,
    lei_id INTEGER,
    PRIMARY KEY (cmp_id, lei_id),
    FOREIGN KEY (cmp_id) REFERENCES Comprador(cmp_id),
    FOREIGN KEY (lei_id) REFERENCES Leilao(lei_id)
);

CREATE TABLE recebe (
    cmp_id INTEGER,
    ntf_id INTEGER,
    PRIMARY KEY (cmp_id, ntf_id),
    FOREIGN KEY (cmp_id) REFERENCES Comprador(cmp_id),
    FOREIGN KEY (ntf_id) REFERENCES Notificacao(ntf_id)
);

CREATE TABLE contatar (
    esp_id INTEGER,
    cmp_id INTEGER,
    PRIMARY KEY (esp_id, cmp_id),
    FOREIGN KEY (esp_id) REFERENCES Especialista(esp_id),
    FOREIGN KEY (cmp_id) REFERENCES Comprador(cmp_id)
);

CREATE TABLE pagamento (
    imv_id INTEGER,
    prz_id INTEGER,
    fmp_id INTEGER,
    PRIMARY KEY (imv_id, prz_id, fmp_id),
    FOREIGN KEY (imv_id) REFERENCES Imovel(imv_id),
    FOREIGN KEY (prz_id) REFERENCES prazo_pagamento(prz_id),
    FOREIGN KEY (fmp_id) REFERENCES forma_pagamento(fmp_id)
);

drop database leilao;
