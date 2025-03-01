with source as (
select 
    cast(sale_id as int) as sale_id,
    cast(customer_id as int) as customer_id,
    cast(amount as decimal(10,2)) as amount,
    cast(sale_date as date) as sale_date
from S3Source.raw."sales.csv"
)
select * from source
