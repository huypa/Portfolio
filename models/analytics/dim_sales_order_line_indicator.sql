with dim_is_undersupply_backordered as (
  select  
  true as is_undersupply_backordered_boolean
  , 'Undersupply backordered' as  is_undersupply_backordered      
  union all 
    select  
    false as is_undersupply_backordered_boolean
    , 'Not Undersupply backordered' as  is_undersupply_backordered  
)
select distinct 
  dim_is_undersupply_backordered.is_undersupply_backordered_boolean
  , dim_is_undersupply_backordered.is_undersupply_backordered
  , dim_package_type.package_type_key 
  , dim_package_type.package_type_name
  , FARM_FINGERPRINT(concat(dim_is_undersupply_backordered.is_undersupply_backordered,',',dim_package_type.package_type_key)) as sales_order_line_indicator_key
from dim_is_undersupply_backordered
cross join `learn-dbt-379208.wide_world_importers_dwh_staging.stg_dim_package_type` as dim_package_type
order by  1,3