toc.dat                                                                                             0000600 0004000 0002000 00000010665 14405266117 0014455 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           {            node_js #   13.5 (Ubuntu 13.5-0ubuntu0.21.04.1) #   13.5 (Ubuntu 13.5-0ubuntu0.21.04.1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    17070    node_js    DATABASE     \   CREATE DATABASE node_js WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE node_js;
                postgres    false         �            1259    26527 	   resources    TABLE     �   CREATE TABLE public.resources (
    id integer NOT NULL,
    name character varying,
    price character varying,
    "createdAt" timestamp without time zone,
    "updatedAt" timestamp without time zone
);
    DROP TABLE public.resources;
       public         heap    postgres    false         �            1259    26525    resources_id_seq    SEQUENCE     �   CREATE SEQUENCE public.resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.resources_id_seq;
       public          postgres    false    203         �           0    0    resources_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.resources_id_seq OWNED BY public.resources.id;
          public          postgres    false    202         �            1259    26514    users    TABLE     T  CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(250),
    last_name character varying(250),
    email character varying(250),
    password character varying(250),
    role character varying(250),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false         �            1259    26512    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    201         �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    200         Q           2604    26530    resources id    DEFAULT     l   ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.resources_id_seq'::regclass);
 ;   ALTER TABLE public.resources ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203         O           2604    26517    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201         �          0    26527 	   resources 
   TABLE DATA           N   COPY public.resources (id, name, price, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    203       3033.dat �          0    26514    users 
   TABLE DATA           k   COPY public.users (id, first_name, last_name, email, password, role, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    201       3031.dat �           0    0    resources_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.resources_id_seq', 9, true);
          public          postgres    false    202         �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
          public          postgres    false    200         S           2606    26523    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201                                                                                   3033.dat                                                                                            0000600 0004000 0002000 00000000276 14405266117 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	first one	100	2023-03-14 19:46:41.6	2023-03-14 19:46:41.603
4	first one	100	2023-03-14 19:58:55.2	2023-03-14 19:58:55.205
9	an one	100	2023-03-14 20:02:02.114	2023-03-14 20:02:02.116
\.


                                                                                                                                                                                                                                                                                                                                  3031.dat                                                                                            0000600 0004000 0002000 00000001010 14405266117 0014236 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	ddd	asd	gujrat@gmail.com	$2b$10$U5rWo.lOYqPgxytbJVd3buEpP/vy1aKeu/0MAyShR87Q0k4VvHheG	admin	2022-12-17 14:26:38.782121	\N
2	test	test	test@gmail.com	$2b$10$B8T52.T4mPcLcPUJPQznp.Foe7OJuCxoaSVK8hckwi7wiz4VqmtkS	customer	2022-12-17 14:40:26.383784	\N
3	test123	asfasf	asfa@gmail.com	$2b$10$K1Tpm/JdfOMY/8zlhW8SlOQabQD77i8FeC1Vjuv.dAF9T227wo.P.	customer	2022-12-17 16:14:31.710437	\N
4	hello	sfsdf	kawep40385@rxcay.com	$2b$10$LKMbrCUr7QSKt0Pj98Qkyey/taMcF01QnXprqtTThkYe0QNBDr5Lq	admin	2022-12-17 16:19:44.487833	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        restore.sql                                                                                         0000600 0004000 0002000 00000010452 14405266117 0015374 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-0ubuntu0.21.04.1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-0ubuntu0.21.04.1)

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

DROP DATABASE node_js;
--
-- Name: node_js; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE node_js WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE node_js OWNER TO postgres;

\connect node_js

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
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    id integer NOT NULL,
    name character varying,
    price character varying,
    "createdAt" timestamp without time zone,
    "updatedAt" timestamp without time zone
);


ALTER TABLE public.resources OWNER TO postgres;

--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_id_seq OWNER TO postgres;

--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resources_id_seq OWNED BY public.resources.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(250),
    last_name character varying(250),
    email character varying(250),
    password character varying(250),
    role character varying(250),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
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
-- Name: resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.resources_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resources (id, name, price, "createdAt", "updatedAt") FROM stdin;
\.
COPY public.resources (id, name, price, "createdAt", "updatedAt") FROM '$$PATH$$/3033.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, email, password, role, "createdAt", "updatedAt") FROM stdin;
\.
COPY public.users (id, first_name, last_name, email, password, role, "createdAt", "updatedAt") FROM '$$PATH$$/3031.dat';

--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resources_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      