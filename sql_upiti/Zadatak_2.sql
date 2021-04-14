select * from the_move
--kupac - acReceiver
--iznos - anForPay
--vrsta dokumenta - acDocType = '3000'

select * from tHE_SetSubj
--kupac - acSubject
--pb - acPost

select * from tHE_SetPostCode
--pb - acPost
--naziv - acName

-- (svi subjekti where acBuyer = 'T' --kupci), poštanki broj, mjesto,  vrsta dokumenta, iznos

select * from the_move
select acsubject from tHE_SetSubj where acBuyer = 'T'
select * from tHE_SetPostCode

 select acReceiver ,acSubject from tHE_Move,tHE_SetSubj
 select * from tHE_SetSubjContactAddress where acsubject = 'poduzeæe d.o.o.'

select b.acSubject,b.acPost, c.acName, acDocType,sum(a.anForPay) 
from tHE_Move a
right join tHE_SetSubj b on a.acReceiver=b.acSubject   and acDocType='3000'
left join tHE_SetPostCode c on b.acPost=c.acPost
where b.acBuyer='T' and a.anForPay='0'
group by b.acSubject,b.acPost, c.acName, a.acDocType
order by b.acSubject 

 select * from tHE_Move where acReceiver = '12345' -- and acname = 'mario'
 select * from tHE_SetSubj where acsubject = '12345' -- and acname = 'mario'
 select * from tHE_SetSubj where acsubject = '12345' -- and acname = 'mario'



select distinct a.acSubject
from the_setsubj a
left join tHE_move b on a.acSubject=b.acReceiver   and acDocType='3000' 
where a.acBuyer = 'T'

-- SELECT SUM(anForPay) FROM tHE_Move