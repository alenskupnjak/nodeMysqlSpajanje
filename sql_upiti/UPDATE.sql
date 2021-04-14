select anDaysForPayment, anMaxDaysPayDelay from vHE_SetSubj
select * from tHE_SetSubj
select * from atmp_unos


UPDATE tHE_SetSubj
SET anMaxDaysPayDelay = '30'
WHERE anDaysForPayment='0'


UPDATE THE_SetSubj
SET anMaxDaysPayDelay = '14'
WHERE anDaysForPayment<>'0' 


UPDATE atmp_Unos
SET c = ident
where 1=1


ALTER TABLE atmp_Unos
DROP COLUMN b
