select  
    customer_id,
    customer_name,
    sum(amount) as sales_amount,
    current_timestamp() as last_update_date
from 
    {{ ref('mart_customer_sales') }}
group by 
    customer_id,
    customer_name