select * from the_move
select distinct acReceiver from the_move
select distinct acsubject  from tHE_SetSubj
select * from the_move

select acsubject from tHE_SetSubj a
WHERE not EXISTS
(SELECT acReceiver FROM the_move b WHERE a.acsubject= b.acReceiver);

select acsubject from the_setsubj a
where a.acsubject not in (select b.acReceiver from the_move b)

select acSubject from the_setsubj inner join the_order on the_setsubj.acWarehouse = the_order.acWarehouse


SELECT acDocType
FROM the_move
WHERE acDocType='1100'

