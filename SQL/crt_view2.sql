select sa2.sa2_5dig11, sa2.sa2_name11, 
(
select cc.parent_category_code mining_code, cat.description mining_desc, min(cat.raw_value) mining_raw_value, round(avg(cat.value)) as mining_value
from category cc
inner join category_values cat on (cc.category_code = cat.category_code)
where cc.parent_category_code = 'MINING'
and cat.gid = sa2.gid
group by cat.gid, cc.parent_category_code, cat.description
)
from sa2_cutdown sa2 ;
