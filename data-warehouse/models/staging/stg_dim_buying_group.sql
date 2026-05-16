with dim_buying_group_source as (
  select * 
  from `vit-lam-data.wide_world_importers.sales__buying_groups`
)
, dim_buying_group_rename_cast as (
  select
    cast(buying_group_id as int) as buying_group_key
    , cast(buying_group_name as string) as buying_group_name
  from dim_buying_group_source
)
select 
    buying_group_key
    , buying_group_name
from dim_buying_group_rename_cast
group by 1,2