                                                      Avaliação da 3ª Unidade

                                                      Componentes do grupo:

                                                      João Marcelo de Souza

                                        Banco de dados físico do Gerenciamento de Torneios Esportivos


                                                     Codigo Base das tabelas:
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

                                                  QUESTÕES:

1. Insira registro pelo menos 3 registros em TODAS as tabelas do seu banco de dados
Descrição: inserindo os dados no banco de dados
--inserindo na tb_time:
INSERT INTO public.tb_time (id_time, no_time, no_cidade, no_pais, no_tecnico)
VALUES 
(1, 'Flamengo', 'Rio de Janeiro', 'Brasil', 'Tite'),
(2, 'São Paulo FC', 'São Paulo', 'Brasil', 'Zulbeldia'),
(3, 'Real Madrid CF', 'Madri', 'Espanha', 'Ancelotti'),
(4, 'Manchester City', 'Manchester', 'Inglaterra', 'Guardiola'),
(5, 'Al Hilal', 'Riade', 'Arábia Saudita', 'Jorge Jesus'),
(6, 'Arsenal', 'Londres', 'Inglaterra', 'Arteta');

--inserindo na tb_jogador:
INSERT INTO public.tb_jogador 
    (id_jogador, no_nome, dt_data_de_nascimento, no_nacionalidade, no_altura, no_posicao, id_time) 
