CREATE TABLE public.brand (
    id integer NOT NULL,
    name text NOT NULL
);

CREATE TABLE public.content (
    id bigint NOT NULL,
    value double precision NOT NULL,
    id_measure_type_fk bigint NOT NULL
);

CREATE TABLE public.measure_type (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);

CREATE TABLE public.messages (
    codigo character varying(255) NOT NULL,
    codigo_mensaje character varying(255),
    descripcion character varying(255)
);

CREATE TABLE public.orden (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    date date NOT NULL,
    id_supplier_fk bigint NOT NULL,
    user_name character varying(255) NOT NULL
);

CREATE TABLE public.order_detail (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    num_items integer NOT NULL,
    id_product_fk bigint NOT NULL,
    id_order_fk bigint NOT NULL
);

CREATE TABLE public.product (
    id bigint NOT NULL,
    current_num_items integer NOT NULL,
    description character varying(255),
    minimum_stock integer NOT NULL,
    name character varying(255) NOT NULL,
    price double precision NOT NULL,
    id_content_fk bigint NOT NULL,
    id_brand_fk integer
);

CREATE TABLE public.product_supplier (
    id bigint NOT NULL,
    id_product_fk bigint NOT NULL,
    id_supplier_fk bigint NOT NULL
);


CREATE TABLE public.roles (
    id integer NOT NULL,
    name text NOT NULL
);

CREATE TABLE public.sale (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    date date NOT NULL,
    user_name character varying(255) NOT NULL,
    "time" time without time zone NOT NULL
);

CREATE TABLE public.sale_detail (
    id bigint NOT NULL,
    num_items integer NOT NULL,
    id_product_fk bigint NOT NULL,
    id_sale_fk bigint NOT NULL,
    price_unit double precision NOT NULL
);

CREATE SEQUENCE public.seq_brand_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.seq_content_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.seq_measure_type_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.seq_order_detail_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.seq_order_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.seq_product_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.seq_product_supplier_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.seq_sale_detail_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.seq_sale_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.seq_supplier_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.supplier (
    id bigint NOT NULL,
    business_name character varying(255) NOT NULL,
    identification_number character varying(255) NOT NULL,
    phone character varying(255) NOT NULL
);

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    enabled boolean NOT NULL,
    name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    attempts integer
);

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.users_roles (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_role integer NOT NULL
);

CREATE SEQUENCE public.users_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
ALTER TABLE ONLY public.users_roles ALTER COLUMN id SET DEFAULT nextval('public.users_roles_id_seq'::regclass);


ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 262352)
-- Name: content content_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 262357)
-- Name: measure_type measure_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.measure_type
    ADD CONSTRAINT measure_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 262329)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (codigo);


--
-- TOC entry 2788 (class 2606 OID 262451)
-- Name: orden orden_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 262456)
-- Name: order_detail order_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 262365)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 262384)
-- Name: product_supplier product_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_supplier
    ADD CONSTRAINT product_supplier_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 270707)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 262414)
-- Name: sale_detail sale_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_detail
    ADD CONSTRAINT sale_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 262409)
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 262392)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 262367)
-- Name: measure_type uk_oqrqlhwc55ilokkus6dfk7tt3; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.measure_type
    ADD CONSTRAINT uk_oqrqlhwc55ilokkus6dfk7tt3 UNIQUE (name);


--
-- TOC entry 2792 (class 2606 OID 270688)
-- Name: users username_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT username_unique UNIQUE (username) INCLUDE (username);


--
-- TOC entry 2794 (class 2606 OID 270686)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 270715)
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 262457)
-- Name: order_detail fk2r43hwu082340ltukdoqxi91i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT fk2r43hwu082340ltukdoqxi91i FOREIGN KEY (id_order_fk) REFERENCES public.orden(id);


--
-- TOC entry 2807 (class 2606 OID 270716)
-- Name: users_roles fk3avenccqsoqwrfur1hb8mpbrw; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk3avenccqsoqwrfur1hb8mpbrw FOREIGN KEY (id_role) REFERENCES public.roles(id);


--
-- TOC entry 2801 (class 2606 OID 262370)
-- Name: content fk4a6yx946096rcwfxv0fxh7ch6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT fk4a6yx946096rcwfxv0fxh7ch6 FOREIGN KEY (id_measure_type_fk) REFERENCES public.measure_type(id);


--
-- TOC entry 2808 (class 2606 OID 270721)
-- Name: users_roles fk6ywr92flw5416dup8uc2egb83; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk6ywr92flw5416dup8uc2egb83 FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- TOC entry 2804 (class 2606 OID 262397)
-- Name: product_supplier fk844qr9ed96jo4uhqrwlon4tws; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_supplier
    ADD CONSTRAINT fk844qr9ed96jo4uhqrwlon4tws FOREIGN KEY (id_supplier_fk) REFERENCES public.supplier(id);


--
-- TOC entry 2805 (class 2606 OID 262419)
-- Name: sale_detail fk8uvujee3lp2lmy1kipxk0yt9m; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_detail
    ADD CONSTRAINT fk8uvujee3lp2lmy1kipxk0yt9m FOREIGN KEY (id_sale_fk) REFERENCES public.sale(id);


--
-- TOC entry 2802 (class 2606 OID 262375)
-- Name: product fknys92h7nlaorfhorsnets9w5r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fknys92h7nlaorfhorsnets9w5r FOREIGN KEY (id_content_fk) REFERENCES public.content(id);


--
-- TOC entry 2803 (class 2606 OID 278918)
-- Name: product id_brand_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT id_brand_fk FOREIGN KEY (id_brand_fk) REFERENCES public.brand(id) NOT VALID;


-- Completed on 2022-05-28 15:41:44

--
-- PostgreSQL database dump complete
--

