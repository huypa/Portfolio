with dim_product__source as (
    SELECT 
      *
    FROM `vit-lam-data.wide_world_importers.external__stock_item`
)
, dim_product__rename_cast as (
    SELECT 
      cast(stock_item_id  as int ) as product_key 
      , cast(category_id as int ) as category_key
    FROM dim_product__source
    union all 
    SELECT 
        0 as product_key
      , 0 as category_key
    union all 
    SELECT 
        -1 as product_key
      , -1 as category_key
)
SELECT 
    product_key
    , category_key
FROM dim_product__rename_cast as dim_category
