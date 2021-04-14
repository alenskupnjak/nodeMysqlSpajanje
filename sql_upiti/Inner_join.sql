-- prvi nacin
select a.acReceiver,a.acPrsn3,b.STUPACxx  from TABELA1 a
inner join TABELA2 b on a.STUPAC_iz_tabele1= b.STUPAC_iz_tabele2


-- drugi nacin
select a.acSubject, b.acReceiver
from the_setsubj a, the_Move b
where a.acSubject = b.acReceiver