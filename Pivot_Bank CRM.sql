with CTE1 as (select a.customer_id, a.amount, c.segment, p.prod_ca, p.prod_td, p.prod_credit_card, p.prod_app, p.prod_secured_loan, p.prod_upl
from aum a
join cust c on a.customer_id = c.customer_id
join prod_holding p on p.customer_id = a.customer_id)
select 'TotalAmount' as Amount,
	   sum(case when prod_ca=1 then amount else 0 end) as prod_ca,
	   sum(case when prod_td=1 then amount else 0 end) as prod_td,
	   sum(case when prod_credit_card=1 then amount else 0 end) as prod_credit_card,
	   sum(case when prod_app=1 then amount else 0 end) as prod_app,
	   sum(case when prod_secured_loan=1 then amount else 0 end) as prod_secured_loan,
	   sum(case when prod_upl=1 then amount else 0 end) as prod_upl
from CTE1
union
select 'AvgAmount' as Amount,
	   avg(case when prod_ca=1 then amount end) as prod_ca,
	   avg(case when prod_td=1 then amount end) as prod_td,
	   avg(case when prod_credit_card=1 then amount end) as prod_credit_card,
	   avg(case when prod_app=1 then amount end) as prod_app,
	   avg(case when prod_secured_loan=1 then amount end) as prod_secured_loan,
	   avg(case when prod_upl=1 then amount end) as prod_upl
from CTE1