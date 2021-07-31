-- The commands below were used in MySQL Worbench 8.0

-- Setting database/schema as default
use gestao_tarefas_ETL;

-- Removing OLTP tables
drop table tarefa_OLTP;
drop table sprint_OLTP;
drop table valor_padrao_sequencia_OLTP;
drop table valor_padrao_estimativa_OLTP;
drop table sequencia_estimativa_OLTP;
drop table produto_modulo_OLTP;
drop table modulo_OLTP;
drop table classificacao_modulo_OLTP;
drop table produto_OLTP;
drop table prioridade_OLTP;
drop table escopo_OLTP;
drop table programador_OLTP;
drop table nivel_experiencia_OLTP;