--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-04-08 14:24:08 +05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 24631)
-- Name: food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food (
    id bigint NOT NULL,
    name character varying(255),
    price integer NOT NULL,
    url character varying(255),
    image_url character varying(255),
    title character varying(255)
);


ALTER TABLE public.food OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24630)
-- Name: food_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.food_id_seq OWNER TO postgres;

--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 215
-- Name: food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_id_seq OWNED BY public.food.id;


--
-- TOC entry 3442 (class 2604 OID 24634)
-- Name: food id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food ALTER COLUMN id SET DEFAULT nextval('public.food_id_seq'::regclass);


--
-- TOC entry 3589 (class 0 OID 24631)
-- Dependencies: 216
-- Data for Name: food; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.food (id, name, price, url, image_url, title) VALUES (5, 'Plov', 2200, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Afghan_Palo.jpg/280px-Afghan_Palo.jpg', '/ff/ff-1.jpg', 'SANDERS MEGA BURGER');
INSERT INTO public.food (id, name, price, url, image_url, title) VALUES (3, 'Burger', 2100, 'https://images.immediate.co.uk/production/volatile/sites/30/2012/07/Multi-layered-cheese-burger-1a92a1c.jpg?quality=90&resize=556,505', '/ff/ff-2.png', 'DOUBLE CHEFBURGER SPICY');
INSERT INTO public.food (id, name, price, url, image_url, title) VALUES (1, 'Lavash', 2590, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Donner_Kebab%2C_Cologne%2C_Germany_%281057919169%29.jpg/1200px-Donner_Kebab%2C_Cologne%2C_Germany_%281057919169%29.jpg', '/ff/ff-3.jpg', 'DOUBLE CHEFBURGER');
INSERT INTO public.food (id, name, price, url, image_url, title) VALUES (2, 'Pizza', 1890, 'https://www.indianhealthyrecipes.com/wp-content/uploads/2015/10/pizza-recipe-1.jpg', '/ff/ff-4.png', 'CHEF TOWER SPICY');
INSERT INTO public.food (id, name, price, url, image_url, title) VALUES (4, 'Steak', 2500, 'https://www.howtocook.recipes/wp-content/uploads/2022/11/rare-steak-recipejpg-500x375.jpg', '/ff/ff-6.jpg', 'CHEFBURGER SPICY');
INSERT INTO public.food (id, name, price, url, image_url, title) VALUES (6, NULL, 2300, NULL, '/ff/ff-7.jpg', 'CHEFBURGER');
INSERT INTO public.food (id, name, price, url, image_url, title) VALUES (7, NULL, 2200, NULL, '/ff/ff-8.jpg', 'СHEESEBURGER');
INSERT INTO public.food (id, name, price, url, image_url, title) VALUES (9, NULL, 2600, NULL, '/ff/ff-10.jpg', 'TWISTER KEBAB');
INSERT INTO public.food (id, name, price, url, image_url, title) VALUES (10, NULL, 2900, NULL, '/ff/ff-11.jpg', 'BOXMASTER');
INSERT INTO public.food (id, name, price, url, image_url, title) VALUES (8, NULL, 200, NULL, '/ff/ff-9.jpg', 'ET KEREMET');
INSERT INTO public.food (id, name, price, url, image_url, title) VALUES (11, NULL, 50, NULL, '/ff/ff-12.jpg', 'I-TWISTER');


--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 215
-- Name: food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_id_seq', 11, true);


--
-- TOC entry 3444 (class 2606 OID 24638)
-- Name: food food_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_pkey PRIMARY KEY (id);


-- Completed on 2024-04-08 14:24:08 +05

--
-- PostgreSQL database dump complete
--

