with dim_delivery_source__source as (
  select * 
  from `vit-lam-data.wide_world_importers.application__delivery_methods`
)
, dim_delivery_source__rename_cast as (
  select
    cast(delivery_method_id as int) as delivery_method_key
    , cast(delivery_method_name as string) as delivery_method_name
  from dim_delivery_source__source
)
select 
  coalesce(delivery_method_key,0 ) as delivery_method_key
  , coalesce(delivery_method_name,"Undefined" ) as delivery_method_name
from dim_delivery_source__rename_cast
group by 1,2