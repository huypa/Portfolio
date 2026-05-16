with dim_product__source as (
  select * 
  from `vit-lam-data.wide_world_importers.warehouse__stock_items` 
)
, dim_product__rename_cast as (
SELECT  
  cast(stock_item_id as int ) as product_key
  , cast(stock_item_name as string ) as  product_name
  , cast(brand as string ) as  brand_name 
  , cast(size as string ) as  size 
  , cast(color_id as int) as colour_key
  , cast(unit_package_id as int) as unit_package_type_key
  , cast(outer_package_id as int) as outer_package_type_key
  , cast(supplier_id as int) as supplier_key
  , cast(is_chiller_stock as boolean) as is_chiller_stock
  , cast(unit_price as int) as unit_price
  , cast(quantity_per_outer as int) as quantity_per_outer
  , cast(typical_weight_per_unit as int) as typical_weight_per_unit
  , cast(barcode as string) as bar_code
  , cast(lead_time_days as int) as lead_time_days  
FROM dim_product__source
)
, dim_product__final as (
SELECT  
  * except(is_chiller_stock,size,brand_name,product_name,product_key,colour_key,unit_package_type_key,outer_package_type_key,supplier_key)
  , coalesce(product_key,0) as product_key
  , coalesce(colour_key,0) as colour_key
  , coalesce(unit_package_type_key,0) as unit_package_type_key
  , coalesce(outer_package_type_key,0) as outer_package_type_key
  , coalesce(supplier_key,0) as supplier_key
  , coalesce(size,'Undefined') as size
  , coalesce(brand_name,'Undefined') as brand_name 
  , coalesce(product_name,'Undefined') as product_name
  , case when is_chiller_stock is true then "Chiller_stock"
         when is_chiller_stock is false then "Non chillder stock"
         when is_chiller_stock is null then "Undefined"
         else "Invalid"
    end as is_chiller_stock -- sua chiller thanh string
FROM dim_product__rename_cast
)
select distinct
  dim_product.Product_key
  , dim_product.Product_name
  , coalesce(dim_product.brand_name,"Undefined") as Brand_name
  , dim_product.Size
  , dim_product.Is_chiller_stock
  , dim_product.Unit_price
  , dim_product.Quantity_per_outer
  , dim_product.Typical_weight_per_unit
  , dim_product.Bar_code
  , dim_product.Lead_time_days
  , dim_product.unit_package_type_key as Unit_Package_type_key
  , coalesce(dim_unit_package_type.package_type_name ,"Invalid") as  Unit_Package_type_name
  , dim_product.outer_package_type_key as Outer_Package_type_key
  , coalesce(dim_outer_package_type.package_type_name ,"Invalid") as  Outer_Package_type_name
  , dim_product.Colour_key
  , coalesce(dim_colour.Colour_name ,"Invalid") as Colour_name
  , dim_product.Supplier_key
  , coalesce(dim_supplier.supplier_name,"Invalid") as Supplier_name
  , coalesce(dim_supplier.Supplier_category_key,-1) as Supplier_category_key
  , coalesce(dim_supplier.Supplier_category_name ,"Invalid") as Supplier_category_name
  , coalesce(dim_supplier.Delivery_method_key,-1) as Delivery_method_key
  , coalesce(dim_supplier.Delivery_method_name ,"Invalid") as Delivery_method_name
  , coalesce(dim_supplier.Delivery_city_key,-1) as Delivery_city_key
  , coalesce(dim_supplier.Delivery_city_name ,"Invalid") as Delivery_city_name
  , coalesce(dim_supplier.Delivery_province_name,"Invalid") as Delivery_province_name
  , coalesce(dim_supplier.Delivery_countries_name,"Invalid") as Delivery_countries_name
  , coalesce(dim_product_external.category_key,-1) as category_key
  , coalesce(dim_category.category_level,-1) as category_level
  , coalesce(dim_category.category_name,"Invalid") as category_name
  , coalesce(dim_category.parent_category_key,-1) as parent_category_key
  , coalesce(dim_category.parent_category_name,"Invalid") as parent_category_name

  , coalesce(dim_category.category_level_1_key,-1) as category_level_1_key
  , coalesce(dim_category.category_level_1_name,"Invalid") as category_level_1_name
  , coalesce(dim_category.category_level_2_key,-1) as category_level_2_key
  , coalesce(dim_category.category_level_2_name,"Invalid") as category_level_2_name
  , coalesce(dim_category.category_level_3_key,-1) as category_level_3_key
  , coalesce(dim_category.category_level_3_name,"Invalid") as category_level_3_name
  , coalesce(dim_category.category_level_4_key,-1) as category_level_4_key
  , coalesce(dim_category.category_level_4_name,"Invalid") as category_name_level_4_name

from dim_product__final as dim_product
left join {{ref('dim_supplier')}} as dim_supplier 
  on dim_product.supplier_key = dim_supplier.supplier_key
left join {{ref('stg_dim_package_type')}} as dim_unit_package_type
  on dim_product.unit_package_type_key = dim_unit_package_type.package_type_key
left join {{ref('stg_dim_package_type')}} as dim_outer_package_type
  on dim_product.outer_package_type_key = dim_outer_package_type.package_type_key
left join {{ref('stg_dim_colour')}} as dim_colour
  on dim_product.colour_key = dim_colour.colour_key
left join {{ref('stg_dim_product_external')}} as dim_product_external
  on dim_product_external.product_key = dim_product.product_key
left join {{ref('dim_category')}} as dim_category
  on dim_category.category_key = dim_product_external.category_key
