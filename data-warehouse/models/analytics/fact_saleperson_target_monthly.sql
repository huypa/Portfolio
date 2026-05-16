--- source -> recast -> sum --> join --> caculate_and_define_user
with fact_sale_order_line__source as (
  select 
    order_date
    , Salesperson_person_key
    , Net_amount
  from {{ref('fact_sales_order_line')}} 
) 
, fact_sale_order_line__recast as (
  select 
    date_trunc (order_date,month) as year_month
    , cast(Salesperson_person_key as int ) as salesperson_person_key
    , cast(Net_amount as numeric ) as Actual_revenue
  from fact_sale_order_line__source
)
, fact_saleperson_target_monthly_actual as (
  select 
    year_month
    , salesperson_person_key
    , sum(Actual_revenue) as Actual_revenue
  from fact_sale_order_line__recast
  group by 1,2
)
, fact_saleperson_target_monthly_full_join as (
  select 
    coalesce(fact_actual.year_month,fact_target.year_month ) as year_month
    , coalesce(fact_actual.salesperson_person_key,fact_target.salesperson_person_key) as salesperson_person_key
    , coalesce(fact_actual.Actual_revenue,0) as Actual_revenue
    , coalesce(fact_target.Target_revenue,0) as Target_revenue
  from fact_saleperson_target_monthly_actual fact_actual
  full outer join {{ref('stg_fact_sale_target_by_person')}} as fact_target 
    on fact_actual.year_month = fact_target.year_month 
    and fact_actual.salesperson_person_key = fact_target.salesperson_person_key
) 
, fact_saleperson_target_monthly_validation as (
  select 
    year_month
    , salesperson_person_key
    , Actual_revenue
    , Target_revenue
    , round(Actual_revenue * 100 / Target_revenue , 1 ) as Achievement_pct
    , case when Actual_revenue / nullif(Target_revenue,0) > 0.8 then 'Achieved'
           when Actual_revenue / nullif(Target_revenue,0) < 0.8 then 'Not Achieved'
      else 'Invalid' 
      end as Is_achieved 
    , case when (Target_revenue is null or  salesperson_person_key is null ) then 'Invalid Saleperson Data'
      else 'Valid Saleperson Data'
      end as Is_valid_saleperson_data
  from fact_saleperson_target_monthly_actual
)
select 
    year_month
    , salesperson_person_key
    , Actual_revenue
    , Target_revenue
    , Achievement_pct
    , Is_achieved 
    , Is_valid_saleperson_data
from fact_saleperson_target_monthly_validation