with dim_customer__source as (
  select  
  *
  from `vit-lam-data.wide_world_importers.sales__customers`
)
, dim_customer__rename_cast as (
select distinct 
   cast(customer_id as int ) as customer_key
  ,cast(customer_id as int ) as customer_id
  , cast(customer_name as string ) as customer_name
  , cast(phone_number as string ) as phone_number
  , cast(bill_to_customer_id as int) as bill_to_customer_key
  , cast(account_opened_date as date ) as Account_Opened_Date
  , cast(standard_discount_percentage as numeric ) as Standard_Discount_Percentage
  , cast(customer_category_id as int ) as customer_category_key
  , cast(buying_group_id as int ) as buying_group_key
  , cast(Primary_Contact_Person_ID as int ) as primary_contact_person_key
  , cast(Alternate_Contact_Person_ID as int ) as alternate_contact_person_key
  , cast(Delivery_Method_ID as int ) as delivery_method_key
  , cast(Delivery_City_ID as int ) as delivery_city_key
  , case when is_statement_sent is true then 'On statement sent'
         when is_statement_sent is false then "Not on statement sent"
         when is_statement_sent is null then "Undefined"
         else "Invalid" 
    end as is_statement_sent
  , case when is_on_credit_hold is true then 'On credit hold'
         when is_on_credit_hold is false then "Not on credit hold"
         when is_on_credit_hold is null then "Undefined"
         else "Invalid" 
    end as is_on_credit_hold
from dim_customer__source
)
, dim_customer__final as (
select distinct 
    coalesce(customer_key,0) as customer_key
  , coalesce(customer_id,0) as customer_id
  , coalesce(customer_category_key,0) as customer_category_key
  , coalesce(bill_to_customer_key ,0) as bill_to_customer_key
  , coalesce(buying_group_key,0) as buying_group_key
  , coalesce(primary_contact_person_key,0) as primary_contact_person_key
  , coalesce(alternate_contact_person_key,0) as alternate_contact_person_key
  , coalesce(delivery_method_key,0) as delivery_method_key
  , coalesce(delivery_city_key,0) as delivery_city_key
  , customer_name
  , phone_number
  , Account_Opened_Date
  , Standard_Discount_Percentage
  , is_statement_sent
  , is_on_credit_hold
from dim_customer__rename_cast
)
select 
  dim_customer_membership.Customer_key
  , dim_customer_membership.Begin_effective_date
  , dim_customer_membership.End_effective_date
  , dim_customer_membership.Membership
  , dim_customer.Customer_id
  , dim_customer.Customer_name 
  , dim_customer.Phone_number
  , dim_customer.Bill_to_customer_key
  , dim_customer.Is_on_credit_hold  
  , dim_customer.Account_Opened_Date 
  , dim_customer.Standard_Discount_Percentage 
  , dim_customer.Customer_category_key
  , coalesce(dim_customer_category.customer_category_name,"Invalid") as Customer_category_name
  , dim_customer.Buying_group_key
  , coalesce(dim_buying_group.buying_group_name,"Invalid") as Buying_group_name
  , dim_customer.Is_statement_sent 
  , dim_customer.Delivery_method_key 
  , coalesce(dim_delivery_method.Delivery_method_name ,"Invalid") as Delivery_method_name
  , dim_customer.delivery_city_key as Delivery_city_key 
  , coalesce(dim_delivery_city.city_name,"Invalid") as Delivery_city_name 
  , coalesce(dim_delivery_city.province_name,"Invalid") as Delivery_province_name
  , coalesce(dim_delivery_city.countries_name,"Invalid") as Delivery_countries_name
  , dim_customer.primary_contact_person_key as Primary_contact_person_key
  , coalesce(dim_primary_contact_person.full_name,"Invalid") as Primary_contact_full_name
from dim_customer__final as dim_customer 
left join {{ ref('stg_dim_customer_category') }} as dim_customer_category 
  on dim_customer.customer_category_key = dim_customer_category.customer_category_key
left join {{ref('stg_dim_buying_group')}} as dim_buying_group 
  on dim_customer.buying_group_key = dim_buying_group.buying_group_key
left join {{ref('stg_dim_delivery_method')}} as dim_delivery_method on dim_delivery_method.delivery_method_key = dim_customer.delivery_method_key
left join {{ref('stg_dim_city')}} as dim_delivery_city on dim_delivery_city.city_key = dim_customer.delivery_city_key
left join {{ref('dim_person')}} as dim_primary_contact_person on dim_primary_contact_person.person_key = dim_customer.primary_contact_person_key
left join {{ref('dim_customer_membership')}} as dim_customer_membership on dim_customer_membership.customer_id = dim_customer.customer_id
--- key lay tu goc, coalesce valid vs undefined, personkey, rename: city vs person theo tien to 