insert into category_values (gid, category_code, description, raw_value, value)
--select sa2.gid, 'ENERGY', 'Number of Mines', count(*), round((log(count(*)+1) * 100) / 3.82575058134803)
select sa2.gid, 'ENERGY', count(*) || ' plants in the area', count(*), round((log(count(*)+1) * 100) / 2.13987908640124)
from sa2_cutdown sa2
left outer join minedex min on (st_contains(sa2.geom, min.geom))
and commodity = 'ENERGY'
group by sa2.gid, sa2_main11, sa2_name11;
