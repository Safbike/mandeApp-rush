--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11
-- Dumped by pg_dump version 12.11

-- Started on 2022-08-11 20:57:42

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
-- TOC entry 209 (class 1259 OID 24978)
-- Name: labor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.labor (
    id_labor integer NOT NULL,
    nombre_labor character varying(32) NOT NULL,
    precio numeric NOT NULL,
    tipo_labor character varying(8) NOT NULL
);


ALTER TABLE public.labor OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24976)
-- Name: labor_id_labor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.labor_id_labor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labor_id_labor_seq OWNER TO postgres;

--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 208
-- Name: labor_id_labor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.labor_id_labor_seq OWNED BY public.labor.id_labor;


--
-- TOC entry 206 (class 1259 OID 24951)
-- Name: medio_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medio_pago (
    id_tarjeta integer NOT NULL,
    numero_tarjeta character varying(18) NOT NULL,
    ccv character varying(3) NOT NULL,
    fecha_vencimiento date NOT NULL,
    id_persona integer NOT NULL
);


ALTER TABLE public.medio_pago OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24949)
-- Name: medio_pago_id_tarjeta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medio_pago_id_tarjeta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medio_pago_id_tarjeta_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 205
-- Name: medio_pago_id_tarjeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medio_pago_id_tarjeta_seq OWNED BY public.medio_pago.id_tarjeta;


--
-- TOC entry 212 (class 1259 OID 25029)
-- Name: pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago (
    id_pago integer NOT NULL,
    id_usuario integer,
    id_trabajador integer,
    fecha_pago date NOT NULL,
    estrellas integer NOT NULL,
    id_labor integer
);


ALTER TABLE public.pago OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 25027)
-- Name: pago_id_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pago_id_pago_seq OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 211
-- Name: pago_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pago_id_pago_seq OWNED BY public.pago.id_pago;


--
-- TOC entry 203 (class 1259 OID 24931)
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    id_persona integer NOT NULL,
    nombre character varying(32) NOT NULL,
    apellido character varying(32) NOT NULL,
    direccion character varying(64) NOT NULL,
    ciudad character varying(16) NOT NULL,
    fecha_nacimiento date NOT NULL,
    foto_perfil character varying(64)
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24929)
-- Name: persona_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_id_persona_seq OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 202
-- Name: persona_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.persona.id_persona;


--
-- TOC entry 207 (class 1259 OID 24964)
-- Name: trabajador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trabajador (
    correo_trabajador character varying(32) NOT NULL,
    celular character varying(16) NOT NULL,
    cedula_trabajador character varying(64) NOT NULL,
    disponibilidad character varying(4) NOT NULL,
    id_persona integer NOT NULL
);


ALTER TABLE public.trabajador OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24987)
-- Name: trabajador_labor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trabajador_labor (
    id_persona integer NOT NULL,
    id_labor integer NOT NULL
);


ALTER TABLE public.trabajador_labor OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 24937)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    correo_usuario character varying(32) NOT NULL,
    celular character varying(16) NOT NULL,
    recibo_usuario character varying(64),
    id_persona integer NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 2720 (class 2604 OID 24981)
-- Name: labor id_labor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labor ALTER COLUMN id_labor SET DEFAULT nextval('public.labor_id_labor_seq'::regclass);


--
-- TOC entry 2719 (class 2604 OID 24954)
-- Name: medio_pago id_tarjeta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medio_pago ALTER COLUMN id_tarjeta SET DEFAULT nextval('public.medio_pago_id_tarjeta_seq'::regclass);


--
-- TOC entry 2721 (class 2604 OID 25032)
-- Name: pago id_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago ALTER COLUMN id_pago SET DEFAULT nextval('public.pago_id_pago_seq'::regclass);


--
-- TOC entry 2718 (class 2604 OID 24934)
-- Name: persona id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona ALTER COLUMN id_persona SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);


--
-- TOC entry 2887 (class 0 OID 24978)
-- Dependencies: 209
-- Data for Name: labor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.labor (id_labor, nombre_labor, precio, tipo_labor) FROM stdin;
1	paseador de perros	40000	unidad
2	electricista	100000	unidad
3	desarrollador	80000	hora
4	Animador(a)	50000	hora
\.


--
-- TOC entry 2884 (class 0 OID 24951)
-- Dependencies: 206
-- Data for Name: medio_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medio_pago (id_tarjeta, numero_tarjeta, ccv, fecha_vencimiento, id_persona) FROM stdin;
1	4404124754895147	332	2025-06-21	1
2	4404256934871268	048	2024-03-26	2
\.


--
-- TOC entry 2890 (class 0 OID 25029)
-- Dependencies: 212
-- Data for Name: pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pago (id_pago, id_usuario, id_trabajador, fecha_pago, estrellas, id_labor) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 24931)
-- Dependencies: 203
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persona (id_persona, nombre, apellido, direccion, ciudad, fecha_nacimiento, foto_perfil) FROM stdin;
1	Juan	Mina	Cra 17c #30-79	Cali	2000-07-23	
2	Claudia	Duque	Cl 18 #17-10	Cali	1983-06-13	
3	Isabel	Alarcon	Cl 14 #21-18	Cali	1976-09-09	
4	Justo	Caballero	Cra 29a #59	Cali	2002-05-30	
\.


