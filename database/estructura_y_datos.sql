--
-- PostgreSQL database dump
--

\restrict UhpVn1muiCVp2eaO6LZwUwhrA8enazLVeA4KrPqf42SfWupGJ1hBboMTOjSwLZG

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

-- Started on 2026-06-29 01:13:25

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

--
-- TOC entry 2 (class 3079 OID 16748)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16627)
-- Name: cache; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration bigint NOT NULL
);


ALTER TABLE public.cache OWNER TO kevin1920;

--
-- TOC entry 223 (class 1259 OID 16635)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration bigint NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO kevin1920;

--
-- TOC entry 234 (class 1259 OID 16730)
-- Name: detalle_prestamo; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.detalle_prestamo (
    id_detalle integer NOT NULL,
    id_prestamo integer NOT NULL,
    id_material integer NOT NULL,
    cantidad integer NOT NULL,
    CONSTRAINT detalle_prestamo_cantidad_check CHECK ((cantidad > 0))
);


ALTER TABLE public.detalle_prestamo OWNER TO kevin1920;

--
-- TOC entry 233 (class 1259 OID 16729)
-- Name: detalle_prestamo_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: kevin1920
--

CREATE SEQUENCE public.detalle_prestamo_id_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detalle_prestamo_id_detalle_seq OWNER TO kevin1920;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 233
-- Name: detalle_prestamo_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kevin1920
--

ALTER SEQUENCE public.detalle_prestamo_id_detalle_seq OWNED BY public.detalle_prestamo.id_detalle;


--
-- TOC entry 228 (class 1259 OID 16661)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection character varying(255) NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO kevin1920;

--
-- TOC entry 227 (class 1259 OID 16660)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: kevin1920
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO kevin1920;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 227
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kevin1920
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 226 (class 1259 OID 16653)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO kevin1920;

--
-- TOC entry 225 (class 1259 OID 16644)
-- Name: jobs; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO kevin1920;

--
-- TOC entry 224 (class 1259 OID 16643)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: kevin1920
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO kevin1920;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 224
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kevin1920
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 238 (class 1259 OID 16799)
-- Name: materiales; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.materiales (
    id_material integer NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion text,
    cantidad_total integer NOT NULL,
    cantidad_disponible integer NOT NULL,
    ubicacion character varying(100),
    categoria character varying(50) NOT NULL,
    estado boolean DEFAULT true,
    CONSTRAINT materiales_cantidad_disponible_check CHECK ((cantidad_disponible >= 0)),
    CONSTRAINT materiales_cantidad_total_check CHECK ((cantidad_total >= 0))
);


ALTER TABLE public.materiales OWNER TO kevin1920;

--
-- TOC entry 237 (class 1259 OID 16798)
-- Name: materiales_id_material_seq; Type: SEQUENCE; Schema: public; Owner: kevin1920
--

CREATE SEQUENCE public.materiales_id_material_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materiales_id_material_seq OWNER TO kevin1920;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 237
-- Name: materiales_id_material_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kevin1920
--

ALTER SEQUENCE public.materiales_id_material_seq OWNED BY public.materiales.id_material;


--
-- TOC entry 217 (class 1259 OID 16594)
-- Name: migrations; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO kevin1920;

--
-- TOC entry 216 (class 1259 OID 16593)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: kevin1920
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO kevin1920;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 216
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kevin1920
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 220 (class 1259 OID 16611)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO kevin1920;

--
-- TOC entry 236 (class 1259 OID 16786)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name text NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO kevin1920;

--
-- TOC entry 235 (class 1259 OID 16785)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: kevin1920
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO kevin1920;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 235
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kevin1920
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 232 (class 1259 OID 16714)
-- Name: prestamos; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.prestamos (
    id_prestamo integer NOT NULL,
    id_usuario_encargado integer NOT NULL,
    matricula character varying(20) NOT NULL,
    nombre_solicitante character varying(150) NOT NULL,
    fecha_solicitud date NOT NULL,
    fecha_entrega date,
    estado character varying(20) DEFAULT 'Pendiente'::character varying NOT NULL,
    observaciones text,
    CONSTRAINT prestamos_estado_check CHECK (((estado)::text = ANY ((ARRAY['Pendiente'::character varying, 'Entregado'::character varying])::text[])))
);


ALTER TABLE public.prestamos OWNER TO kevin1920;

--
-- TOC entry 231 (class 1259 OID 16713)
-- Name: prestamos_id_prestamo_seq; Type: SEQUENCE; Schema: public; Owner: kevin1920
--

