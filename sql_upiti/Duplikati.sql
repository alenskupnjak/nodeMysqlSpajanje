--treženje Duplikata

select COLONA1
from TABELA
group by COLONA
having count(*)>1


select right(rtrim(identa),len(rtrim(identa))-1)
from _atmp_unos
group by right(rtrim(identa),len(rtrim(identa))-1)
having count(*)>1