alter table category alter column category_code type character varying(40);
alter table category alter column parent_category_code type character varying(40);
alter table category add column weight float;

insert into category (category_code, parent_category_code, description)
select distinct commodity, 'MINING', commodity
from minedex;

update category set parent_category_code = 'ENERGY' where category_code = 'ENERGY';



