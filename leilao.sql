create database leilao;
use leilao;

/*USUÁRIOS*/

CREATE TABLE Cliente(
cli_id int auto_increment primary key,
cli_nome varchar(100),
cli_cep varchar(9),
cli_rua varchar(50),
cli_uf varchar(2),
cli_bairro varchar(50),
cli_cidade varchar(50),
cli_numero int,
cli_idade int,
cli_rg varchar(9),
cli_cpf varchar(11),
cli_telefone varchar(15),
cli_email varchar(50),
cli_senha varchar(10)
);

CREATE TABLE Especialista(
esp_id int auto_increment primary key,
esp_nome varchar(100),
esp_registro_profissional varchar(50),
esp_data_nascimento date,
esp_rg varchar(9),
esp_cpf varchar(11)
);

CREATE TABLE Leiloeiro(
lei_cnpj varchar(14) primary key,
lei_nome varchar(100),
lei_tipo_leiloeiro int
);

/*ENTIDADES*/

CREATE TABLE AnuncioFinanciamento(
anf_id int auto_increment primary key,
anf_titulo varchar(50),
anf_descricao text,
anf_empresa_id int,
anf_taxa_juros decimal(10,2),
anf_prazo_meses int,
anf_valor_minimo decimal(10,2),
anf_data_inicio date,
anf_data_fim date,
anf_link_simulador varchar(100)
);

CREATE TABLE Imovel(
imo_id int auto_increment primary key,
imo_tipo varchar(20),
imo_cep varchar(9),
imo_rua varchar(50),
imo_uf varchar(2),
imo_bairro varchar(50),
imo_cidade varchar(50),
imo_numero int,
imo_area_construida decimal(10,2),
imo_area_total decimal(10,2),
imo_qtd_quartos int,
imo_qtd_banheiros int,
imo_garagem boolean,
imo_ano_construcao int,
imo_descricao text,
imo_valor_avaliacao decimal(10,2),
imo_documentacaoOK boolean
);

CREATE TABLE MaterialApoio(
mta_id int primary key auto_increment,
mta_titulo varchar(60),
mta_descricao text,
mta_autor int,
mta_data_publicacao date,
mta_tipo varchar(30),
mta_url varchar(200)
);

/*DROPS PARA ALTERAÇÃO*/