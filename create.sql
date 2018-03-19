CREATE DATABASE "Vynil_shop"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
    
CREATE SCHEMA public;

CREATE TABLE public."user"
(
    username text COLLATE pg_catalog."default" NOT NULL,
    id integer NOT NULL,
    rating real,
    CONSTRAINT user_pkey PRIMARY KEY (id),
    CONSTRAINT user_username_key UNIQUE (username),
    CONSTRAINT user_rating_check CHECK (0::double precision <= rating AND rating <= 5::double precision)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."user"
    OWNER to postgres;
    
CREATE TABLE public.record
(
    id integer NOT NULL,
    name text COLLATE pg_catalog."default",
    artist text COLLATE pg_catalog."default",
    year integer,
    CONSTRAINT record_pkey PRIMARY KEY (id),
    CONSTRAINT record_year_check CHECK (year > 1882)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.record
    OWNER to postgres;
    
CREATE TABLE public.genre
(
    id integer NOT NULL,
    genre text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genre_pkey PRIMARY KEY (id),
    CONSTRAINT genre_genre_key UNIQUE (genre)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.genre
    OWNER to postgres;
    
CREATE TABLE public.record_genre
(
    record_id integer NOT NULL,
    genre_id integer NOT NULL,
    CONSTRAINT record_genre_pkey PRIMARY KEY (record_id, genre_id),
    CONSTRAINT record_genre_genre_id_fkey FOREIGN KEY (genre_id)
        REFERENCES public.genre (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT record_genre_record_id_fkey FOREIGN KEY (record_id)
        REFERENCES public.record (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.record_genre
    OWNER to postgres;
    
CREATE TABLE public.record_wanted
(
    record_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT record_wanted_pkey PRIMARY KEY (user_id, record_id),
    CONSTRAINT record_wanted_record_id_fkey FOREIGN KEY (record_id)
        REFERENCES public.record (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT record_wanted_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.record_wanted
    OWNER to postgres;

CREATE TABLE public."Offer"
(
    offer_id integer NOT NULL,
    user_id integer NOT NULL,
    record_id integer NOT NULL,
    condition text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Offer_pkey" PRIMARY KEY (offer_id),
    CONSTRAINT "Offer_record_id_fkey" FOREIGN KEY (record_id)
        REFERENCES public.record (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Offer_user_id_fkey" FOREIGN KEY (user_id)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Offer"
    OWNER to postgres;

CREATE TABLE public."order"
(
    order_id integer NOT NULL,
    vynil_id integer NOT NULL,
    client integer NOT NULL,
    salesman integer NOT NULL,
    CONSTRAINT order_pkey PRIMARY KEY (order_id),
    CONSTRAINT order_client_fkey FOREIGN KEY (client)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT order_salesman_fkey FOREIGN KEY (salesman)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT order_vynil_id_fkey FOREIGN KEY (vynil_id)
        REFERENCES public.record (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT order_check CHECK (client <> salesman)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."order"
    OWNER to postgres;
