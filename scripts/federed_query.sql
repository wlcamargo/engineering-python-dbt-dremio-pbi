select 
    d.name,
    c.customer_name
from 
    Postgres.humanresources.department d 
    inner join "@dremio".inter."inter_customers" c on d.departmentid = c.customer_id