CREATE SEQUENCE public.prestamos_id_prestamo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prestamos_id_prestamo_seq OWNER TO kevin1920;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 231
-- Name: prestamos_id_prestamo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kevin1920
--

ALTER SEQUENCE public.prestamos_id_prestamo_seq OWNED BY public.prestamos.id_prestamo;


--
-- TOC entry 221 (class 1259 OID 16618)
-- Name: sessions; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO kevin1920;

--
-- TOC entry 219 (class 1259 OID 16601)
-- Name: users; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO kevin1920;

--
-- TOC entry 218 (class 1259 OID 16600)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: kevin1920
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO kevin1920;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kevin1920
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 230 (class 1259 OID 16674)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: kevin1920
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100),
    usuario character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    tipo character varying(20) NOT NULL,
    estado boolean DEFAULT true,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT usuarios_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['Administrador'::character varying, 'Encargado'::character varying])::text[])))
);


ALTER TABLE public.usuarios OWNER TO kevin1920;

--
-- TOC entry 229 (class 1259 OID 16673)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: kevin1920
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO kevin1920;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kevin1920
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 4741 (class 2604 OID 16733)
-- Name: detalle_prestamo id_detalle; Type: DEFAULT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.detalle_prestamo ALTER COLUMN id_detalle SET DEFAULT nextval('public.detalle_prestamo_id_detalle_seq'::regclass);


--
-- TOC entry 4734 (class 2604 OID 16664)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4733 (class 2604 OID 16647)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 4743 (class 2604 OID 16802)
-- Name: materiales id_material; Type: DEFAULT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.materiales ALTER COLUMN id_material SET DEFAULT nextval('public.materiales_id_material_seq'::regclass);


--
-- TOC entry 4731 (class 2604 OID 16597)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4742 (class 2604 OID 16789)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 16717)
-- Name: prestamos id_prestamo; Type: DEFAULT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.prestamos ALTER COLUMN id_prestamo SET DEFAULT nextval('public.prestamos_id_prestamo_seq'::regclass);


--
-- TOC entry 4732 (class 2604 OID 16604)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4736 (class 2604 OID 16677)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 4946 (class 0 OID 16627)
-- Dependencies: 222
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- TOC entry 4947 (class 0 OID 16635)
-- Dependencies: 223
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- TOC entry 4958 (class 0 OID 16730)
-- Dependencies: 234
-- Data for Name: detalle_prestamo; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.detalle_prestamo (id_detalle, id_prestamo, id_material, cantidad) FROM stdin;
\.


--
-- TOC entry 4952 (class 0 OID 16661)
-- Dependencies: 228
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 4950 (class 0 OID 16653)
-- Dependencies: 226
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- TOC entry 4949 (class 0 OID 16644)
-- Dependencies: 225
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- TOC entry 4962 (class 0 OID 16799)
-- Dependencies: 238
-- Data for Name: materiales; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.materiales (id_material, nombre, descripcion, cantidad_total, cantidad_disponible, ubicacion, categoria, estado) FROM stdin;
1	Pinzas	Unas pinzas	3	3	Laboratorio	Equipo electronico	t
\.


--
-- TOC entry 4941 (class 0 OID 16594)
-- Dependencies: 217
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2026_06_27_235514_create_personal_access_tokens_table	2
\.


--
-- TOC entry 4944 (class 0 OID 16611)
-- Dependencies: 220
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 4960 (class 0 OID 16786)
-- Dependencies: 236
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4956 (class 0 OID 16714)
-- Dependencies: 232
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.prestamos (id_prestamo, id_usuario_encargado, matricula, nombre_solicitante, fecha_solicitud, fecha_entrega, estado, observaciones) FROM stdin;
8	3	2023	Pablito	2026-06-29	2026-07-02	Pendiente	Pinzas
\.


--
-- TOC entry 4945 (class 0 OID 16618)
-- Dependencies: 221
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
dhz8GeNVgZMDMLKSHKDsdagjo61wbAYkJUZR6fhB	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	eyJfdG9rZW4iOiJwelhmSTZrWDBYQ0FSMjlBWXVDeHJlNGc1M3pmaldxRDJiYW5sZlAzIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19	1782112349
xxcsS1XAgTqHpSGOGJQlFys1JAPMAEx718A99MMp	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	eyJfdG9rZW4iOiJuckV4dHg2cng3RXIxdGp0Rm1sZ0RXZndZZTNQeEpSRENlQ3lFT05YIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19	1782604863
\.


