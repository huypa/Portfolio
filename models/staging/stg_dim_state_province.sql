with dim_province__source as (
  select * 
  from `vit-lam-data.wide_world_importers.application__state_provinces` 
)
, dim_province__rename_cast as (
SELECT DISTINCT
  cast(state_province_id as int ) as province_key
  , cast(state_province_name as string ) as  province_name
  , cast(country_id as int ) as  countries_key
FROM dim_province__source
)
, dim_province__final as (
SELECT  *
FROM dim_province__rename_cast
)
select 
  coalesce(dim_province.province_key,0 ) as province_key
  , coalesce(dim_province.province_name,"Undefined" ) as province_name
  , coalesce(dim_countries.countries_name,"Undefined" ) as countries_name
from dim_province__final as dim_province
left join {{ref('stg_dim_countries')}} as dim_countries
  on dim_province.countries_key = dim_countries.countries_key
