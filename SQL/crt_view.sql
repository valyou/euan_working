create view category_totals as
(
with
aboriginal as
(
select cat.gid, cc.parent_category_code category_code, cat.description, min(cat.raw_value) raw_value, round(avg(cat.value)) as value
from category cc
inner join category_values cat on (cc.category_code = cat.category_code)
where parent_category_code = 'ABORIGINAL'
group by cat.gid, cc.parent_category_code, cat.description
),
conservation as
(
select cat.gid, cc.parent_category_code category_code, cat.description, min(cat.raw_value) raw_value, round(avg(cat.value)) as value
from category cc
inner join category_values cat on (cc.category_code = cat.category_code)
where parent_category_code = 'CONSERVATION'
group by cat.gid, cc.parent_category_code, cat.description
),
ecology as
(
select cat.gid, cc.parent_category_code category_code, cat.description, min(cat.raw_value) raw_value, round(avg(cat.value)) as value
from category cc
inner join category_values cat on (cc.category_code = cat.category_code)
where parent_category_code = 'ECOLOGY'
group by cat.gid, cc.parent_category_code, cat.description
),
economy as
(
select cat.gid, cc.parent_category_code category_code, cat.description, min(cat.raw_value) raw_value, round(avg(cat.value)) as value
from category cc
inner join category_values cat on (cc.category_code = cat.category_code)
where parent_category_code = 'ECONOMY'
group by cat.gid, cc.parent_category_code, cat.description
),
energy as
(
select cat.gid, cc.parent_category_code category_code, cat.description, min(cat.raw_value) raw_value, round(avg(cat.value)) as value
from category cc
inner join category_values cat on (cc.category_code = cat.category_code)
where parent_category_code = 'ENERGY'
group by cat.gid, cc.parent_category_code, cat.description
),
mine as
(
select cat.gid, cc.parent_category_code category_code, cat.description, min(cat.raw_value) raw_value, round(avg(cat.value)) as value
from category cc
inner join category_values cat on (cc.category_code = cat.category_code)
where parent_category_code = 'MINING'
group by cat.gid, cc.parent_category_code, cat.description
),
population as
(
select cat.gid, cc.parent_category_code category_code, cat.description, min(cat.raw_value) raw_value, round(avg(cat.value)) as value
from category cc
inner join category_values cat on (cc.category_code = cat.category_code)
where parent_category_code = 'POPULATION'
group by cat.gid, cc.parent_category_code, cat.description
)
select sa2.sa2_5dig11, sa2.sa2_name11, 
aboriginal.category_code aboriginal_code, aboriginal.description aboriginal_desc, aboriginal.raw_value aboriginal_raw_value, aboriginal.value aboriginal_value,
conservation.category_code conservation_code, conservation.description conservation_desc, conservation.raw_value conservation_raw_value, conservation.value conservation_value,
ecology.category_code ecology_code, ecology.description ecology_desc, ecology.raw_value ecology_raw_value, ecology.value ecology_value,
economy.category_code economy_code, economy.description economy_desc, economy.raw_value economy_raw_value, economy.value economy_value,
energy.category_code energy_code, energy.description energy_desc, energy.raw_value energy_raw_value, energy.value energy_value,
mine.category_code mine_code, mine.description mine_desc, mine.raw_value mine_raw_value, mine.value mine_value,
population.category_code population_code, population.description population_desc, population.raw_value population_raw_value, population.value population_value
from sa2_cutdown sa2
left outer join aboriginal on (aboriginal.gid = sa2.gid)
left outer join conservation on (conservation.gid = sa2.gid)
left outer join ecology on (ecology.gid = sa2.gid)
left outer join economy on (economy.gid = sa2.gid)
left outer join energy on (energy.gid = sa2.gid)
left outer join mine on (mine.gid = sa2.gid)
left outer join population on (population.gid = sa2.gid)

);
