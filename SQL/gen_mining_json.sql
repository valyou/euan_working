select json_agg(row_to_json(row)) from
(
select gid, category_code, raw_value, value, st_x(geom) longitude, st_y(geom) latitude
from category_values
where category_code = 'MINING'
) row;

