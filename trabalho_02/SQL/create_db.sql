-- 20-12-2024

create database trabalho_02_bd;
use trabalho_02_bd;

-- Usuários do sistema, criam eventos e participam como colaboradores em eventos 
create table USER (
	idUser int auto_increment,
    name varchar(100) not null,
    email varchar(150) not null unique,
    cpf varchar(14) not null unique,
    password varchar(80) not null,   
    primary key (idUser)
);

-- Eventos criados pelos usuários do sistema
create table EVENT (
	idEvent int auto_increment,
    title varchar(150) not null,
    description varchar(255) not null,
    n_subscribers int not null,
    max_subscribers int not null,
    location varchar(120) not null,
    code_form varchar(200) not null,
    acception_inscription bool not null,
    primary key (idEvent)
);

-- Inscrição de uma pessoa em um evento
create table ENROLLMENT (
	idEvent int not null,
	name varchar(100) not null,
	email varchar(150) not null,
    phone_number varchar(11) not null,
    cpf varchar(14) not null,
    gender char(1) not null,
    age int not null,
    ticket varchar(300) not null, -- Valor gerado a partir da concatenação de idEvent + cpf aplicando um função hash
    date date not null,
    time time not null,
    primary key (idEvent, cpf),
    foreign key (idEvent) references EVENT(idEvent)
);

-- Seção de um evento, indica data e hora que uma seção do evento acontece
create table EVENT_SECTION (
	idEvent int not null,
    date date not null,
    section_number int not null,
    start_time time not null,
    end_time time not null,
    primary key (idEvent, date, section_number),
    foreign key (idEvent) references EVENT(idEvent),
    check (start_time < end_time)
);

-- Posição que um usuário assume em um evento
create table USER_ROLE (
    idPosition int auto_increment,
    name varchar(50) not null unique,
    primary key (idPosition)
);

-- Categoria dos eventos
create table CATEGORY (
	idCategory int auto_increment,
    title varchar(80) not null unique,
    description varchar(255) not null,
    primary key (idCategory)
);

-- Relacionamento entre evento e categoria
create table EVENT_CATEGORY (
  	idCategory int not null,
    idEvent int not null,
    primary key (idEvent, idCategory),
    foreign key (idEvent) references EVENT(idEvent),
    foreign key (idCategory) references CATEGORY(idCategory)
);

-- Relacionamento entre usuário, evento e posição
create table USER_EVENT_ROLE (
	idEvent int not null,
    idPosition int not null,
    idUser int not null,
    date date not null,
    primary key (idPosition, idEvent, idUser),
    foreign key (idPosition) references USER_ROLE(idPosition),
    foreign key (idEvent) references EVENT(idEvent),
    foreign key (idUser) references USER(idUser)
);

-- Tabela que representa a presença de um participante em um evento
create table PRESENCE (
	enrollment_event_id int not null, -- PK da inscrição da pessoa no evento
    enrollment_cpf varchar(14) not null, -- PK da inscrição da pessoa no evento
	idEvent int not null, -- PK da seção do evento
	date date not null, -- PK da seção do evento
	section_number int not null, -- PK da seção do evento
	idUser int not null, -- PK do usuário que registrou a presença
    primary key (idEvent, date, section_number, enrollment_event_id, enrollment_cpf),
    foreign key (idUser) references USER(idUser),
    foreign key (enrollment_event_id, enrollment_cpf) references ENROLLMENT(idEvent, cpf),
    foreign key (idEvent, date, section_number) references EVENT_SECTION(idEvent, date, section_number)
);
