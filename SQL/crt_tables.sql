DROP TABLE public.category_values;
DROP TABLE public.category;

CREATE TABLE public.category
(
   category_code character varying(20) NOT NULL primary key,
   parent_category_code character varying(20) NOT NULL references category(category_code),
   description character varying(100) 
);

CREATE TABLE public.category_values
(
   gid integer NOT NULL references sa2_cutdown(gid), 
   category_code character varying(20) NOT NULL references category(category_code), 
   raw_value character varying(200), 
   description character varying(200), 
   value integer NOT NULL,
   geom geometry,
   primary key (gid, category_code)
);


INSERT INTO CATEGORY VALUES('MINING', 'MINING', 'The amount of mining activity occurring in the area');
INSERT INTO CATEGORY VALUES('ENERGY', 'ENERGY', 'The amount of energy activity occurring in the area');
