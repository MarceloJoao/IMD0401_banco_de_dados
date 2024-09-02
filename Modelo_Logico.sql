CREATE TABLE "tb_time" (
  "id_time" serial PRIMARY KEY NOT NULL,
  "no_time" varchar(255) NOT NULL,
  "no_cidade" varchar(255),
  "no_pais" varchar(255),
  "no_tecnico" varchar(255) NOT NULL
);

CREATE TABLE "tb_jogador" (
  "id_jogador" serial PRIMARY KEY NOT NULL,
  "no_nome" varchar(255) NOT NULL,
  "dt_data_de_nascimento" date,
  "no_nacionalidade" varchar(255),
  "no_altura" varchar(6),
  "no_posicao" varchar(100) NOT NULL,
  "id_time" int
);

CREATE TABLE "tb_campeonato" (
  "id_campeonato" serial PRIMARY KEY NOT NULL,
  "no_nome_do_campeonato" varchar(255) NOT NULL,
  "dt_data_inicio" date,
  "dt_data_terminio" date,
  "no_tipo_de_esporte" varchar(255) NOT NULL
);

CREATE TABLE "tb_partida" (
  "id_partida" serial PRIMARY KEY NOT NULL,
  "dt_data_partida" date NOT NULL,
  "no_cidade_partida" varchar(255) NOT NULL,
  "no_pais_partida" varchar(255) NOT NULL,
  "no_resultado_partida" varchar(10) NOT NULL,
  "id_vencedor" int,
  "id_campeonato" int
);

CREATE TABLE "rl_campeonato_partida" (
  "id_time" int,
  "id_campeonato" int
);

ALTER TABLE "tb_jogador" ADD FOREIGN KEY ("id_time") REFERENCES "tb_time" ("id_time");

ALTER TABLE "tb_partida" ADD FOREIGN KEY ("id_vencedor") REFERENCES "tb_time" ("id_time");

ALTER TABLE "tb_partida" ADD FOREIGN KEY ("id_campeonato") REFERENCES "tb_campeonato" ("id_campeonato");

ALTER TABLE "rl_campeonato_partida" ADD FOREIGN KEY ("id_time") REFERENCES "tb_time" ("id_time");

ALTER TABLE "rl_campeonato_partida" ADD FOREIGN KEY ("id_campeonato") REFERENCES "tb_campeonato" ("id_campeonato");
