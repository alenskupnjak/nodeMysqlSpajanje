backup database demo_test to disk = 'c:\PantheonBackup\bkpDEMO_TEST_20180524_1.bak'


INSERT INTO the_setitem (acIdent,acName,anRTPrice ,acUM ,acFieldSA , acSupplier, acCustTariff)
--acSetOfItem, acVATCode, acVATCodeTR, anVAT
select  distinct right(rtrim(ident2),len(rtrim(ident2))-1) ,LEFT(naziv,80), cast(replace(vpchrk, ',','.') as float), mj, pakiranje, Prizvodac, right(rtrim(Cartar2),len(rtrim(CarTar2))-1)
--'200', '5R', '5R', 25
from _atmp_unos
where len(right(rtrim(ident2),len(rtrim(ident2))-1)) <=16 and ident2 is not null
and right(rtrim(ident2),len(rtrim(ident2))-1) 
not in(
select right(rtrim(ident2),len(rtrim(ident2))-1)
from _atmp_unos where ident2 is not null
group by right(rtrim(ident2),len(rtrim(ident2))-1)
having count(*)>1
)

select * from _atmp_unos
select acIdent,acName,anRTPrice ,acUM ,acFieldSA , acSupplier, acCustTariff from the_setitem
select  right(rtrim(Cartar2),len(rtrim(CarTar2))-1) from _atmp_unos


select * from the_accttransitem

-- briše sve zapise u Pantenonu koji se nalaze u tmp_tablici
select *  from tHE_SetItem
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

-- tablica carinskih tarifa tHE_SetCustTariff !
select * from tHE_SetCustTariff
select CarTarifa,CarTar2 from _atmp_unos

insert into tHE_SetCustTariff (acCustTariff, acName)
select distinct CarTar2, case when cartar2naziv is null then 'TREBA UNJIJETI' else cartar2naziv end
--where cartar2naziv is not null and cartar2naziv <> ''

update tHE_SetCustTariff
set acName = 'TREBA UNIJETI'
where acName = '' or acName is null

update ss2
set acPOst = 'hr-' + pb
from the_setsubj ss inner join _atmp_subjekti a
on ss.acSubject = a.acSubject
inner join the_setpostcode spc
on 'HR-' + rtrim(pb) = spc.acPost
inner join the_setsubj ss2

insert into the_setsubj (acSUbject, acPOST)
select subjekt, case when exists (select acPOst form the_setspostcode b where b.acPOst = 'HR-' + a.pb) then 'HR-' + pb else '' end
from _atmp_subjekti a

insert into the_setsubj (acSUbject, acPOST)
select subjekt, (select acPost from the_setpostcode where acPOst = 'HR-' + a.pb)
from _atmp_subjekti a




-- svi tHE_SetItem.acIdent gdje ne postoji zapis u _Atmp_Unos (right(ident))
select * from tHE_SetItem 
where acIdent
not in (
select right(rtrim(ident2),len(rtrim(ident2))-1) FROM _atmp_unos
WHERE len(right(rtrim(_atmp_unos.ident2),len(rtrim(_atmp_unos.ident2))-1)) <=16 and _atmp_unos.ident2 is not null 
and right(rtrim(_atmp_unos.ident2),len(rtrim(_atmp_unos.ident2))-1) 
not in(
select right(rtrim(_atmp_unos.ident2),len(rtrim(_atmp_unos.ident2))-1)
from _atmp_unos where _atmp_unos.ident2 is not null
group by right(rtrim(_atmp_unos.ident2),len(rtrim(_atmp_unos.ident2))-1)
having count(*)>1)
)


-- svi tHE_SetItem.acIdent gdje ne postoji zapis u _Atmp_Unos (right(ident))
select acIdent from tHE_SetItem si
where not EXISTS
 (
select right(rtrim(a.ident2),len(rtrim(a.ident2))-1) FROM _atmp_unos a
WHERE len(right(rtrim(a.ident2),len(rtrim(a.ident2))-1)) <=16 and a.ident2 is not null 
and right(rtrim(a.ident2),len(rtrim(a.ident2))-1) 
not in(
select right(rtrim(b.ident2),len(rtrim(b.ident2))-1)
from _atmp_unos b where b.ident2 is not null
group by right(rtrim(b.ident2),len(rtrim(b.ident2))-1)
having count(*)>1) and si.acIdent = right(rtrim(a.ident2),len(rtrim(a.ident2))-1)
)


select * from the_setitem si
where not exists (select * from _Atmp_Unos where ident = si.acIdent)

-- prikazi sve iz the_setitem.acIdent gdje ne postoji the_moveitem.acident

select distinct acident from tHE_SetItem
select distinct acident from the_moveitem

select * from tHE_SetItem a
where not exists (select * from tHE_MoveItem b where a.acident=b.acident)

