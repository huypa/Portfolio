with fact_sales_order__source as (
  select *
  from `vit-lam-data.wide_world_importers.sales__orders`
)
, fact_sales_order__cast_type as (
select 
  cast(order_id as int) as sales_order_key
  , cast(customer_id as int) as customer_id
  , cast(picked_by_person_id as int) as picked_by_person_key   
  , cast(salesperson_person_id as int) as salesperson_person_key
  , cast(contact_person_id as int) as contact_person_key
  , cast(order_date as date ) as order_date
  , cast(expected_delivery_date as date ) as expected_delivery_date
  , cast(customer_purchase_order_number as string ) as customer_purchase_order_number	
  , cast(is_undersupply_backordered as boolean ) as is_undersupply_backordered
  , cast(Picking_Completed_When as timestamp ) as Order_picking_completed_when 
from fact_sales_order__source
)
, fact_sales_order__final as (
select distinct   
  sales_order_key
  , coalesce(customer_id,0) as customer_id
  , coalesce(salesperson_person_key,0) as salesperson_person_key
  , coalesce(contact_person_key,0) as contact_person_key
  , coalesce(picked_by_person_key,0) as picked_by_person_key
  , coalesce(customer_purchase_order_number,"Undefined" ) as customer_purchase_order_number
  , order_date
  , expected_delivery_date
  , case when is_undersupply_backordered is true then "Undersupply backordered"
         when is_undersupply_backordered is false then "No Undersupply backordered"
    else "Undefined"
    end as is_undersupply_backordered
  , order_picking_completed_when
from fact_sales_order__cast_type )

select distinct
  sales_order_key
  , customer_id
  , picked_by_person_key
  , salesperson_person_key
  , contact_person_key
  , customer_purchase_order_number
  , order_date
  , expected_delivery_date
  , is_undersupply_backordered
  , order_picking_completed_when
from fact_sales_order__final

