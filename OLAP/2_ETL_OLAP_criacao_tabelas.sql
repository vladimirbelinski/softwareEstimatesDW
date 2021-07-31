-- The commands below were used in MySQL Worbench 8.0

-- Setting database/schema as default
use gestao_tarefas_ETL;

-- Creating OLAP tables
create table escopo (
	cod_escopo int not null,
    descricao_escopo varchar(20) not null,
    primary key (cod_escopo)
);

create table prioridade (
	cod_prioridade int not null,
    descricao_prioridade varchar(20) not null,
    primary key (cod_prioridade)
);

create table estimativa (
	cod_estimativa int not null,
    descricao_sequencia_estimativa varchar(20) not null,
    unidade_medida varchar(10),
    valor float not null,
    primary key (cod_estimativa)
);

create table responsavel (
	cod_responsavel int not null,
    nome varchar(80) not null,
    data_entrada_projeto date,
    descricao_nivel_experiencia varchar(10) not null,
    primary key (cod_responsavel)
);

create table aplicacao (
	cod_aplicacao int not null,
    nome_produto varchar(20) not null,
    descricao_modulo varchar(20) not null,
    descricao_classificacao_modulo varchar(20) not null,
    primary key (cod_aplicacao)
);

create table tempo (
	cod_tempo int not null,
	quinzena int,
    mes int,
    ano int not null,
    primary key (cod_tempo)
);

create table fato_acuracia_e_desvios_estimativas_por_modulo (
	cod_escopo int not null,
    cod_prioridade int not null,
    cod_estimativa int not null,
    cod_responsavel int not null,
    cod_aplicacao int not null,
    cod_tempo int not null,
    qtd_tarefas int not null,
    acuracia float,
    desvio float,
    constraint pk_fato_estimativa_ampla primary key (cod_escopo, cod_prioridade, cod_estimativa, cod_responsavel, cod_aplicacao, cod_tempo),
    foreign key (cod_escopo) references escopo (cod_escopo),
    foreign key (cod_prioridade) references prioridade (cod_prioridade),
    foreign key (cod_estimativa) references estimativa (cod_estimativa),
    foreign key (cod_responsavel) references responsavel (cod_responsavel),
    foreign key (cod_aplicacao) references aplicacao (cod_aplicacao),
    foreign key (cod_tempo) references tempo (cod_tempo)
);

create table fato_acuracia_e_desvios_estimativas_ampla (
	cod_escopo int not null,
    cod_prioridade int not null,
    cod_estimativa int not null,
    cod_responsavel int not null,
    cod_tempo int not null,
    qtd_tarefas int not null,
    acuracia float,
    desvio float,
    constraint pk_fato_estimativa_ampla primary key (cod_escopo, cod_prioridade, cod_estimativa, cod_responsavel, cod_tempo),
    foreign key (cod_escopo) references escopo (cod_escopo),
    foreign key (cod_prioridade) references prioridade (cod_prioridade),
    foreign key (cod_estimativa) references estimativa (cod_estimativa),
    foreign key (cod_responsavel) references responsavel (cod_responsavel),
    foreign key (cod_tempo) references tempo (cod_tempo)
);