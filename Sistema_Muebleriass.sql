--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2026-02-16 00:12:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 26102)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre character varying(100) NOT NULL,
    cedula character varying(15) NOT NULL,
    telefono character varying(20),
    direccion text
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 26101)
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 217
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;


--
-- TOC entry 226 (class 1259 OID 26145)
-- Name: detalle_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_venta (
    id_detalle integer NOT NULL,
    id_venta integer,
    id_mueble integer,
    cantidad integer NOT NULL,
    subtotal numeric(10,2)
);


ALTER TABLE public.detalle_venta OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 26144)
-- Name: detalle_venta_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_venta_id_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detalle_venta_id_detalle_seq OWNER TO postgres;

--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 225
-- Name: detalle_venta_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_venta_id_detalle_seq OWNED BY public.detalle_venta.id_detalle;


--
-- TOC entry 220 (class 1259 OID 26113)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    id_empleado integer NOT NULL,
    nombre character varying(100) NOT NULL,
    cargo character varying(50),
    salario numeric(10,2)
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 26112)
-- Name: empleado_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empleado_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empleado_id_empleado_seq OWNER TO postgres;

--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 219
-- Name: empleado_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empleado_id_empleado_seq OWNED BY public.empleado.id_empleado;


--
-- TOC entry 222 (class 1259 OID 26120)
-- Name: mueble; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mueble (
    id_mueble integer NOT NULL,
    nombre character varying(100) NOT NULL,
    tipo character varying(50),
    precio numeric(10,2) NOT NULL,
    stock integer NOT NULL
);


ALTER TABLE public.mueble OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 26119)
-- Name: mueble_id_mueble_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mueble_id_mueble_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mueble_id_mueble_seq OWNER TO postgres;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 221
-- Name: mueble_id_mueble_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mueble_id_mueble_seq OWNED BY public.mueble.id_mueble;


--
-- TOC entry 224 (class 1259 OID 26127)
-- Name: venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venta (
    id_venta integer NOT NULL,
    id_cliente integer,
    id_empleado integer,
    fecha date DEFAULT CURRENT_DATE,
    total numeric(10,2)
);


ALTER TABLE public.venta OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 26126)
-- Name: venta_id_venta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venta_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.venta_id_venta_seq OWNER TO postgres;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 223
-- Name: venta_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venta_id_venta_seq OWNED BY public.venta.id_venta;


--
-- TOC entry 4762 (class 2604 OID 26105)
-- Name: cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 26148)
-- Name: detalle_venta id_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta ALTER COLUMN id_detalle SET DEFAULT nextval('public.detalle_venta_id_detalle_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 26116)
-- Name: empleado id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado ALTER COLUMN id_empleado SET DEFAULT nextval('public.empleado_id_empleado_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 26123)
-- Name: mueble id_mueble; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mueble ALTER COLUMN id_mueble SET DEFAULT nextval('public.mueble_id_mueble_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 26130)
-- Name: venta id_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta ALTER COLUMN id_venta SET DEFAULT nextval('public.venta_id_venta_seq'::regclass);


--
-- TOC entry 4930 (class 0 OID 26102)
-- Dependencies: 218
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id_cliente, nombre, cedula, telefono, direccion) FROM stdin;
1	Carlos Mena	0923456789	0991112222	Guayaquil
2	Ana Torres	0934567890	0983334444	Durán
\.


--
-- TOC entry 4938 (class 0 OID 26145)
-- Dependencies: 226
-- Data for Name: detalle_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_venta (id_detalle, id_venta, id_mueble, cantidad, subtotal) FROM stdin;
1	1	1	1	450.00
2	1	1	1	450.00
\.


--
-- TOC entry 4932 (class 0 OID 26113)
-- Dependencies: 220
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado (id_empleado, nombre, cargo, salario) FROM stdin;
1	Luis Pérez	Vendedor	600.00
2	María López	Administrador	900.00
3	Luis Pérez	Vendedor	600.00
4	María López	Administrador	900.00
5	Luis Pérez	Vendedor	600.00
6	María López	Administrador	900.00
7	Luis Pérez	Vendedor	600.00
8	María López	Administrador	900.00
9	Luis Pérez	Vendedor	600.00
10	María López	Administrador	900.00
\.


--
-- TOC entry 4934 (class 0 OID 26120)
-- Dependencies: 222
-- Data for Name: mueble; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mueble (id_mueble, nombre, tipo, precio, stock) FROM stdin;
1	Sofá Moderno	Sala	450.00	10
2	Mesa de Comedor	Comedor	300.00	5
3	Sofá Moderno	Sala	450.00	10
4	Mesa de Comedor	Comedor	300.00	5
5	Sofá Moderno	Sala	450.00	10
6	Mesa de Comedor	Comedor	300.00	5
7	Sofá Moderno	Sala	450.00	10
8	Mesa de Comedor	Comedor	300.00	5
\.


--
-- TOC entry 4936 (class 0 OID 26127)
-- Dependencies: 224
-- Data for Name: venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta (id_venta, id_cliente, id_empleado, fecha, total) FROM stdin;
1	1	1	2026-02-15	450.00
2	1	1	2026-02-15	450.00
3	1	1	2026-02-15	450.00
\.


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 217
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 7, true);


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 225
-- Name: detalle_venta_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_venta_id_detalle_seq', 2, true);


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 219
-- Name: empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_id_empleado_seq', 10, true);


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 221
-- Name: mueble_id_mueble_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mueble_id_mueble_seq', 8, true);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 223
-- Name: venta_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_id_venta_seq', 3, true);


--
-- TOC entry 4769 (class 2606 OID 26111)
-- Name: cliente cliente_cedula_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cedula_key UNIQUE (cedula);


--
-- TOC entry 4771 (class 2606 OID 26109)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 4779 (class 2606 OID 26150)
-- Name: detalle_venta detalle_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT detalle_venta_pkey PRIMARY KEY (id_detalle);


--
-- TOC entry 4773 (class 2606 OID 26118)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 4775 (class 2606 OID 26125)
-- Name: mueble mueble_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mueble
    ADD CONSTRAINT mueble_pkey PRIMARY KEY (id_mueble);


--
-- TOC entry 4777 (class 2606 OID 26133)
-- Name: venta venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id_venta);


--
-- TOC entry 4782 (class 2606 OID 26156)
-- Name: detalle_venta detalle_venta_id_mueble_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT detalle_venta_id_mueble_fkey FOREIGN KEY (id_mueble) REFERENCES public.mueble(id_mueble);


--
-- TOC entry 4783 (class 2606 OID 26151)
-- Name: detalle_venta detalle_venta_id_venta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta
    ADD CONSTRAINT detalle_venta_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES public.venta(id_venta);


--
-- TOC entry 4780 (class 2606 OID 26134)
-- Name: venta venta_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 4781 (class 2606 OID 26139)
-- Name: venta venta_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado);


-- Completed on 2026-02-16 00:12:41

--
-- PostgreSQL database dump complete
--

