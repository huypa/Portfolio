with dim_transaction_types__source as (
  select * 
  from `vit-lam-data.wide_world_importers.application__transaction_types`
)
, dim_transaction_types__rename_cast as (
  select
    cast(transaction_type_id as int) as transaction_type_key
    , cast(transaction_type_name as string) as transaction_type_name
  from dim_transaction_types__source
)
select 
  coalesce(transaction_type_key,0 ) as transaction_type_key
  , coalesce(transaction_type_name,"Undefined" ) as transaction_type_name
from dim_transaction_types__rename_cast
group by 1,2