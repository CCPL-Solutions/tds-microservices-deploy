--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

-- Started on 2022-05-30 11:14:47

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
-- TOC entry 224 (class 1259 OID 278910)
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- TOC entry 2881 (class 0 OID 278910)
-- Dependencies: 224
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.brand (id, name) VALUES (1, 'Diana');
INSERT INTO public.brand (id, name) VALUES (2, 'Blancox');
INSERT INTO public.brand (id, name) VALUES (3, 'Morena');
INSERT INTO public.brand (id, name) VALUES (4, 'Coca Cola');
INSERT INTO public.brand (id, name) VALUES (6, 'Alquería');
INSERT INTO public.brand (id, name) VALUES (7, 'Ego');
INSERT INTO public.brand (id, name) VALUES (5, 'Alpina');
INSERT INTO public.brand (id, name) VALUES (8, 'Margarita');
INSERT INTO public.brand (id, name) VALUES (9, 'Refisal');
INSERT INTO public.brand (id, name) VALUES (10, 'Arboleda');


--
-- TOC entry 2754 (class 2606 OID 278917)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


-- Completed on 2022-05-30 11:14:48

--
-- PostgreSQL database dump complete
--