VALUES 
    (1, 'João Marcelo', '2002-03-25', 'Brasileira', '1.8', 'Volante', 1),
    (2, 'Luis Carlos', '1992-02-02', 'Brasileira', '1.75', 'Lateral Direito', 2),
    (3, 'Nacho Fernandez', '1994-03-03', 'Espanhol', '1.85', 'Zagueiro', 3),
    (4, 'Neymar', '1998-05-01', 'Brasileira', '1.83', 'Atacante', 5),
    (5, 'Lionel Messi', '1992-04-10', 'Argentino', '1.65', 'Atacante', 2),
    (6, 'Davi Walker', '2000-06-24', 'Inglês', '1.89', 'Goleiro', 1),
    (7, 'Salem', '2000-06-23', 'Árabe', '1.85', 'Goleiro', 2),
    (8, 'José Sá', '2001-03-20', 'Português', '1.86', 'Goleiro', 3),
    (9, 'Bono', '2002-03-20', 'Marroquino', '1.85', 'Goleiro', 4),
    (10, 'Gatito', '2002-03-20', 'Paraguaio', '1.88', 'Goleiro', 5),
    (11, 'Rossi', '2001-04-06', 'Argentino', '2', 'Goleiro', 6),
    (12, 'Luis Souza', '1992-02-02', 'Brasileira', '1.75', 'Lateral Direito', 1),
    (13, 'Carvajal', '1994-03-03', 'Espanhol', '1.85', 'Lateral Direito', 3),
    (14, 'Zé Lucio', '1994-03-03', 'Espanhol', '1.8', 'Lateral Direito', 4),
    (15, 'Seu Zé', '1994-03-03', 'Italiano', '1.79', 'Lateral Direito', 5),
    (16, 'Cleman', '1994-03-03', 'Francês', '1.85', 'Lateral Direito', 6),
    (17, 'Pedro Silva', '1990-07-15', 'Brasileiro', '1.82', 'Zagueiro', 1),
    (18, 'Carlos Mendes', '1995-11-22', 'Português', '1.78', 'Zagueiro', 1),
    (19, 'Javier Hernandez', '1988-09-05', 'Mexicano', '1.75', 'Zagueiro', 2),
    (20, 'Marta Rodrigues', '1998-12-18', 'Brasileira', '1.7', 'Zagueiro', 2),
    (21, 'Roberto Firmino', '1991-10-02', 'Brasileiro', '1.81', 'Zagueiro', 3),
    (22, 'Luka Modric', '1985-09-09', 'Croata', '1.72', 'Zagueiro', 4),
    (23, 'Sergio Ramos', '1986-03-30', 'Espanhol', '1.84', 'Zagueiro', 4),
    (24, 'Virgil van Dijk', '1991-07-08', 'Holandês', '1.93', 'Zagueiro', 5),
    (25, 'Thiago Silva', '1984-09-22', 'Brasileiro', '1.83', 'Zagueiro', 5),
    (26, 'Kalidou Koulibaly', '1991-06-20', 'Senegalês', '1.87', 'Zagueiro', 6),
    (27, 'Giorgio Chiellini', '1984-08-14', 'Italiano', '1.87', 'Zagueiro', 6),
    (28, 'Raphael Varane', '1993-04-25', 'Francês', '1.91', 'Zagueiro', 6),
    (29, 'Marcelo Vieira', '1988-05-12', 'Brasileiro', '1.74', 'Lateral Esquerdo', 1),
    (30, 'Jordi Alba', '1989-03-21', 'Espanhol', '1.7', 'Lateral Esquerdo', 2),
    (31, 'Andrew Robertson', '1994-03-11', 'Escocês', '1.78', 'Lateral Esquerdo', 3),
    (32, 'David Alaba', '1992-06-24', 'Austríaco', '1.8', 'Lateral Esquerdo', 4),
    (33, 'Alex Sandro', '1991-01-26', 'Brasileiro', '1.8', 'Lateral Esquerdo', 5),
    (34, 'Theo Hernandez', '1997-10-06', 'Francês', '1.84', 'Lateral Esquerdo', 6),
    (35, 'Casemiro', '1992-02-23', 'Brasileiro', '1.85', 'Volante', 1),
    (36, 'N''Golo Kanté', '1991-03-29', 'Francês', '1.68', 'Volante', 1),
    (37, 'Sergio Busquets', '1988-07-16', 'Espanhol', '1.89', 'Volante', 2),
    (38, 'Fabinho', '1993-10-23', 'Brasileiro', '1.88', 'Volante', 2),
    (39, 'Rodri', '1996-06-22', 'Espanhol', '1.91', 'Volante', 3),
    (40, 'Joshua Kimmich', '1995-02-08', 'Alemão', '1.77', 'Volante', 3),
    (41, 'Fernandinho', '1985-05-04', 'Brasileiro', '1.79', 'Volante', 4),
    (42, 'Declan Rice', '1999-01-14', 'Inglês', '1.85', 'Volante', 4),
    (43, 'Jorginho', '1991-12-20', 'Italiano', '1.8', 'Volante', 5),
    (44, 'Marcelo Brozović', '1992-11-16', 'Croata', '1.81', 'Volante', 5),
    (45, 'Thomas Partey', '1993-06-13', 'Ganês', '1.85', 'Volante', 6),
    (46, 'Wilfred Ndidi', '1996-12-16', 'Nigeriano', '1.83', 'Volante', 6),
    (47, 'Kevin De Bruyne', '1991-06-28', 'Belga', '1.81', 'Meia', 1),
    (48, 'Luka Modrić', '1985-09-09', 'Croata', '1.72', 'Meia', 2),
    (49, 'Bruno Fernandes', '1994-09-08', 'Português', '1.79', 'Meia', 3),
    (50, 'Bernardo Silva', '1994-08-10', 'Português', '1.73', 'Meia', 4),
    (51, 'Toni Kroos', '1990-01-04', 'Alemão', '1.83', 'Meia', 5),
    (52, 'Paul Pogba', '1993-03-15', 'Francês', '1.91', 'Meia', 6),
    (53, 'Mohamed Salah', '1992-06-15', 'Egípcio', '1.75', 'Atacante', 1),
    (54, 'Sadio Mané', '1992-04-10', 'Senegalês', '1.75', 'Atacante', 1),
    (55, 'Pierre-Emerick Aubameyang', '1989-06-18', 'Gabão', '1.87', 'Atacante', 2),
    (56, 'Riyad Mahrez', '1991-02-21', 'Argelino', '1.79', 'Atacante', 2),
    (57, 'Heung-Min Son', '1992-07-08', 'Sul-Coreano', '1.83', 'Atacante', 3),
    (58, 'Takumi Minamino', '1995-01-16', 'Japonês', '1.74', 'Atacante', 3),
    (59, 'Victor Osimhen', '1998-12-29', 'Nigeriano', '1.85', 'Atacante', 4),
    (60, 'Wilfried Zaha', '1992-11-10', 'Marfinense', '1.8', 'Atacante', 4),
    (61, 'Asamoah Gyan', '1985-11-22', 'Ganês', '1.86', 'Atacante', 5),
    (62, 'Odion Ighalo', '1989-06-16', 'Nigeriano', '1.88', 'Atacante', 5),
    (63, 'Islam Slimani', '1988-06-18', 'Argelino', '1.88', 'Atacante', 6),
    (64, 'Gervinho', '1987-05-27', 'Marfinense', '1.79', 'Atacante', 6),
    (65, 'Wu Lei', '1991-11-19', 'Chinês', '1.74', 'Atacante', 1),
    (66, 'Almoez Ali', '1996-08-19', 'Catariano', '1.8', 'Atacante', 2),
    (67, 'Musa Barrow', '1998-11-14', 'Gambiano', '1.83', 'Atacante', 3),
    (68, 'Paul Onuachu', '1994-05-28', 'Nigeriano', '2.01', 'Atacante', 4),
    (69, 'Sardar Azmoun', '1995-01-01', 'Iraniano', '1.86', 'Atacante', 5),
    (70, 'Ali Mabkhout', '1990-10-05', 'Emiradense', '1.78', 'Atacante', 6);


