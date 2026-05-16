WITH Fact_purchase_order__source AS (
  SELECT 
  Fact_purchase_order.Purchase_order_id
  , Fact_purchase_order.Delivery_method_id
  , Fact_purchase_order.Contact_person_id
  , Fact_purchase_order.Expected_Delivery_Date
  , Fact_purchase_order.Is_Order_Finalized
  , Fact_purchase_order.Order_date
  FROM `vit-lam-data.wide_world_importers.purchasing__purchase_orders` as Fact_purchase_order
)

, Fact_purchase_order__recast as (
  SELECT 

    cast( Fact_purchase_order.Purchase_order_id as int ) as  Purchase_order_key
  , cast( Fact_purchase_order.contact_person_id as int ) as  Contact_person_key
  , cast( Fact_purchase_order.Delivery_method_id as int ) as Delivery_method_key
  , cast(Fact_purchase_order.Expected_Delivery_Date as date ) as Expected_Delivery_Date
  , cast(Fact_purchase_order.Is_Order_Finalized as boolean ) as Is_Order_Finalized
  , cast(Fact_purchase_order.Order_date as date ) as Order_date
  FROM Fact_purchase_order__source AS Fact_purchase_order
)

SELECT DISTINCT
  fact_purchase.Order_date
  , fact_purchase.Expected_Delivery_Date
  , fact_purchase.Is_Order_Finalized
  , Dim_delivery_method.Delivery_method_name
  , Fact_supplier_transaction.Supplier_name
  , Fact_supplier_transaction.Transaction_type_name
  , Fact_supplier_transaction.Payment_method_name
  , dim_contact_person.full_name AS Contact_person_name
  , fact_purchase.Purchase_order_key
  , fact_purchase.Delivery_method_key
  , fact_purchase.Contact_person_key
FROM Fact_purchase_order__recast as fact_purchase
LEFT JOIN {{ref('dim_person')}} as dim_contact_person
    ON fact_purchase.contact_person_key = dim_contact_person.Person_key
LEFT JOIN {{ref('fact_supplier_transaction')}} as fact_supplier_transaction
    ON fact_purchase.Purchase_order_key = fact_supplier_transaction.Purchase_order_key
LEFT JOIN {{ref('stg_dim_delivery_method')}} as Dim_delivery_method
    ON fact_purchase.Delivery_method_key = Dim_delivery_method.Delivery_method_key