--
-- TOC entry 2885 (class 0 OID 24964)
-- Dependencies: 207
-- Data for Name: trabajador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trabajador (correo_trabajador, celular, cedula_trabajador, disponibilidad, id_persona) FROM stdin;
isabelala07@hotmail.com	3174852964	5478164	si	3
justocaballero@gmail.com	3147851247	1005478265	si	4
\.


--
-- TOC entry 2888 (class 0 OID 24987)
-- Dependencies: 210
-- Data for Name: trabajador_labor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trabajador_labor (id_persona, id_labor) FROM stdin;
3	2
4	4
\.


--
-- TOC entry 2882 (class 0 OID 24937)
-- Dependencies: 204
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (correo_usuario, celular, recibo_usuario, id_persona) FROM stdin;
juanmina@gmail.com	3138429495		1
claudia123@hotmail.com	3157482154		2
\.


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 208
-- Name: labor_id_labor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.labor_id_labor_seq', 4, true);


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 205
-- Name: medio_pago_id_tarjeta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medio_pago_id_tarjeta_seq', 2, true);


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 211
-- Name: pago_id_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pago_id_pago_seq', 1, false);


--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 202
-- Name: persona_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_id_persona_seq', 4, true);


--
-- TOC entry 2737 (class 2606 OID 24986)
-- Name: labor labor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labor
    ADD CONSTRAINT labor_pkey PRIMARY KEY (id_labor);


--
-- TOC entry 2729 (class 2606 OID 24958)
-- Name: medio_pago medio_pago_id_persona_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medio_pago
    ADD CONSTRAINT medio_pago_id_persona_key UNIQUE (id_persona);


--
-- TOC entry 2731 (class 2606 OID 24956)
-- Name: medio_pago medio_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medio_pago
    ADD CONSTRAINT medio_pago_pkey PRIMARY KEY (id_tarjeta);


--
-- TOC entry 2739 (class 2606 OID 25040)
-- Name: pago pago_id_labor_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_id_labor_key UNIQUE (id_labor);


--
-- TOC entry 2741 (class 2606 OID 25038)
-- Name: pago pago_id_trabajador_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_id_trabajador_key UNIQUE (id_trabajador);


--
-- TOC entry 2743 (class 2606 OID 25036)
-- Name: pago pago_id_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_id_usuario_key UNIQUE (id_usuario);


--
-- TOC entry 2745 (class 2606 OID 25034)
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);


--
-- TOC entry 2723 (class 2606 OID 24936)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);


--
-- TOC entry 2733 (class 2606 OID 24970)
-- Name: trabajador trabajador_id_persona_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_id_persona_key UNIQUE (id_persona);


--
-- TOC entry 2735 (class 2606 OID 24968)
-- Name: trabajador trabajador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (correo_trabajador, celular);


--
-- TOC entry 2725 (class 2606 OID 24943)
-- Name: usuario usuario_id_persona_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_persona_key UNIQUE (id_persona);


--
-- TOC entry 2727 (class 2606 OID 24941)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (correo_usuario, celular);


--
-- TOC entry 2750 (class 2606 OID 24995)
-- Name: trabajador_labor fk_labor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador_labor
    ADD CONSTRAINT fk_labor FOREIGN KEY (id_labor) REFERENCES public.labor(id_labor);


--
-- TOC entry 2753 (class 2606 OID 25051)
-- Name: pago fk_pago_labor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT fk_pago_labor FOREIGN KEY (id_labor) REFERENCES public.labor(id_labor);


--
-- TOC entry 2752 (class 2606 OID 25046)
-- Name: pago fk_pago_trabajador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT fk_pago_trabajador FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_persona);


--
-- TOC entry 2751 (class 2606 OID 25041)
-- Name: pago fk_pago_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT fk_pago_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_persona);


--
-- TOC entry 2747 (class 2606 OID 24959)
-- Name: medio_pago fk_persona_pago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medio_pago
    ADD CONSTRAINT fk_persona_pago FOREIGN KEY (id_persona) REFERENCES public.usuario(id_persona);


--
-- TOC entry 2748 (class 2606 OID 24971)
-- Name: trabajador fk_persona_trabajador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT fk_persona_trabajador FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona);


--
-- TOC entry 2746 (class 2606 OID 24944)
-- Name: usuario fk_persona_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_persona_usuario FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona);


--
-- TOC entry 2749 (class 2606 OID 24990)
-- Name: trabajador_labor fk_trabajador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador_labor
    ADD CONSTRAINT fk_trabajador FOREIGN KEY (id_persona) REFERENCES public.trabajador(id_persona);


-- Completed on 2022-08-11 20:57:42

--
-- PostgreSQL database dump complete
--