--inserindo na tb_campeonato:

    INSERT INTO public.tb_campeonato (id_campeonato, no_nome_do_campeonato, dt_data_inicio, dt_data_terminio, no_tipo_de_esporte) 
    VALUES
    (1, 'Copa dos Campeões', '2020-09-07', '2021-01-01', 'Futebol'),
    (2, 'Libertadores', '2021-02-03', '2021-12-01', 'Futebol'),
    (3, 'Liga Mundial', '2022-08-10', '2023-10-31', 'Futebol'),
    (4, 'Campeonato Natalense', '2023-12-31', '2024-03-25', 'Futebol'),
    (5, 'Copa Internacional', '2024-09-01', '2024-09-30', 'Futebol');

--inserindo na tb_partida:

    INSERT INTO public.tb_partida (id_partida, dt_data_partida, no_cidade_partida, no_pais_partida, no_resultado_partida, id_vencedor, id_campeonato) 
    VALUES
    (1, '2020-10-10', 'São Paulo', 'Brasil', '2-1', 1, 1),
    (2, '2021-08-11', 'Rio de Janeiro', 'Brasil', '0-3', 2, 1),
    (3, '2020-12-12', 'São Paulo', 'Brasil', '1-2', 3, 1),
    (4, '2021-01-01', 'São Paulo', 'Brasil', '2-0', 4, 1),
    (5, '2020-12-14', 'São Paulo', 'Brasil', '1-0', 5, 1),
    (6, '2021-02-06', 'Buenos Aires', 'Argentina', '1-0', 5, 2),
    (7, '2021-03-16', 'Buenos Aires', 'Argentina', '2-3', 3, 2),
    (8, '2021-08-17', 'Buenos Aires', 'Argentina', '3-1', 6, 2),
    (9, '2021-08-18', 'Buenos Aires', 'Argentina', '0-4', 6, 2),
    (10, '2022-08-19', 'Tóquio', 'Japão', '2-1', 3, 3),
    (11, '2023-08-20', 'Tóquio', 'Japão', '1-3', 5, 3),
    (12, '2024-02-21', 'Tóquio', 'Japão', '4-2', 5, 3),
    (13, '2024-01-22', 'Londres', 'Inglaterra', '1-0', 2, 4),
    (14, '2024-01-23', 'Londres', 'Inglaterra', '2-3', 6, 4);

--inserindo na rl_campeonato_partida:
    INSERT INTO public.rl_campeonato_partida (id_time, id_campeonato) 
    VALUES
    (1, 1),
    (1, 3),
    (2, 1),
    (2, 4),
    (3, 3),
    (3, 2),
    (4, 1),
    (4, 2),
    (5, 2),
    (5, 3),
    (6, 2),
    (6, 4);


