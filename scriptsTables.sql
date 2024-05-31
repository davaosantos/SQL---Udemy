create table cliente
(
    IDCLIENTE int auto_increment
        primary key,
    NOME      varchar(30)     not null,
    SEXO      enum ('M', 'F') not null,
    EMAIL     varchar(50)     null,
    CPF       varchar(11)     null,
    constraint CPF
        unique (CPF),
    constraint EMAIL
        unique (EMAIL)
);

create table endereco
(
    IDENDERECO int auto_increment
        primary key,
    RUA        varchar(30) not null,
    BAIRRO     varchar(30) not null,
    CIDADE     varchar(30) not null,
    ESTADO     char(2)     not null,
    ID_CLIENTE int         null,
    constraint ID_CLIENTE
        unique (ID_CLIENTE),
    constraint endereco_ibfk_1
        foreign key (ID_CLIENTE) references cliente (IDCLIENTE)
);

create table telefone
(
    IDTELEFONE int auto_increment
        primary key,
    TIPO       enum ('RES', 'COM', 'CEL') not null,
    NUMERO     varchar(10)                not null,
    ID_CLIENTE int                        null,
    constraint telefone_ibfk_1
        foreign key (ID_CLIENTE) references cliente (IDCLIENTE)
);

create index ID_CLIENTE
    on telefone (ID_CLIENTE);
