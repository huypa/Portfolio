SELECT  
*

, category_key as category_level_1_key
, category_name as category_level_1_name

, 0 as category_level_2_key
, "Undefined" as category_level_2_name

, 0 as category_level_3_key
, "Undefined" as category_level_3_name

, 0 as category_level_4_key
, "Undefined" as category_level_4_name
FROM {{ ref('stg_dim_category') }} 
where category_level = 1

UNION ALL 

SELECT  
*

, parent_category_key as category_level_1_key
, parent_category_name as category_level_1_name

, category_key as category_level_2_key
, category_name as category_level_2_name

, 0 as category_level_3_key
, "Undefined" as category_level_3_name

, 0 as category_level_4_key
, "Undefined" as category_level_4_name
FROM {{ ref('stg_dim_category') }} 
where category_level = 2 

UNION ALL 

SELECT  
dim_level_3.*

, dim_level_2.parent_category_key as category_level_1_key
, dim_level_2.parent_category_name as category_level_1_name

, dim_level_3.parent_category_key as category_level_2_key
, dim_level_3.parent_category_name as category_level_2_name

, dim_level_3.category_key as category_level_3_key
, dim_level_3.category_name as category_level_3_name

, 0 as category_level_4_key
, "Undefined" as category_level_4_name
FROM {{ ref('stg_dim_category') }} as dim_level_3
LEFT JOIN {{ ref('stg_dim_category') }} as dim_level_2 
on dim_level_3.parent_category_key = dim_level_2.category_key
    where dim_level_3.category_level = 3

UNION ALL 

SELECT  
dim_level_4.*

, dim_level_2.parent_category_key as category_level_1_key
, dim_level_2.parent_category_name as category_level_1_name

, dim_level_3.parent_category_key as category_level_2_key
, dim_level_3.parent_category_name as category_level_2_name

, dim_level_4.parent_category_key as category_level_3_key
, dim_level_4.parent_category_name as category_level_3_name

, dim_level_4.category_key as category_level_4_key
, dim_level_4.category_name as category_level_4_name

FROM {{ ref('stg_dim_category') }} as dim_level_4
LEFT JOIN {{ ref('stg_dim_category') }} as dim_level_3 
on dim_level_4.parent_category_key = dim_level_3.category_key
LEFT JOIN {{ ref('stg_dim_category') }} as dim_level_2
on dim_level_3.parent_category_key = dim_level_2.category_key
    where dim_level_4.category_level = 4