2. Crie um comando para adicionar uma nova coluna em alguma tabela do seu banco de dados. Essa coluna deve ser NOT NULL e ter mais alguma restrição da sua preferência (PK, FK, UNIQUE, etc). Adicione valores a essa nova coluna

Descrição: Adicionei uma nova coluna chamada "nu_publico_max" do tipo int, para descrever a capacidade do estadio do time, tendo uma restrição que a capacidade não aceita valores negativos

alter table "tb_time"
add column "nu_publico_max" int;
--garantir que a capacidade do estadio seja maior que 0
alter table "tb_time"
add constraint "capacidade_est" check ("nu_publico_max" > 0);

--Adicionando no time 1:
update tb_time
set nu_publico_max = 35000
where id_time = 1;

--Adicionando no time 2:
update tb_time
set nu_publico_max = 50000
where id_time = 2;

--Adicionando no time 3:
update tb_time
set nu_publico_max = 52000
where id_time = 3;

--Adicionando no time 4:
update tb_time
set nu_publico_max = 62000
where id_time = 4;

--Adicionando no time 5:
update tb_time
set nu_publico_max = 80000
where id_time = 5;

--Adicionando no time 6:
update tb_time
set nu_publico_max = 48000
where id_time = 6;


3. Crie uma nova tabela (com pelo menos 3 colunas) que tenha uma coluna com FK de alguma tabela já existente no seu banco de dados. Adicione 1 registros a essa tabela.

Descrição: Foi criada uma tabela para funcionar como um rh, onde vai ser armazenar as informações dos contratos dos jogadores
--tabela para armazenar os contratos dos jogadores
create table tb_contrato(
    id_contrato serial primary key not null,
    id_jogador int NOT NULL,
    id_time int NOT NULL,
    dt_inicio_contrato date,
    dt_fim_contrato date,
    nu_salario float,
    foreign key (id_jogador) references tb_jogador(id_jogador),
    foreign key (id_time) references tb_time(id_time)
	
);

--inserindo 1 registro
INSERT INTO public.tb_contrato(id_contrato, id_jogador, id_time, dt_inicio_contrato, dt_fim_contrato, nu_salario)
values
('1','1', '1', '2022-09-01', '2025-01-01', 500000);

4. Altere o nome e o tipo da coluna de alguma tabela do seu banco de dados

Descrição: alterei o nome da coluna no_altura e alterei o seu tipo para float que inicialmente era varchar
--alterando o nome
alter table tb_jogador rename column no_altura to nu_altura;
--alterando o tipo
alter table tb_jogador
alter column nu_altura type float using nu_altura::float;

5. Exclua algum registro de uma das tabelas do seu banco com base em duas condições
Descrição: Excluir as partidas que ocorreram em São Paulo, e foram realizadas em 2020:

delete from tb_partida
where no_cidade_partida = 'São Paulo' and extract(year from dt_data_partida) in (2020);

6. Faça a atualização de 2 registros de alguma tabela no seu banco de dados. Essa atualização só deve ser realizada com base em 2 condições (informe qual a condição)

Descrição: atualizar a data de término de campeonatos que atendem a duas condições: o nome do campeonato que tiver a inicial 'Copa' e o tipo de esporte.

update tb_campeonato
set dt_data_terminio = '2024-12-31'
where no_nome_do_campeonato like 'Copa%' and no_tipo_de_esporte ='Futebol';

7. Faça duas consultas que utilizam operadores relacionais e lógicos:

Descrição consulta 1: Selecionar as partidas, onde o país da partida for diferente do Brasil
--selecionar partidas que não ocorreram no Brasil
select no_cidade_partida, no_pais_partida, no_resultado_partida
from tb_partida
where no_pais_partida != 'Brasil';

Descrição consulta 2: Selecionar os jogadores que são atacantes e tenham altura maior que 1.80
--selecionar os jogadores que são atacantes e tem mais que 1.80 de altura
select no_nome, no_posicao, nu_altura
from tb_jogador
where no_posicao = 'Atacante' and nu_altura > 1.80;

