-- criação de banco de dados de uma oficina mecânica para desafio do bootcamp Database experience da DIO 
create database oficinamecanica;

use oficinamecanica;

-- criando tabela de clientes(clients)
create table if not exists clients(
	idClients int auto_increment primary key,
    Pname varchar(45) not null,
    Lname varchar(30) not null,
    CPF char(11) not null,
    phone char(13) not null,
    address varchar(60),
    vehicle varchar(20) not null,
    board char(7),
    constraint unique_cpf unique(CPF)
);
alter table clients auto_increment=1;

-- criando tabela de triagem
create table sorting(
	idSorting int auto_increment primary key,
    kindOfService enum('Revisão','Manutenção') not null default 'Manutenção',
    servicedesignation boolean not null
);
alter table sorting auto_increment=1;

-- criando tabela de mecânicos
create table mecanic(
	idMecanic int auto_increment primary key,
    sector enum('Balanceamento','Motores','Revisão','Funilaria','Pintura') not null,
    specialty varchar(30) not null,
    cod char(11) not null,
    nameMec varchar(45) not null,
    address varchar(45),
    phone char(13),
    constraint unique_cod unique(cod)
);
alter table mecanic auto_increment=1;

-- criação de tabela de ordem de serviço
create table serviceOrder(
	idServiceOrder int auto_increment primary key,
    issueDate datetime not null,
    pieceValue float not null,
    valueOfLabor float not null,
    statusService enum('Finalizado','Em processo','Em espera') not null default 'Em espera',
    dateConclusion datetime
);
alter table serviceOrder auto_increment=1;

-- criação de tabela estoque de peças
create table pieceStorage(
	idPieceStorage int auto_increment primary key,
    brand varchar(30),
    warranty varchar(30),
    model varchar(20),
    location varchar(30) not null
);
alter table pieceStorage auto_increment=1;

-- criação de tabela de relação de cliente e triagem
create table cliensSorting(
	idCSClients int,
    idCSSorting int,
    entryTime datetime not null,
    primary key(idCSClients, idCSSorting),
    constraint fk_clientssorting_clients foreign key(idCSClients) references clients(idClients),
    constraint fk_clientssorting_sorting foreign key(idCSSorting) references sorting(idSorting)
);

-- criação de tabela de relação triagem /mecanico
create table sortMecanic(
	idSMSorting int,
    idSMMecanic int,
    primary key(idSMSorting,idSMMecanic),
    constraint fk_sortmecanic_sorting foreign key(idSMSorting) references sorting(idSorting),
    constraint fk_sortmecanic_mecanic foreign key(idSMMecanic) references mecanic(idMecanic)
);


-- criação de tabela de relação de autorização de serviço cliente/serviço
create table serviceAuthorization(
	idSAserviceOrder int,
    idSAClients int,
    primary key(idSAserviceOrder,idSAClients),
    constraint fk_serviceauthorization_service foreign key(idSAserviceOrder) references serviceOrder(idServiceOrder),
    constraint fk_serviceauthirization_clients foreign key(idSAClients) references clients(idClients)
);

-- criação de tabela relação de triagem / ordem de serviço
create table sortServideORder(
	idSSOsorting int,
    idSSOServiceOrder int,
    responsibleAvaluation varchar(30),
    sector varchar(20),
    primary key(idSSOsorting,idSSOServiceOrder),
    constraint fk_sortiserviceorder_sorting foreign key(idSSOsorting) references sorting(idSorting),
    constraint fk_sortserviceorder_serviceorder foreign key(idSSOServiceOrder) references serviceOrder(idServiceOrder)
);

-- criação de tabela de relação de tipode peças/ ordem de service
create table typePieceService(
	idTPSPiece int,
    idTPSService int,
    primary key(idTPSPiece,idTPSService),
    constraint fk_typepieceservice_piece foreign key(idTPSPiece) references pieceStorage(idPieceStorage),
    constraint fk_typepieceservice_service foreign key(idTPSService) references serviceOrder(idServiceOrder)
);

-- criação de tabela relação de serviço para tal
create table serviceIK(
	idSIKservice int primary key,
    idSIKSorting int,
    constraint fk_serviceik_sorting foreign key(idSIKSorting) references sorting(idSorting)
);

-- criação de tabela de envio de ordem de relação ordem de serviço e serviço
create table sendService(
	idSSServiceOrder int primary key,
    idSSServiceik int,
    idSSServiceOrderFk int,
    constraint fk_sendservice_serviceik foreign key(idSSServiceik) references serviceIK(idSIKservice),
    constraint fk_sendservice_serviceOrderfk foreign key(idSSServiceOrderFk) references serviceOrder(idServiceOrder)
);

-- criação de tabela de serviços
create table tableService(
	idTSTableService int primary key,
    typeService varchar(20),
    timeService datetime,
    valueService float,
    idTSSorting int,
    constraint fk_tableservice_sorting foreign key(idTSSorting) references sorting(idSorting)
);


show tables;
