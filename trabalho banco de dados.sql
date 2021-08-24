
-- 1
select distinct concat(p.NOC, ' - ', p.nome)paises,
(select count(1) from medalhas where medalha = 'ouro' and paisId = p.id) ouro,
(select count(1) from medalhas where medalha = 'prata' and paisId = p.id) prata,
(select count(1) from medalhas where medalha = 'bronze' and paisId = p.id) bronze,
(select count(1) from medalhas where paisId = p.id) total
from paises p 
order by 2 desc , 3 desc , 4 desc, 1;


-- 2

select  a.nome,p.NOC,
sum(if(m.medalha = 'ouro', 1, 0))ouro,
sum(if(m.medalha = 'prata', 1, 0))prata,
sum(if(m.medalha = 'bronze', 1, 0))bronze,
count(1)
from medalhas m
left join atletas a on a.id = m.atletaId
left join paises p on p.id = a.paisId
where m.atletaid is not null
group by 1, 2
order by 3 desc, 4 desc, 5 desc, 1;