8. Faça uma consulta que contenha o operador LIKE e operadores lógicos

Descrição: Lista os jogadores que começam com a letra A ou N
--na tabela jogador, jogadores que começam com a letra A ou N
select no_nome, no_nacionalidade
from tb_jogador
where no_nome like 'A%' or no_nome like 'N%';

9. Faça uma consulta que contenha o operador IN e operadores lógicos

Descrição: Lista a data e o resultado das partidas que foram na Argentina e Inglaterra

select dt_data_partida, no_resultado_partida, no_pais_partida
from tb_partida
where no_pais_partida in ('Argentina', 'Inglaterra');


10. Faça uma consulta que contenha pelo menos dois operadores especiais (BETWEEN, LIKE, IN)

Descrição: Listar os Jogadores que nasceram entre 1994, 1992 e 1997, e que sua posição seja lateral

select no_nome, no_posicao, id_time, dt_data_de_nascimento
from tb_jogador
where extract(year from dt_data_de_nascimento) in (1994, 1992, 1997) and no_posicao ilike 'Lateral%';

11. Faça 3 consultas com funções de agregação e utilize também operadores lógicos e especiais (cada consulta deve ter uma função de agregação diferente)

Descrição Consulta 1: Verificar a altura media dos jogadores que tenham mais de um 1.70

select ROUND(AVG(nu_altura)::NUMERIC, 2) as media_altura
from tb_jogador
where nu_altura > 1.70;

Descrição Consulta 2: Listar a quantidade de jogadores cadastrada no banco de dados

select count (*) as total_de_jogadores
from tb_jogador;

Descrição consulta 3: listar o estadio que tem a maior capacidade de publico, entre os time com o id 3 a 6

select max(nu_publico_max) as maior_estadio
from tb_time
where id_time between 3 and 6;


12. Faça um nova consulta com uma função de agregação, uma operadores lógicos, operadores relacionais onde o resultados seja apresentado em ordem crescente ou decrescente

Descrição: listar a quantidade de jogadores por posição , onde somente será listado posições que tenham ao menos 2 jogadores ou mais, e por fim ordena a lista de posições por ordem decrescente

select tb_jogador.no_posicao as posicao, count(tb_jogador.id_jogador) as total_jogadores
from tb_jogador
--nacionalidade não pode ser null
where 
	tb_jogador.no_nacionalidade is not null
group by 
	tb_jogador.no_posicao
having
	count(tb_jogador.id_jogador) >= 2
order by
 total_jogadores desc;

13. Faça uma consulta que utilize o GROUP BY e a cláusula HAVING

Descrição: Listar a quantidade de jogadores por nacionalidade, e foi utilizado o having para pegar somente as nacionalidades que tem pelo menos 2 jogadores ou mais

select no_nacionalidade, count(id_jogador) as total_jogador
from tb_jogador
group by no_nacionalidade
--mostrar nacionalidades com 2 ou mais jogadores
having
count (id_jogador) >= 2;

14. Faça uma consulta utilizando INNER JOIN

Descrição: Listar os jogadores que são zagueiros juntamente com o nome de seus respectivos times

select tb_time.no_time as nome_time, tb_jogador.no_nome as nome_jogador, tb_jogador.no_posicao as posicao_jogador
from tb_jogador
inner join tb_time on tb_jogador.id_time = tb_time.id_time
where tb_jogador.no_posicao = 'Zagueiro';

15. Faça uma consulta utilizando LEFT JOIN

Descrição: Listar todos os campeonatos e as partidas associadas a eles, caso tenha

 select tb_campeonato.no_nome_do_campeonato as nome_campeonato, 
       tb_partida.dt_data_partida as data_partida,
       tb_partida.no_cidade_partida as cidade_partida,
       tb_partida.no_resultado_partida as resultado_partida
from tb_campeonato
left join tb_partida on tb_campeonato.id_campeonato = tb_partida.id_campeonato;


16. Faça uma consulta utilizando RIGHT JOIN

