use oficinamecanica;

show tables;

select *  from sorting;

-- idClients, Pname, Lname, CPF, phone, address, vehicle, board
insert into clients(Pname, Lname, CPF, phone, address, vehicle, board)
	value('Diego','De Souza', '35286421355','11961969969','Professor claudemir gomes do vale,189','fox preto','DFG2536'),
		 ('André','Santos', '35286421315','11961962563','Ruados Apostolos,12','nissan versa','D3F2536');
         
-- selecionando a tabela para visualização
select * from clients;

-- descrição da tabela, mostrando suas colunas e suas variaveis
desc clients;

-- selecionando a coluna Pname para visualização
select Pname from clients;
-- selecionando a coluna CPF para visualização
select CPF from clients;

-- organizando a tabela pelo nome em ordem crescente
select * from clients order by Pname;

-- inserindo mais valores
insert into clients(Pname, Lname, CPF, phone, address, vehicle, board)
							value ('Diego','Barbosa', '45286421355','11961969825','Rua P, 134','gol gt branco','ACB2536'),
								  ('Diego','Antunes', '38186421355','11961969125','Av. Principal,23','paraty branco','FER2536'),
								  ('Samara','Vermilion', '25486421355','11961962251','Rua andre antunes','onix prata','DLI2314');
-- selecionando a tabela para visualização
select * from clients;

-- selecionando um atributo especifico para mostra a tabela conforme condição solicitada
select * from clients where Pname = 'Diego';

-- deletando uma linha especifica da tabela
delete from clients where idClients=8;

-- não deletei a tabela inteira usando o "drop tables" por que ela é usada como referencia foreign key em outras tabelas
alter table clients add email varchar(40);

-- mostrando a tabela com novo campo
select * from clients;

-- deletando uma coluna com uam determinada condição 
ALTER TABLE clients DROP COLUMN email;

-- mostrando a tabela com novo campo
select * from clients;
