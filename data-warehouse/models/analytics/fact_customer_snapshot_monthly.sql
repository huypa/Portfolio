WITH 
  dim_date AS (
    SELECT DISTINCT year_month
    FROM {{ref('dim_date')}}  
)
, dim_customer__info AS (
    SELECT DISTINCT Customer_id
    FROM {{ref('dim_customer')}} 
)
, dim_month_with_customer AS (
    SELECT 
      dim_date.Year_month
      , dim_customer_info.Customer_id
    FROM dim_date
    CROSS JOIN dim_customer__info 
)
, dim_customer_attribuate__caculate AS (
    select 
      date_trunc(order_date,month) as year_month
      , Customer_id
      , sum(Gross_amount) as Sales_amount
    FROM {{ref('fact_sales_order_line')}}   
    group by 1,2
)
, dim_month_and_customer__join as (
    select 
        dim_month.year_month
        , dim_month.Customer_id
        , coalesce(dim_customer_attribute.Sales_amount,0) as Sales_amount
    from dim_month_with_customer as dim_month
    left join  dim_customer_attribuate__caculate as dim_customer_attribute using (Year_month,Customer_id)
)
, fact_customer_snapshot__with_percentile_and_LM as (
    select
        year_month
        , Customer_id
        , Sales_amount
        , Lifetime_sales_amount
        , Sales_amount_percentile
        , Previous_sales_amount
        , Previous_year_month
        , percent_rank() over (partition by year_month order by Lifetime_sales_amount asc) as Lifetime_sales_amount_percentile
    from (
          select
              year_month
              , Customer_id
              , Sales_amount
              , sum(Sales_amount) over (partition by Customer_id order by year_month asc rows between unbounded preceding and current row ) as Lifetime_sales_amount
              --, sum(Sales_amount) over (partition by Customer_id order by year_month asc rows between 12 preceding and current row ) as L12M_sales_amount             
          -- define cac chi so lien quan toi LM
              , percent_rank() over (partition by year_month order by Sales_amount asc) as sales_amount_percentile
              , lag(Sales_amount,1) over (partition by Customer_id order by year_month asc) as Previous_sales_amount
              , lag(year_month,1) over (partition by Customer_id order by year_month asc) as Previous_year_month
          from dim_month_and_customer__join
          )
)
, fact_customer_snapshot__segment as (
    select
        year_month
        , Customer_id
        , Sales_amount
        , case when sales_amount_percentile < 0.3 then 'Low'
            when sales_amount_percentile between 0.3 and 0.7 then 'Medium'
            when sales_amount_percentile > 0.7 then 'High'
            else 'Invalid' 
          end as Monetary_segment
        , Lifetime_sales_amount
        , case when Lifetime_sales_amount_percentile < 0.3 then 'Low'
            when Lifetime_sales_amount_percentile between 0.3 and 0.7 then 'Medium'
            when Lifetime_sales_amount_percentile > 0.7 then 'High'
            else 'Invalid' 
          end as Lifetime_monetary_segment
        , case when date_diff(Year_month,Previous_year_month,month) = 1 then Previous_sales_amount
          end as LM_sales_amount
    from fact_customer_snapshot__with_percentile_and_LM
)
, fact_customer_snapshot__caculate_L12 as (
    select
        A.Year_month
        , A.Customer_id
        , A.Sales_amount 
        , A.LM_sales_amount
        , A.Monetary_segment
        , A.Lifetime_sales_amount
        , B.Sales_amount AS Previous_Sales_amount
        , A.Lifetime_monetary_segment
      -- , B.Year_month AS Previous_Year_month
      --  , DATE_DIFF(A.year_month,B.year_month,month) AS DIFF
    from fact_customer_snapshot__segment AS A
    left join fact_customer_snapshot__segment AS B ON A.Customer_id = B.Customer_id AND DATE_DIFF(A.year_month,B.year_month,month) between 0 and 12
)
, fact_customer_snapshot as (
    select 
        Year_month
        , Customer_id
        , Sales_amount 
        , Monetary_segment
        , LM_sales_amount
        , Lifetime_sales_amount
        , Lifetime_monetary_segment
        , sum(Previous_Sales_amount) as L12M_sales_amount
    from fact_customer_snapshot__caculate_L12 as A
    group by 1,2,3,4,5,6,7
)
select 
    Year_month
    , Customer_id
    , Sales_amount 
    , Monetary_segment
    , LM_sales_amount
    , Lifetime_sales_amount
    , Lifetime_monetary_segment 
    , L12M_sales_amount
from fact_customer_snapshot