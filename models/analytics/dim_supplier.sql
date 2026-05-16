with dim_supplier_source as (
SELECT 
  *
FROM `vit-lam-data.wide_world_importers.purchasing__suppliers`
)
, dim_supplier_rename_cast as (
SELECT 
    cast(supplier_id  as int ) as supplier_key
  , cast(supplier_name as string ) as supplier_name
  , cast(supplier_category_id  as int ) as supplier_category_key
  , cast(Primary_Contact_Person_ID as int ) as primary_contact_person_key
  , cast(Alternate_Contact_Person_ID as int ) as alternate_contact_person_key
  , cast(Delivery_Method_ID as int ) as delivery_method_key
  , cast(Delivery_City_ID as int ) as delivery_city_key
  , cast(Bank_account_name as string ) as Bank_account_name
  , cast(Bank_account_branch as string ) as Bank_account_branch
  , cast(Bank_account_code as string ) as Bank_account_code
  , cast(Bank_account_number as string ) as Bank_account_number
  , cast(Bank_international_code as string ) as Bank_international_code
  , cast(Phone_number as string ) as Phone_number
  , cast(Fax_Number as string ) as Fax_Number
FROM dim_supplier_source
)
SELECT DISTINCT 
    dim_supplier.Supplier_key
  , coalesce(dim_supplier.supplier_name,"Invalid") as Supplier_name
  , dim_supplier.Bank_account_name
  , dim_supplier.Bank_account_branch
  , dim_supplier.Bank_account_code
  , dim_supplier.Bank_account_number
  , dim_supplier.Bank_international_code
  , dim_supplier.Phone_number
  , dim_supplier.Fax_Number
  , dim_supplier_category.Supplier_category_key
  , dim_supplier_category.Supplier_category_name
  , dim_delivery_method.Delivery_method_key
  , dim_delivery_method.Delivery_method_name 
  , dim_city.city_key as Delivery_city_key 
  , dim_city.city_name as Delivery_city_name 
  , dim_city.province_name as Delivery_province_name
  , dim_city.countries_name as Delivery_countries_name
  , dim_people1.person_key as Primary_contact_person_key
  , dim_people1.full_name as Primary_contact_full_name
  , dim_people2.person_key as Alternate_contact_person_key
  , dim_people2.full_name as Alternate_contact_full_name
FROM dim_supplier_rename_cast as dim_supplier
left join {{ref('stg_dim_supplier_category')}} as dim_supplier_category on dim_supplier_category.supplier_category_key = dim_supplier.supplier_category_key
left join {{ref('stg_dim_delivery_method')}} as dim_delivery_method on dim_delivery_method.delivery_method_key = dim_supplier.delivery_method_key
left join {{ref('stg_dim_city')}} as dim_city on dim_city.city_key = dim_supplier.delivery_city_key
left join {{ref('dim_person')}} as dim_people1 on dim_people1.person_key = dim_supplier.primary_contact_person_key
left join {{ref('dim_person')}} as dim_people2 on dim_people2.person_key = dim_supplier.alternate_contact_person_key