-- 30-12-2024

use trabalho_02_bd;

-- 5.1) 01 Consulta utilizando projeção.
-- Liste o nome e o e-mail de todos os usuários cadastrados no sistema. A consulta deve retornar apenas essas duas colunas.
select name as Nome, email as Email from USER; 

-- 5.2) 02 Consulta utilizando seleção e projeção.
-- Liste o título e a descrição de todos os eventos que ainda estão aceitando inscrições. A consulta deve retornar apenas essas duas colunas.
select title as Título, description as Descrição from EVENT where acception_inscription = true;

-- 5.3) 03 Consulta que aplica a união (UNION) entre duas relações.
-- Liste os nomes de todos os usuários e os nomes de todos os participantes com idade maior que 40 anos inscritos em eventos. A consulta deve retornar uma única lista com os nomes, sem duplicatas.
select name as Nome from USER union (select name from ENROLLMENT where age > 40);

-- 5.4) 04 Consulta que aplica a diferença (EXCEPT) entre duas relações.
-- EXCEPT não suportado.
-- Liste os nomes dos usuários que não estão inscritos em nenhum evento. A consulta deve retornar apenas os nomes desses usuários.
select name as Nome from USER where cpf not in (select cpf from ENROLLMENT);

-- 5.5) 05 Consulta que aplica a interseção (INTERSECT) entre duas relações.
-- INTERSECT não suportado.
-- Liste os nomes dos usuários que também estão inscritos em eventos. A consulta deve retornar apenas os nomes desses usuários.
select name as Nome from USER where cpf in (select cpf from ENROLLMENT);

-- 5.6) 06 Consulta que faz uso de uma subconsulta que retorna um único valor.
-- Liste o título e a descrição do evento que possui o maior número de inscritos. A consulta deve retornar apenas essas duas colunas.
select title as Título, description as Descrição from EVENT where n_subscribers = (select max(n_subscribers) from EVENT);

-- 5.7) Consultas que utilizam subconsultas que retornam um conjunto de valores
-- 5.7.1) 07-1 IN ou NOT IN
-- Liste os eventos que possuem inscrições de participantes com mais de 30 anos. A consulta deve retornar o título do evento.
select title as Evento from EVENT
where idEvent in (
    select idEvent
    from ENROLLMENT
    where age > 30);

-- 5.7.2) 07-2 ANY
-- Liste os eventos que possuem pelo menos uma seção com duração superior a 2 horas. A consulta deve retornar o título do evento.
select title as Evento from EVENT
where idEvent = ANY (
    select idEvent
    from EVENT_SECTION
    where timestampdiff(hour, start_time, end_time) > 2);

-- 5.7.3) 07-3 EXIST ou NOT EXIST
-- Liste os usuários que são organizadores de pelo menos um evento. A consulta deve retornar o nome do usuário.
select name as Usuário from USER U
where exists (
    select 1
    from USER_EVENT_ROLE UER
    inner join USER_ROLE UR on UER.idPosition = UR.idPosition
    where UER.idUser = U.idUser and UR.name = 'Proprietário'
);

-- 5.7.4) 07-4 ALLL
-- Liste os eventos cujo número de inscritos é maior que o número de inscritos de todos os eventos da categoria 'Tecnologia'. A consulta deve retornar o título do evento.
select title as Evento from EVENT
where n_subscribers > all (
    select n_subscribers
    from EVENT E
    inner join EVENT_CATEGORY EC on E.idEvent = EC.idEvent
    inner join CATEGORY C on EC.idCategory = C.idCategory
    where C.title = 'Tecnologia'
);

-- 5.8) 08 Consulta que faz uso de uma subconsulta que retorna duas colunas.
-- Liste o nome e o e-mail dos inscritos que estão inscritos no evento com o maior número de inscritos. A consulta deve retornar apenas essas duas colunas.
select name as Nome, email as Email from ENROLLMENT
where idEvent = (
    select idEvent from EVENT
    where n_subscribers = (select max(n_subscribers) from EVENT)
);

-- 5.9) 09 Consulta que utiliza uma junção externa à direita.
-- Liste todos os eventos e, se houver, as seções associadas a esses eventos. A consulta deve retornar o título do evento, a data e o horário de início da seção, mesmo que o evento não tenha seções cadastradas.
select E.title as Evento, ES.date as Data, ES.start_time as Início from EVENT_SECTION ES 
right join EVENT E on ES.idEvent = E.idEvent;

