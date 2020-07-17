--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-07-17 17:18:32

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
-- TOC entry 202 (class 1259 OID 16394)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    nombres character varying(20),
    apellidos character varying(20)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16419)
-- Name: detalle_orden; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_orden (
    id_detalle_orden integer NOT NULL,
    id_orden integer,
    id_producto integer,
    cantidad integer,
    sub_total double precision,
    total double precision
);


ALTER TABLE public.detalle_orden OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16439)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    username character varying(50),
    groupname character varying(255)
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16399)
-- Name: orden; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden (
    id_cliente integer,
    id_orden integer NOT NULL,
    cantidad integer,
    fecha date,
    subtotal double precision,
    total double precision
);


ALTER TABLE public.orden OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16404)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id integer NOT NULL,
    nombre character varying(50),
    descripcion character varying(150),
    precio double precision,
    estado character varying(1)
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16434)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    username character varying(50) NOT NULL,
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2845 (class 0 OID 16394)
-- Dependencies: 202
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id, nombres, apellidos) FROM stdin;
1	hhhnn	ramires
2	otro	jjjjj,m,m
3	lorenas	eteban
\.


--
-- TOC entry 2848 (class 0 OID 16419)
-- Dependencies: 205
-- Data for Name: detalle_orden; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_orden (id_detalle_orden, id_orden, id_producto, cantidad, sub_total, total) FROM stdin;
1	1	7	56	2557.52	2889.9976
2	2	7	787	35942.29	40614.7877
3	3	7	4	182.68	206.4284
\.


--
-- TOC entry 2850 (class 0 OID 16439)
-- Dependencies: 207
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (username, groupname) FROM stdin;
dsramirez	administrador
prueba	cliente
\.


--
-- TOC entry 2846 (class 0 OID 16399)
-- Dependencies: 203
-- Data for Name: orden; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orden (id_cliente, id_orden, cantidad, fecha, subtotal, total) FROM stdin;
1	1	56	2020-07-17	2557.52	2890
2	2	787	2020-07-17	35942.29	40614.79
1	3	4	2020-07-17	182.68	206.43
\.


--
-- TOC entry 2847 (class 0 OID 16404)
-- Dependencies: 204
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id, nombre, descripcion, precio, estado) FROM stdin;
3	lavadira	marca whirlpool	567.9	\N
2	laptop dell	u	600.9	\N
4	demog	dg	34.99	\N
5	ssddd	fff	34.9	I
7	sss	ds	45.67	A
6	bb	iyu	11.9	I
\.


--
-- TOC entry 2849 (class 0 OID 16434)
-- Dependencies: 206
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (username, password) FROM stdin;
dsramirez	655e786674d9d3e77bc05ed1de37b4b6bc89f788829f9f3c679e7687b410c89b
prueba	317b32c143692b9939c197f6a5df54f9698df9a4882fe8bf19608968662be4fa
\.


--
-- TOC entry 2706 (class 2606 OID 16398)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 16423)
-- Name: detalle_orden detalle_orden_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_orden
    ADD CONSTRAINT detalle_orden_pkey PRIMARY KEY (id_detalle_orden);


--
-- TOC entry 2708 (class 2606 OID 16403)
-- Name: orden orden_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_pkey PRIMARY KEY (id_orden);


--
-- TOC entry 2710 (class 2606 OID 16413)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 16445)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- TOC entry 2715 (class 2606 OID 16407)
-- Name: orden fk_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- TOC entry 2717 (class 2606 OID 16429)
-- Name: detalle_orden fk_orden; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_orden
    ADD CONSTRAINT fk_orden FOREIGN KEY (id_orden) REFERENCES public.orden(id_orden);


--
-- TOC entry 2716 (class 2606 OID 16424)
-- Name: detalle_orden fk_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_orden
    ADD CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES public.producto(id);


--
-- TOC entry 2718 (class 2606 OID 16448)
-- Name: groups fk_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT fk_user FOREIGN KEY (username) REFERENCES public.users(username);


-- Completed on 2020-07-17 17:18:32

--
-- PostgreSQL database dump complete
--

