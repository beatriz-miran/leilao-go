create database leilao;
use leilao;
SHOW TABLES;
-- Comprador
CREATE TABLE Comprador (
    cmp_id INT PRIMARY KEY AUTO_INCREMENT,
    cmp_nome VARCHAR(100),
    cmp_cpf VARCHAR(14) UNIQUE,
    cmp_data_nascimento DATE,
    cmp_telefone_1 VARCHAR(15),
    cmp_telefone_2 VARCHAR(15),
    cmp_email VARCHAR(60) UNIQUE,
    cmp_rua VARCHAR(100),
    cmp_numero INT,
    cmp_cep VARCHAR(10),
    cmp_complemento VARCHAR(30),
    cmp_estado VARCHAR(2),
    cmp_cidade VARCHAR(50),
    cmp_senha VARCHAR(10),
    cmp_data_cadastro DATE
);

-- Leiloeiro
CREATE TABLE Leiloeiro (
    lil_id INT PRIMARY KEY AUTO_INCREMENT,
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
    lil_numero INT,
    lil_tipo TINYINT DEFAULT 1
);

-- Tipo_Imovel
CREATE TABLE Tipo_Imovel (
    tpi_id INT PRIMARY KEY AUTO_INCREMENT,
    tpi_nome VARCHAR(20)
);

-- Imovel
CREATE TABLE Imovel (
    imv_id INT PRIMARY KEY AUTO_INCREMENT,
    tpi_id INT,
    imv_descricao VARCHAR(255),
    imv_valor_avaliado DECIMAL(10,2),
    imv_rua VARCHAR(100),
    imv_cidade VARCHAR(50),
    imv_estado VARCHAR(2),
    imv_cep VARCHAR(10),
    imv_numero INT,
    imv_complemento VARCHAR(30),
    imv_areaTotal DECIMAL(10,2),
    imv_qtd_banheiro INT,
    imv_vagas_garagem INT,
    imv_qtd_quarto INT,
    imv_img1 VARCHAR(100),
    imv_img2 VARCHAR(100),
    imv_data_cadastro DATE,
    imv_status TINYINT DEFAULT 1,
    lil_id INT,
    FOREIGN KEY (tpi_id) REFERENCES Tipo_Imovel(tpi_id),
    FOREIGN KEY (lil_id) REFERENCES Leiloeiro(lil_id)
);

-- Status_Leilao
CREATE TABLE Status_Leilao (
    stl_id INT PRIMARY KEY AUTO_INCREMENT,
    stl_nome VARCHAR(30)
);

-- Tipo_Leilao
CREATE TABLE Tipo_Leilao (
    tpl_id INT PRIMARY KEY AUTO_INCREMENT,
    tpl_nome VARCHAR(30)
);

-- Leilao
CREATE TABLE Leilao (
    lei_id INT PRIMARY KEY AUTO_INCREMENT,
    lei_descricao VARCHAR(60),
    lei_valor_minimo DECIMAL(10,2),
    lei_data_inicio DATE,
    lei_data_fim DATE,
    lei_data_cadastro DATE,
    imv_id INT,
    tpl_id INT,
    stl_id INT,
    FOREIGN KEY (imv_id) REFERENCES Imovel(imv_id),
    FOREIGN KEY (tpl_id) REFERENCES Tipo_Leilao(tpl_id),
    FOREIGN KEY (stl_id) REFERENCES Status_Leilao(stl_id)
);

-- Lance
CREATE TABLE Lance (
    lnc_id INT PRIMARY KEY AUTO_INCREMENT,
    lnc_valor DECIMAL(10,2),
    lnc_data_hora DATETIME,
    lei_id INT,
    cmp_id INT,
    FOREIGN KEY (lei_id) REFERENCES Leilao(lei_id),
    FOREIGN KEY (cmp_id) REFERENCES Comprador(cmp_id)
);

-- Prazo_Pagamento
CREATE TABLE Prazo_Pagamento (
    prz_id INT PRIMARY KEY AUTO_INCREMENT,
    prz_prazo VARCHAR(10)
);

-- Forma_Pagamento
CREATE TABLE Forma_Pagamento (
    fmp_id INT PRIMARY KEY AUTO_INCREMENT,
    fmp_nome VARCHAR(30)
);

-- Pagamento
CREATE TABLE Pagamento (
    imv_id INT,
    prz_id INT,
    fmp_id INT,
    PRIMARY KEY (imv_id, prz_id, fmp_id),
    FOREIGN KEY (imv_id) REFERENCES Imovel(imv_id),
    FOREIGN KEY (prz_id) REFERENCES Prazo_Pagamento(prz_id),
    FOREIGN KEY (fmp_id) REFERENCES Forma_Pagamento(fmp_id)
);

-- Favorita
CREATE TABLE Favorita (
    cmp_id INT,
    lei_id INT,
    PRIMARY KEY (cmp_id, lei_id),
    FOREIGN KEY (cmp_id) REFERENCES Comprador(cmp_id),
    FOREIGN KEY (lei_id) REFERENCES Leilao(lei_id)
);


