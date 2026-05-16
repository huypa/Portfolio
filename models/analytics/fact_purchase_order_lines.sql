WITH Fact_purchase_order_lines__source AS (
  SELECT 
    Fact_purchase_order_lines.Purchase_Order_line_id
  , Fact_purchase_order_lines.Purchase_order_id
  , Fact_purchase_order_lines.Received_Outers
  , Fact_purchase_order_lines.Package_type_id
  , Fact_purchase_order_lines.Expected_Unit_Price_Per_Outer
  , Fact_purchase_order_lines.Last_Receipt_date
  , Fact_purchase_order_lines.Stock_Item_id
  , Fact_purchase_order_lines.is_order_line_finalized 
  FROM `vit-lam-data.wide_world_importers.purchasing__purchase_order_lines` as Fact_purchase_order_lines
)

, Fact_purchase_order_lines__recast as (
  SELECT 
    cast (Fact_purchase_order_lines.Purchase_Order_line_id as int ) as Purchase_Order_line_key 
  , cast (Fact_purchase_order_lines.Purchase_order_id as int ) as Purchase_order_key
  , cast (Fact_purchase_order_lines.Package_type_id as int ) as Package_type_key
  , cast (Fact_purchase_order_lines.Stock_Item_id  as int ) as product_key 
  , cast (Fact_purchase_order_lines.Expected_Unit_Price_Per_Outer as int ) as Expected_Unit_Price_Per_Outer 
  , cast (Fact_purchase_order_lines.Last_Receipt_date as date ) as Last_Receipt_date 
  , cast (Fact_purchase_order_lines.Received_Outers as int ) as Received_Outers 
  , cast (Fact_purchase_order_lines.is_order_line_finalized as boolean ) as Is_order_line_finalized 
  FROM Fact_purchase_order_lines__source AS Fact_purchase_order_lines
)
, Fact_purchase_order_lines__final as (
  SELECT 
  Purchase_Order_line_key
  , Purchase_order_key
  , Package_type_key
  , product_key
  , Expected_Unit_Price_Per_Outer
  , Last_Receipt_date
  , Received_Outers
  , case when Is_order_line_finalized is true then 'Is finalized'
         when Is_order_line_finalized is false then 'Is not finalized'
    else 'Undefined' end as Is_order_line_finalized
FROM Fact_purchase_order_lines__recast
)
SELECT DISTINCT
  fact_purchase_lines.Purchase_Order_line_key
  , fact_purchase_lines.Purchase_order_key
  , coalesce(fact_purchase_order.Order_date,'Invalid') as Order_date
  , coalesce(fact_purchase_order.Delivery_method_name,'Invalid') as Delivery_method_name
  , coalesce(fact_purchase_order.Supplier_name,'Invalid') as Supplier_name
  , coalesce(dim_package_type.Package_type_name, 'Invalid') as Package_type_name
  , coalesce(fact_purchase_order.Transaction_type_name,'Invalid') as Transaction_type_name
  , coalesce(fact_purchase_order.Payment_method_name,'Invalid') as Payment_method_name
  , coalesce(fact_purchase_order.Contact_person_name,'Invalid') as Contact_person_name
  , coalesce(fact_purchase_order.Is_order_finalized,'Invalid') as Is_order_finalized
  , fact_purchase_lines.Is_order_line_finalized
  , fact_purchase_lines.Received_Outers
  , fact_purchase_lines.Expected_Unit_Price_Per_Outer
  , coalesce(fact_purchase_order.Expected_Delivery_Date,'Invalid') as Expected_Delivery_Date
  , fact_purchase_lines.Last_Receipt_date
  , fact_purchase_lines.Package_type_key
  , fact_purchase_lines.product_key
FROM Fact_purchase_order_lines__final as fact_purchase_lines
LEFT JOIN {{ref('stg_dim_package_type')}} as Dim_package_type
    ON fact_purchase_lines.package_type_key = Dim_package_type.package_type_key
LEFT JOIN {{ref('fact_purchase_order')}} as Fact_purchase_order
    ON fact_purchase_lines.Purchase_order_key = Fact_purchase_order.Purchase_order_key
