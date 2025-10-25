use leilao;

-- PROCEDURES

-- CADASTRAR COMPRADOR
DELIMITER $$
CREATE PROCEDURE cadastrarComprador(
    IN cnome VARCHAR(100),
    IN ccpf VARCHAR(14),
    IN cdata_nascimento DATE,
    IN ctelefone1 VARCHAR(15),
    IN ctelefone2 VARCHAR(15),
    IN cemail VARCHAR(60),
    IN csenha VARCHAR(10),
    IN crua VARCHAR(100),
    IN cnumero INT,
    IN ccep VARCHAR(10),
    IN ccomplemento VARCHAR(30),
    IN cestado VARCHAR(2),
    IN ccidade VARCHAR(50)
)
BEGIN
    INSERT INTO Comprador (
        cmp_nome, cmp_cpf, cmp_data_nascimento, cmp_telefone_1, cmp_telefone_2,
        cmp_email, cmp_senha, cmp_rua, cmp_numero, cmp_cep, cmp_complemento, cmp_estado, 
        cmp_cidade, cmp_data_cadastro
    ) VALUES (
        cnome, ccpf, cdata_nascimento, ctelefone1, ctelefone2,
        cemail, csenha, crua, cnumero, ccep, ccomplemento, cestado, ccidade, CURDATE()
    );
END$$
DELIMITER ;
CALL cadastrarComprador('Marina Souza','987.654.321-00', '2005-01-01','(11)98765-4321',     
    '(11)91234-5678','marinakk@email.com','senha123','Rua das Flores',100,'06000-000', 'Apto 101',          
    'SP','Osasco');
    
SELECT * FROM Comprador WHERE cmp_cpf = '987.654.321-00';

-- CADASTRAR LEILOEIRO

DELIMITER $$
CREATE PROCEDURE cadastrarLeiloeiro(
    IN lnome VARCHAR(60),
    IN lcnpj VARCHAR(18),
    IN ltelefone1 VARCHAR(15),
    IN ltelefone2 VARCHAR(15),
    IN lemail VARCHAR(30),
    IN lsenha VARCHAR(10),
    IN lcep VARCHAR(10),
    IN lestado VARCHAR(2),
    IN lcidade VARCHAR(50),
    IN lcomplemento VARCHAR(30),
    IN lrua VARCHAR(100),
    IN lnumero INT,
    IN ltipo TINYINT
)
BEGIN
    INSERT INTO Leiloeiro (
        lil_nome, lil_cnpj, lil_telefone_1, lil_telefone_2, lil_email,
        lil_senha, lil_data_cadastro, lil_cep, lil_estado, lil_cidade,
        lil_complemento, lil_rua, lil_numero, lil_tipo
    ) VALUES (
        lnome, lcnpj, ltelefone1, ltelefone2, lemail,
        lsenha, CURDATE(), lcep, lestado, lcidade,
        lcomplemento, lrua, lnumero, ltipo
    );
END$$
DELIMITER ;

CALL cadastrarLeiloeiro('Leilões Teste Ltda','12.345.690/0001-99','(11)90000-1111','(11)90000-2222',
'teste@leiloes.com','senha123','06000-001','SP','São Paulo','Sala 101','Av. Paulista',500,1
);

SELECT * FROM Leiloeiro
WHERE lil_cnpj = '12.345.690/0001-99';


-- CADASTRAR IMOVEL 

DELIMITER $$

CREATE PROCEDURE cadastrarImovel(
    IN tip_id INT,
    IN descricao VARCHAR(255),
    IN valor DECIMAL(10,2),
    IN rua VARCHAR(100),
    IN cidade VARCHAR(50),
    IN estado VARCHAR(2),
    IN cep VARCHAR(10),
    IN numero INT,
    IN complemento VARCHAR(30),
    IN area DECIMAL(10,2),
    IN qtd_banheiro INT,
    IN vagas_garagem INT,
    IN qtd_quarto INT,
    IN img1 VARCHAR(100),
    IN img2 VARCHAR(100),
    IN leiloeiro_id INT
)
BEGIN
    INSERT INTO Imovel (
        tpi_id, imv_descricao, imv_valor_avaliado, imv_rua, imv_cidade, imv_estado,
        imv_cep, imv_numero, imv_complemento, imv_areaTotal, imv_qtd_banheiro,
        imv_vagas_garagem, imv_qtd_quarto, imv_img1, imv_img2, imv_data_cadastro, imv_status, lil_id
    ) VALUES (
        tip_id, descricao, valor, rua, cidade, estado, cep, numero, complemento, area,
        qtd_banheiro, vagas_garagem, qtd_quarto, img1, img2, CURDATE(), 1, leiloeiro_id
    );
END$$
DELIMITER ;

CALL cadastrarImovel(2, 'Casa de teste com jardim',400000.00, 'Rua das Flores','São Paulo',
'SP','06000-000',123,'Apto 10',180.50, 2, 1,3,'casa_teste1.jpg','casa_teste2.jpg',1 
);
SELECT * FROM Imovel
WHERE imv_rua = 'Rua das Flores' AND imv_numero = 123;



