with dim_customer_category__source as (
  select * 
  from `vit-lam-data.wide_world_importers.sales__customer_categories`
)
, dim_customer_category__rename_cast as (
  select
    cast(customer_category_id as int) as customer_category_key
    , cast(customer_category_name as string) as customer_category_name
  from dim_customer_category__source
)
select 
    coalesce(customer_category_key,0 ) as customer_category_key
  , coalesce(customer_category_name,"Undefined" ) as customer_category_name
from dim_customer_category__rename_cast
group by 1,2