


SELECT * FROM tHE_SetItem 



SELECT * FROM tHE_SetItem a where len(a.acIdent)<2 or a.acIdent is null
group by a.acIdent
order by a.acIdent


SELECT * FROM tHE_SetItem where acIdent LIKE 'W%' 
SELECT acident, acname, acDescr, anRTPrice FROM tHE_SetItem where acIdent LIKE 'W%' 




















backup database demo_test to disk = 'c:\PantheonBackup\bkpDEMO_TEST_20180523_1.bak'


INSERT INTO the_setitem (acIdent,acName,anRTPrice ,acUM ,acFieldSA , acSupplier, acCustTariff)
select  distinct right(rtrim(ident2),len(rtrim(ident2))-1) ,LEFT(naziv,80), cast(replace(vpchrk, ',','.') as float), mj, pakiranje, Prizvodac, CarTarifa
from _atmp_unos
where len(right(rtrim(ident2),len(rtrim(ident2))-1)) <=16 and ident2 is not null
and right(rtrim(ident2),len(rtrim(ident2))-1) 
not in(
select right(rtrim(ident2),len(rtrim(ident2))-1)
from _atmp_unos where ident2 is not null
group by right(rtrim(ident2),len(rtrim(ident2))-1)
having count(*)>1
)

-- briše sve zapise u Pantenonu koji se nalaze u tmp_tablici
delete from tHE_SetItem
where acident in (
select right(rtrim(ident2),len(rtrim(ident2))-1) FROM _atmp_unos
WHERE len(right(rtrim(_atmp_unos.ident2),len(rtrim(_atmp_unos.ident2))-1)) <=16 and _atmp_unos.ident2 is not null 
and right(rtrim(_atmp_unos.ident2),len(rtrim(_atmp_unos.ident2))-1) 
not in(
select right(rtrim(_atmp_unos.ident2),len(rtrim(_atmp_unos.ident2))-1)
from _atmp_unos where _atmp_unos.ident2 is not null
group by right(rtrim(_atmp_unos.ident2),len(rtrim(_atmp_unos.ident2))-1)
having count(*)>1)
)

-- provjeravam koliko zapisa ima više od 16 znakova
select right(rtrim(ident2),len(rtrim(ident2))-1)
from _atmp_unos
where len(right(rtrim(ident2),len(rtrim(ident2))-1)) >16 and ident2 is not null

-- za potrebe prebacivanja u Pantenon prebacili su se proizvodaci iz temp tablice
insert into tHE_SetSubj(acSubject)
select distinct Prizvodac from _atmp_unos where Prizvodac is not null

declare @tekst varchar(255)
set @tekst = 'aa-bb'
select replace(@tekst, '-', '')

declare @tekst varchar(255)
set @tekst = '17.156'
select cast(@tekst as float)

-- provjera broja duplikata u temp bazi po šifri
select ident2
from _atmp_unos
where ident2 is not null
group by ident2 
having count(*)>1

-- pretvara polje uz tablice u float
select cast (replace(vpchrk,',','.') as float) from _atmp_unos 

-- konaèna provjera zapisa koliko su prebaèeni
select * from tHE_SetItem a
inner join _atmp_unos b on a.acIdent=right(rtrim(ident2),len(rtrim(ident2))-1)