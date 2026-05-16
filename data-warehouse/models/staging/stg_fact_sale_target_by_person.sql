with sale_person_target_source as (
SELECT 
  *
FROM `vit-lam-data.wide_world_importers.external__salesperson_target`
)
, sale_person_target_rename_cast as (
SELECT 
    cast(year_month  as date ) as year_month
  , cast(salesperson_person_id as int ) as salesperson_person_key
  , cast(target_revenue as numeric ) as target_revenue
FROM sale_person_target_source
)
SELECT 
  year_month
  , salesperson_person_key
  , target_revenue
FROM sale_person_target_rename_cast
GROUP BY 1,2,3