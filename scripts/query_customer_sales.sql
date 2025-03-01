with sales as (
select 
    sale_id,
    customer_id,
    amount,
    sale_date
from 
    S3Source.raw."sales.csv"
),
customers as (
select 
    customer_id,
    customer_name
from
    S3Source.raw."customers.csv"
),
joined as (
select 
    c.customer_id,
    c.customer_name,
    s.amount,
    s.sale_date
from 
    sales s
    inner join customers c on s.customer_id = c.customer_id
)
select * from joined
