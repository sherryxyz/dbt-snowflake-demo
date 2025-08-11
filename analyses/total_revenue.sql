select
    sum(amount) AS total_revenue
from {{ ref('stg_payments') }}
where status = 'success'