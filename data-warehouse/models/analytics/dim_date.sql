with dim_date_generate as (
SELECT
  d AS date,
  FORMAT_DATE('%A', d) AS day_of_week,
  FORMAT_DATE('%a', d) AS day_of_week_short,
  date_trunc(d,month) as year_month,
  EXTRACT(month FROM d) AS month,
  date_trunc(d,year) as year,
  EXTRACT(YEAR FROM d) AS year_number
FROM (
  SELECT
    *
  FROM
    UNNEST(GENERATE_DATE_ARRAY('2013-01-01', date_add(cast(current_date() as date ),interval 1 day), INTERVAL 1 DAY)) AS d )
)
, dim_date_generate_enrich as (
  SELECT 
  *
  , CASE WHEN day_of_week IN ('Sunday', 'Saturday') THEN "Weekend" 
         WHEN day_of_week IN ('Monday','Tuesday','Wednesday','Thursday','Friday') THEN "Weekday"
    ELSE 'Invalid' END AS is_weekday_or_weekend
  FROM dim_date_generate
)
SELECT DISTINCT * 
FROM dim_date_generate_enrich