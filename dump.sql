--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: adresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adresses (
    id integer NOT NULL,
    subscription_id integer NOT NULL,
    name text NOT NULL,
    adress text NOT NULL,
    cep text NOT NULL,
    city text NOT NULL,
    state text NOT NULL
);


ALTER TABLE public.adresses OWNER TO postgres;

--
-- Name: adresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adresses_id_seq OWNER TO postgres;

--
-- Name: adresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adresses_id_seq OWNED BY public.adresses.id;


--
-- Name: dates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dates (
    id integer NOT NULL,
    date text NOT NULL
);


ALTER TABLE public.dates OWNER TO postgres;

--
-- Name: dates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dates_id_seq OWNER TO postgres;

--
-- Name: dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dates_id_seq OWNED BY public.dates.id;


--
-- Name: plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plans (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.plans OWNER TO postgres;

--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plans_id_seq OWNER TO postgres;

--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: sub_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_products (
    id integer NOT NULL,
    sub_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.sub_products OWNER TO postgres;

--
-- Name: sub_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sub_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_products_id_seq OWNER TO postgres;

--
-- Name: sub_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sub_products_id_seq OWNED BY public.sub_products.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    plan_id integer NOT NULL,
    date_id integer NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: adresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresses ALTER COLUMN id SET DEFAULT nextval('public.adresses_id_seq'::regclass);


--
-- Name: dates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dates ALTER COLUMN id SET DEFAULT nextval('public.dates_id_seq'::regclass);


--
-- Name: plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: sub_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_products ALTER COLUMN id SET DEFAULT nextval('public.sub_products_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: adresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adresses (id, subscription_id, name, adress, cep, city, state) FROM stdin;
\.


--
-- Data for Name: dates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dates (id, date) FROM stdin;
1	01
2	10
3	20
4	segunda
5	quarta
6	sexta
\.


--
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plans (id, name) FROM stdin;
1	semanal
2	mensal
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name) FROM stdin;
1	cha
2	incenso
3	produtos organicos
\.


--
-- Data for Name: sub_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_products (id, sub_id, product_id) FROM stdin;
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id, user_id, plan_id, date_id, date) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password) FROM stdin;
\.


--
-- Name: adresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adresses_id_seq', 5, true);


--
-- Name: dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dates_id_seq', 6, true);


--
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plans_id_seq', 2, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 3, true);


--
-- Name: sub_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sub_products_id_seq', 53, true);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 50, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 223, true);


--
-- Name: adresses adresses_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresses
    ADD CONSTRAINT adresses_pk PRIMARY KEY (id);


--
-- Name: dates dates_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dates
    ADD CONSTRAINT dates_date_key UNIQUE (date);


--
-- Name: dates dates_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dates
    ADD CONSTRAINT dates_pk PRIMARY KEY (id);


--
-- Name: plans plans_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_name_key UNIQUE (name);


--
-- Name: plans plans_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pk PRIMARY KEY (id);


--
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- Name: products products_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pk PRIMARY KEY (id);


--
-- Name: sub_products sub_products_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_products
    ADD CONSTRAINT sub_products_pk PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pk PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: adresses adresses_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresses
    ADD CONSTRAINT adresses_fk0 FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(id);


--
-- Name: sub_products sub_products_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_products
    ADD CONSTRAINT sub_products_fk0 FOREIGN KEY (sub_id) REFERENCES public.subscriptions(id);


--
-- Name: sub_products sub_products_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_products
    ADD CONSTRAINT sub_products_fk1 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: subscriptions subscriptions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_fk0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: subscriptions subscriptions_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_fk1 FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- Name: subscriptions subscriptions_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_fk2 FOREIGN KEY (date_id) REFERENCES public.dates(id);


--
-- PostgreSQL database dump complete
--