Descrição: lista as partidas, juntamente com o nome do time vencedor, ordenando a lista pela ordem alfabeltica dos times vencedores

select tb_partida.id_partida, tb_partida.no_cidade_partida as cidade_partida, tb_time.no_time as time_vencedor
from tb_time
right join 
     tb_partida on tb_time.id_time = tb_partida.id_vencedor
order by
    tb_time.no_time;


17. Faça um consulta com a união de 3 tabelas (utilize qualquer JOIN) e que seu resultado seja de ordem crescente

Descrição: listar todos os campeonatos, incluindo os times associados a cada campeonato, mesmo se algum campeonato não tiver times associados a ele, ordenando o resultado pelo id_campeonato 

select tb_campeonato.id_campeonato, tb_campeonato.no_nome_do_campeonato, tb_time.no_time
from tb_time
right join 
	rl_campeonato_partida on tb_time.id_time = rl_campeonato_partida.id_time
right join 
	tb_campeonato on rl_campeonato_partida.id_campeonato = tb_campeonato.id_campeonato
order by
   tb_campeonato.id_campeonato;

18. Crie uma função que retorna a uma tabela. A função deve ter condições

Descrição: Foi criada uma função para listar os jogadores de determinado time, que sejam de determinada posição

create or replace function buscar_jogadores(p_id_time int, p_posicao varchar)
--retorna uma tabela
returns table(id_jogador int, no_nome varchar, no_nacionalidade varchar, no_posicao varchar) as $$
begin
	return query
    select j.id_jogador, j.no_nome, j.no_nacionalidade, j.no_posicao
	from tb_jogador as j
	where j.id_time = p_id_time and j.no_posicao = p_posicao;
end;
$$ language plpgsql;

--para usar a função, segue um exemplo:
select * from buscar_jogadores(1, 'Atacante');


19. Crie uma função que processam um conjunto de valores e retornam a um valor

Descrição: Foi criada uma função para calcular a altura media dos jogadores de acordo com cada time
--parametro o id_time
create or replace function media_altura(p_id_time int)
returns numeric as $$
declare 
	media_altura numeric;
begin
	select round(avg(nu_altura)::numeric ,2) into media_altura
    from tb_jogador
    where id_time = p_id_time;

    return media_altura;
end;
$$ language plpgsql;

--para usar a função, segue exemplo, o parametro é o id do time

select media_altura(1);

20. Crie uma função VOID (Não retorna a nenhum valor mas executa alguma operação)

Descrição: Foi criada uma função VOID para um determinado jogador ser transferido para outro time:

--parametros id_jogador e o id_time que ele vai ser transferido
create or replace function mudar_time_jogador(p_id_jogador int, novo_time int)
returns void as $$
begin
	 update tb_jogador
	 set id_time = novo_time
  	 where id_jogador = p_id_jogador;

end;
$$ language plpgsql;

--para usar a função, segue exemplo
select mudar_time_jogador(12, 3);
	 
------------------------------ PONTO EXTRA

21. Crie uma função da sua preferência que utilize funções de agregação (AVG, SUM, COUNT, MIN ou MAX) operadores especiais, relacionais, JOIN, GROUP BY e ORDER BY)

Descrição: A função retornará uma tabela, no qual vai listar os times, com as suas vitorias nas partidas, e por fim ordenar os times por ordem crescente, de acordo com o total_vitorias

create or replace function vitorias_por_time()
--retornar uma tabela
returns table(ind_time int, nome_time varchar, total_vitorias bigint) as $$
begin
return query
	--selecionar o id_time, no_time, e contar as vitorias
	select tb_time.id_time,tb_time.no_time, count(tb_partida.id_partida) as total_vitorias
from tb_time
inner join 
	tb_partida on tb_time.id_time = tb_partida.id_vencedor
--filtrar por time
group by
   tb_time.id_time, tb_time.no_time
   --ordenar por quantidade de vitorias
order by
	total_vitorias;
end;
$$ language plpgsql;

--Para usar a função, segue exemplo:
select * from vitorias_por_time();