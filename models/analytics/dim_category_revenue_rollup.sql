select  
    Category_level_1_name as parent_category
    , category_name as child_category
    , min(category_level) over (partition by category_level_1_name) as parent_level
    , category_level as child_level
from {{ref('dim_category')}}
where Category_level_1_name <> 'Undefined'

 union all 

select  
    category_level_2_name as parent_category
    , category_name as child_category
    , min(category_level) over (partition by category_level_2_name) as parent_level
    , category_level as child_level
from {{ref('dim_category')}}
where Category_level_2_name <> 'Undefined'

 union all 

select  
    category_level_3_name as parent_category
    , category_name as child_category
    , min(category_level) over (partition by category_level_3_name) as parent_level
    , category_level as child_level
from {{ref('dim_category')}}
where Category_level_3_name <> 'Undefined'

 union all 

select  
    category_level_4_name as parent_category
    , category_name as child_category
    , min(category_level) over (partition by category_level_4_name) as parent_level
    , category_level as child_level
from {{ref('dim_category')}}
where Category_level_4_name <> 'Undefined'

