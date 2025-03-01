with source as (
select 
    cast(customer_id as int) as customer_id,
    cast(customer_name as varchar(50)) as customer_name
from S3Source.raw."customers.csv"
)
select * from source