--
-- TOC entry 4943 (class 0 OID 16601)
-- Dependencies: 219
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4954 (class 0 OID 16674)
-- Dependencies: 230
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: kevin1920
--

COPY public.usuarios (id_usuario, nombre, apellido, usuario, password, tipo, estado, fecha_creacion) FROM stdin;
3	Kevin	P‚rez	kevin	ceti	Administrador	t	2026-06-27 21:29:36.786514
4	Jose	s	jos	ceti	Encargado	t	2026-06-28 16:27:06.464265
\.


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 233
-- Name: detalle_prestamo_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: kevin1920
--

SELECT pg_catalog.setval('public.detalle_prestamo_id_detalle_seq', 1, false);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 227
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kevin1920
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 224
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kevin1920
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 237
-- Name: materiales_id_material_seq; Type: SEQUENCE SET; Schema: public; Owner: kevin1920
--

SELECT pg_catalog.setval('public.materiales_id_material_seq', 2, true);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 216
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kevin1920
--

SELECT pg_catalog.setval('public.migrations_id_seq', 4, true);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 235
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kevin1920
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 231
-- Name: prestamos_id_prestamo_seq; Type: SEQUENCE SET; Schema: public; Owner: kevin1920
--

SELECT pg_catalog.setval('public.prestamos_id_prestamo_seq', 8, true);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kevin1920
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 229
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: kevin1920
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 5, true);


--
-- TOC entry 4767 (class 2606 OID 16641)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 4764 (class 2606 OID 16633)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 4785 (class 2606 OID 16736)
-- Name: detalle_prestamo detalle_prestamo_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.detalle_prestamo
    ADD CONSTRAINT detalle_prestamo_pkey PRIMARY KEY (id_detalle);


--
-- TOC entry 4775 (class 2606 OID 16669)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 2606 OID 16672)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 4772 (class 2606 OID 16659)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 4769 (class 2606 OID 16651)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4793 (class 2606 OID 16809)
-- Name: materiales materiales_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.materiales
    ADD CONSTRAINT materiales_pkey PRIMARY KEY (id_material);


--
-- TOC entry 4751 (class 2606 OID 16599)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4757 (class 2606 OID 16617)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 4788 (class 2606 OID 16793)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 4790 (class 2606 OID 16796)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 4783 (class 2606 OID 16723)
-- Name: prestamos prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (id_prestamo);


--
-- TOC entry 4760 (class 2606 OID 16624)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 4753 (class 2606 OID 16610)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 4755 (class 2606 OID 16608)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4779 (class 2606 OID 16684)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4781 (class 2606 OID 16686)
-- Name: usuarios usuarios_usuario_key; Type: CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);


--
-- TOC entry 4762 (class 1259 OID 16634)
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: kevin1920
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- TOC entry 4765 (class 1259 OID 16642)
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: kevin1920
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- TOC entry 4773 (class 1259 OID 16670)
-- Name: failed_jobs_connection_queue_failed_at_index; Type: INDEX; Schema: public; Owner: kevin1920
--

CREATE INDEX failed_jobs_connection_queue_failed_at_index ON public.failed_jobs USING btree (connection, queue, failed_at);


--
-- TOC entry 4770 (class 1259 OID 16652)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: kevin1920
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 4786 (class 1259 OID 16797)
-- Name: personal_access_tokens_expires_at_index; Type: INDEX; Schema: public; Owner: kevin1920
--

CREATE INDEX personal_access_tokens_expires_at_index ON public.personal_access_tokens USING btree (expires_at);


--
-- TOC entry 4791 (class 1259 OID 16794)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: kevin1920
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 4758 (class 1259 OID 16626)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: kevin1920
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 4761 (class 1259 OID 16625)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: kevin1920
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 4795 (class 2606 OID 16810)
-- Name: detalle_prestamo fk_material; Type: FK CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.detalle_prestamo
    ADD CONSTRAINT fk_material FOREIGN KEY (id_material) REFERENCES public.materiales(id_material) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4796 (class 2606 OID 16737)
-- Name: detalle_prestamo fk_prestamo; Type: FK CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.detalle_prestamo
    ADD CONSTRAINT fk_prestamo FOREIGN KEY (id_prestamo) REFERENCES public.prestamos(id_prestamo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4794 (class 2606 OID 16724)
-- Name: prestamos fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: kevin1920
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario_encargado) REFERENCES public.usuarios(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2026-06-29 01:13:31

--
-- PostgreSQL database dump complete
--

\unrestrict UhpVn1muiCVp2eaO6LZwUwhrA8enazLVeA4KrPqf42SfWupGJ1hBboMTOjSwLZG

