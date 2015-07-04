DROP TABLE public.category_values;
DROP TABLE public.category;

CREATE TABLE public.category
(
   category_code character varying(20) NOT NULL primary key,
   description character varying(100) 
);
ALTER TABLE public.category OWNER TO ubuntu;

CREATE TABLE public.category_values
(
   gid integer NOT NULL references sa2_cutdown(gid), 
   category_code character varying(20) NOT NULL references category(category_code), 
   raw_value character varying(100), 
   description character varying(100), 
   w_value integer NOT NULL,
   geom geometry,
   primary key (gid, category_code)
);
ALTER TABLE public.category_values OWNER TO ubuntu;


INSERT INTO CATEGORY VALUES('MINING', 'The amount of mining activity occurring in the area');

