
select * from tHE_SetSubj

select a.acReceiver,c.acpost, a.acPrsn3,b.acPost from tHE_Move a
inner join tHE_SetSubj b on a.acPrsn3=b.acSubject
inner join tHE_SetSubj c on a.acReceiver=c.acSubject

select a.acReceiver,a.acPrsn3,c.acPost from tHE_Move a
inner join tHE_SetSubj c on a.acReceiver=c.acSubject

select distinct acReceiver,Year(addate)from the_move

select * from the_move where acdoctype like '3%'


--select * from the_move m
--inner join the_moveitem mi
--on m.acKey = mi.acKey
--inner join the_setum su
--on mi.acUM = su.acUM

select * from the_move where acIssuer =''

declare @ime_kolone varchar(255), @sql varchar(max)
set @ime_kolone = 'acIssuer'
set @sql = 'select right(' + @ime_kolone + ', len(' + @ime_kolone+ ')-1)' 
+ 'from tHE_Move where ' + @ime_kolone+ ' <> '''' '
+  'group by right(' + @ime_kolone + ', len(' + @ime_kolone+ ')-1)'
+  'having count(*) > 1'
select @sql
exec (@sql)



-- Traženje duplikata  
select right(acDocType, len(acDocType)-1)
 from tHE_Move 
 group by right(acDocType, len(acDocType)-1)
 having count(*) > 1

 
 select * from tHE_SetSubj order by acSubject
 select * from tHE_SetSubjContact order by acSubject, acName
 select * from tHE_SetSubjContactAddress order by acSubject

 select a.acSubject, a.acName, a.acSurname , b.acPhone  from tHE_SetSubjContact a
 inner join tHE_SetSubjContactAddress b on a.acSubject = b.acSubject 
  where a.anno = b.anno
 order by a.acname, a.acSurname


 select * from tHE_SetSubjContact where acSUbject = 'poduzeæe d.o.o.' and acname = 'mario'
 select * from tHE_SetSubjContactAddress where acsubject = 'poduzeæe d.o.o.'