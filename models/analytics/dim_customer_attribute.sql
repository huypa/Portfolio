WITH dim_customer_attribute_caculate AS (
select 
  Customer_id
  , sum(Gross_amount) as Lifetime_sales_amount
  , count(distinct Sales_order_key) as lifetime_sales_orders
  , sum(case when date_trunc(Order_date,month)='2016-04-01' then Gross_amount end ) as LM_sales_amount
  , count(distinct case when date_trunc(Order_date,month)='2016-04-01' then Sales_order_key end ) as LM_sales_orders
FROM {{ref('fact_sales_order_line')}}   
group by 1
)
, dim_customer_attribute_with_percentile as (
select
  Customer_id
  , Lifetime_sales_amount
  , lifetime_sales_orders
  , LM_sales_amount
  , LM_sales_orders 
  , percent_rank() over (order by Lifetime_sales_amount asc) as Lifetime_sales_amount_percentile
  , percent_rank() over (order by LM_sales_amount asc) as LM_sales_amount_percentile
from dim_customer_attribute_caculate
)
, dim_customer_attribute_with_segment as (
select 
  Customer_id
  , Lifetime_sales_amount
  , case when Lifetime_sales_amount_percentile < 0.3 then 'Low'
         when Lifetime_sales_amount_percentile between 0.3 and 0.7 then 'Medium'
         when Lifetime_sales_amount_percentile > 0.7 then 'High'
         else 'Invalid' 
    end as lifetime_monetary_segment
  , lifetime_sales_orders
  , LM_sales_amount
  , case when LM_sales_amount_percentile < 0.3 then 'Low'
         when LM_sales_amount_percentile between 0.3 and 0.7 then 'Medium'
         when LM_sales_amount_percentile > 0.7 then 'High'
         else 'Invalid' 
    end as LM_monetary_segment
  , LM_sales_orders 
from dim_customer_attribute_with_percentile
) 
select 
  Customer_key
  , Lifetime_sales_amount
  , lifetime_monetary_segment
  , lifetime_sales_orders
  , LM_sales_amount
  , LM_monetary_segment
  , LM_sales_orders 
from dim_customer_attribute_with_segment






/*
, dim_customer_attribute_with_segment as (
select 
  Customer_key
  , Lifetime_sales_amount
  , case when Lifetime_sales_amount_percentile < 0.3 then 'Low'
         when Lifetime_sales_amount_percentile between 0.3 and 0.7 then 'Medium'
         when Lifetime_sales_amount_percentile > 0.7 then 'High'
         else 'Invalid' 
    end as lifetime_monetary_segment
  , lifetime_sales_orders
  , LM_sales_amount
  , case when LM_sales_amount_percentile < 0.3 then 'Low'
         when LM_sales_amount_percentile between 0.3 and 0.7 then 'Medium'
         when LM_sales_amount_percentile > 0.7 then 'High'
         else 'Invalid' 
    end as LM_monetary_segment
  , LM_sales_orders 
from dim_customer_attribute_with_percentile
) 
select 
  Customer_key
  , Lifetime_sales_amount
  , lifetime_monetary_segment
  , lifetime_sales_orders
  , LM_sales_amount
  , LM_monetary_segment
  , LM_sales_orders 
from dim_customer_attribute_with_segment
*/
