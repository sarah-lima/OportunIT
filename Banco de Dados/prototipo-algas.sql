
-- Criação do protótipo do banco de dados para o projeto -- 
create database novoprototipo;

use novoprototipo;

-- Tabela sensor, contendo: --
-- seu número de identificação, data e hora do dia em que estão --
-- sendo monitorados para que armazenem os dados da temperatuda coletada. --
create table sensor(
idsensor int primary key,
data_monitoramento date,
hora_monitoramento time,
temperatura_coletada float);

select * from sensor;

-- Tabela balsa, contendo: --
-- número de identificação, tamanho da balsa para que calculemos --
-- a quantidade de sensores que serão necessários para a mesma, região de instalação das mesmas, --
-- quantidade de mudas que estão sendo utilizadas para plantio, contendo datas de inicio e término da colheita --
-- e sensor utilizado para cada balsa, para fácil localização do mesmo. --
create table balsa(
idbalsa int primary key,
numero int,
tamanho_balsa float,
regiao varchar (30),
qtde_mudas int,
dt_inicio date,
dt_fim date,
idsensor int,
		foreign key (idsensor) references sensor (idsensor));
        
select * from balsa;

-- Tabela usúario, contendo:
-- número de de identificação do usuário, juntamente com --
-- seu apelido de usuário, nome para cadastro, tipo de cargo exercido e, --
-- não menos importante, se está ativo dentro das competências da empresa, --
-- para que saibamos se a balsa identificada como id_balsa está sob seus cuidados. --
create table usuario (
iduser int primary key,
username varchar (20),
nome_user varchar(30),
tipo_user varchar(40),
dv_ativo bool,
idbalsa int,
	foreign key (idbalsa) references balsa(idbalsa));
    
select * from usuario;

-- Abaixo obtivemos a inserção dos dados de usários, balsas e sensores cadastrados em nossos sistemas --
insert into sensor values (1,'2007-01-25','00:10:00',23.2);

select * from sensor;

insert into sensor values (2,'2007-01-26','08:17:00',22.2),
(3,'2007-01-26','09:10:00',24.2),
(4,'2007-01-26','10:15:00',25.1),
(5,'2007-01-26','11:17:00',22.0),
(6,'2007-01-26','12:22:00',23.2),
(7,'2007-01-26','13:11:00',23.6),
(8,'2007-01-26','14:13:00',24.1),
(9,'2007-01-26','15:02:00',23.2),
(10,'2007-01-26','16:10:00',23.1),
(11,'2007-01-27','08:12:00',21.2),
(12,'2007-01-27','09:01:00',23.2),
(13,'2007-01-27','10:10:00',24.0),
(14,'2007-01-27','11:13:00',22.1),
(15,'2007-01-27','12:06:00',25.2),
(16,'2007-01-27','13:09:00',25.7),
(17,'2007-01-27','14:15:00',22.2),
(18,'2007-01-27','15:15:00',22.4),
(19,'2007-01-27','16:17:00',23.6),
(20,'2007-01-27','17:30:00',22.2),
(21,'2007-01-27','18:33:00',24.5),
(22,'2007-01-28','09:10:00',24.2),
(23,'2007-01-28','10:10:00',22.2),
(24,'2007-01-28','11:10:00',24.4),
(25,'2007-01-28','12:18:00',25.7),
(26,'2007-01-28','13:19:00',25.9),
(27,'2007-01-28','14:15:00',26.1),
(28,'2007-01-28','15:00:00',22.3),
(29,'2007-02-01','13:12:00',22.4),
(30,'2007-02-01','14:05:00',22.1),
(31,'2007-02-01','15:40:00',23.6),
(32,'2007-02-01','16:55:00',23.4),
(33,'2007-02-01','17:30:00',22.6),
(34,'2007-02-01','18:22:00',22.2),
(35,'2007-02-01','19:34:00',22.1),
(36,'2007-02-01','20:00:00',21.7);

select * from sensor;

insert into balsa values (1,13,207.1,'Boracéia',101,'2007-01-25','2007-02-25',25);

select * from balsa;

insert into balsa values (2,2,207.1,'Boracéia',111,'2007-01-25','2007-02-25',21),
(3,3,206.5,'Boracéia',105,'2007-01-26','2007-02-24',26),
(4,4,207.1,'Boracéia',105,'2007-01-26','2007-02-24',20),
(5,5,210.2,'Boracéia',104,'2007-01-26','2007-02-24','27'),
(6,6,302.3,'São Vicente',150,'2007-01-26','2007-02-25',28),
(7,7,305.4,'São Vicente',150,'2007-01-26','2007-02-25',7),
(8,8,304.7,'São Vicente',151,'2007-01-26','2007-02-25',9),
(9,9,300.1,'São Vicente',152,'2007-01-26','2007-02-25',2),
(10,10,240.4,'São Vicente',111,'2007-02-02','2007-02-18',3),
(11,11,233.9,'Praia Grande',100,'2007-02-02','2007-02-18',5),
(12,12,233.1,'Praia Grande',101,'2007-02-02','2007-02-18',7),
(13,13,209.2,'Praia Grande',111,'2007-02-02','2007-02-18',14),
(14,14,400.0,'Praia Grande',250,'2007-02-02','2007-02-18',18);

select * from balsa;


insert into usuario values (1,'ac3001','Antonio Silva Correia','operador','1',1),
(2,'as3002','Artur Pereira Silva','administrador','1',2),
(3,'sc3003','Sonia Carvalho','operador','1',2),
(4,'ms3004','Maria Aparecida de Sousa','administrador','0',8),
(5,'vc3005','Vanessa Camargo','operador','1',7),
(6,'pa3006','Pedro Roberto Almeida','operador','1',4),
(7,'pm3007','Pedro Camilo Mendonça','operador','1',6),
(8,'aj3008','Atalia de Jesus','operador','0',2),
(9,'ac3009','Arnizal Cardozo','administrador','1',3),
(10,'pm3010','Paula Maria','operador','1',3),
(11,'sb3011','Sergio Bezerra','administrador','1',1),
(12,'ja3012','João Aparecido ','operador','1',2),
(13,'om30013','Orlando Morando','operador','1',13),
(14,'cp30014','Camila Pitanga','operador','1',11),
(15,'db30015','Domingos Bonacceli','operador','0',2),
(16,'cs30016','Cristóvão Severo','operador','1',4),
(17,'ps30017','Pamela Severina','operador','1',8),
(18,'ee30018','Enio Espinola','operador','1',10),
(19,'hg30019','Hortencia Graça','administrador','1',11),
(20,'gy30020','Giovanni Yoshiro','administrador','1',3),
(21,'cj30021','Cleiton Jair','operador','1',5);

select * from usuario;