-- 5.10) 10 Consulta que utiliza uma junção externa à esquerda.
-- Liste todas as seções de eventos e, se houver, os eventos associados a essas seções. A consulta deve retornar a data, o horário de início da seção e o título do evento, mesmo que a seção não esteja associada a um evento cadastrado.
select ES.date as Data, ES.start_time as Início, E.title as Evento from EVENT_SECTION ES
left join EVENT E on ES.idEvent = E.idEvent;

-- 5.11) 11 Consulta que utiliza uma ou mais funções de agregação.
-- Calcule o número total de inscritos, o número máximo de inscritos permitido e a média de inscritos por evento. A consulta deve retornar essas três métricas.
select
    sum(n_subscribers) as Total_Inscritos,
    max(max_subscribers) as Máximo_Inscritos_Permitido,
    avg(n_subscribers) as Média_Inscritos_Por_Evento
from EVENT;

-- 5.12) 12 Consulta que faz uso de uma função de agregação com cláusula GROUP BY.
-- Calcule o número total de inscritos em eventos por gênero. A consulta deve retornar o gênero e o total de inscrições, agrupados por gênero.
select gender as Gênero, COUNT(*) as Total_Inscrições from ENROLLMENT
group by gender;

-- 5.13) 13 Consulta que faz uso de duas funções de agregação com cláusula GROUP BY.
-- Para cada categoria de evento, calcule o número total de eventos e a média de inscritos por evento. A consulta deve retornar o título da categoria, o total de eventos e a média de inscritos, agrupados por categoria.
select
    C.title as Categoria,
    count(EC.idEvent) as Total_Eventos,
    avg(E.n_subscribers) as Média_Inscritos
from CATEGORY C
left join EVENT_CATEGORY EC on C.idCategory = EC.idCategory
left join EVENT E on EC.idEvent = E.idEvent
group by C.title;

-- 5.14) 14 Consulta que faz uso de uma função agregada com cláusula GROUP BY e HAVING.
-- Liste os eventos que tiveram mais de 10 presenças registradas. A consulta deve retornar o título do evento e o total de presenças, agrupados por evento, considerando apenas eventos com mais de 10 presenças.
select
    E.title as Evento,
    count(P.enrollment_cpf) as Total_Presenças
from EVENT E
left join EVENT_SECTION ES on E.idEvent = ES.idEvent
left join PRESENCE P on ES.idEvent = P.idEvent and ES.date = P.date and ES.section_number = P.section_number
group by E.title
having count(P.enrollment_cpf) > 10;

-- 5.15) 15 Consulta utilizando junção interna (duas relações envolvidas na consulta).
-- Liste o nome e o e-mail dos usuários que são organizadores de eventos. A consulta deve retornar o nome do usuário, o e-mail e o título do evento em que ele atua como organizador.
select
    U.name as Nome,
    U.email as Email,
    E.title as Evento
from USER U
inner join USER_EVENT_ROLE UER on U.idUser = UER.idUser
inner join EVENT E on UER.idEvent = E.idEvent
inner join USER_ROLE UR on UER.idPosition = UR.idPosition
where UR.name = 'Proprietário';

-- 5.16) 16 Consulta utilizando junção interna (três relações envolvidas na consulta).
-- Liste os participantes inscritos em eventos, os títulos dos eventos em que estão inscritos e as categorias desses eventos. A consulta deve retornar o nome do participante, o título do evento e a categoria do evento.
select
    EN.name as Participante,
    EV.title as Evento,
    C.title as Categoria
from ENROLLMENT EN
inner join EVENT EV on EN.idEvent = EV.idEvent
inner join EVENT_CATEGORY EC on EV.idEvent = EC.idEvent
inner join CATEGORY C on EC.idCategory = C.idCategory;

-- 5.17) 17 Consulta utilizando junção interna (quatro relações envolvidas na consulta).
-- Liste os participantes inscritos em eventos, os títulos dos eventos em que estão inscritos, as categorias desses eventos e as seções dos eventos. A consulta deve retornar o nome do participante, o título do evento, a categoria do evento e a data da seção.
select
    EN.name as Participante,
    EV.title as Evento,
    C.title as Categoria,
    ES.date as Data_Seção
from ENROLLMENT EN
inner join EVENT EV on EN.idEvent = EV.idEvent
inner join EVENT_CATEGORY EC on EV.idEvent = EC.idEvent
inner join CATEGORY C on EC.idCategory = C.idCategory
inner join EVENT_SECTION ES on EV.idEvent = ES.idEvent;