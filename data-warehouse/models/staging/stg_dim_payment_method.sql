with dim_payment_method__source as (
  select * 
  from `vit-lam-data.wide_world_importers.application__payment_methods`
)
, dim_payment_method__rename_cast as (
  select
    cast(payment_method_id as int) as payment_method_key
    , cast(payment_method_name as string) as payment_method_name
  from dim_payment_method__source
)
select 
  coalesce(payment_method_key,0 ) as payment_method_key
  , coalesce(payment_method_name,"Undefined" ) as payment_method_name
from dim_payment_method__rename_cast
group by 1,2