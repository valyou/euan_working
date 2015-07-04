insert into category_values
(gid, category_code, description, raw_value, w_value, geom)
select gid, 'MINING', 'Description', random(), floor(random()*10), st_centroid(geom)
from sa2_cutdown;

