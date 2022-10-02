DROP DATABASE "DB_TIENDA_SUSY";

CREATE DATABASE "DB_TIENDA_SUSY" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';


\connect "DB_TIENDA_SUSY"

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


ALTER TABLE public.seq_measure_type_id OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 262443)
-- Name: seq_order_detail_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_order_detail_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_order_detail_id OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 262445)
-- Name: seq_order_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_order_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_order_id OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 262368)
-- Name: seq_product_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_product_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_product_id OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 262393)
-- Name: seq_product_supplier_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_product_supplier_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_product_supplier_id OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 262415)
-- Name: seq_sale_detail_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_sale_detail_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_sale_detail_id OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 262417)
-- Name: seq_sale_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_sale_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_sale_id OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 262395)
-- Name: seq_supplier_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_supplier_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_supplier_id OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 262385)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    id bigint NOT NULL,
    business_name character varying(255) NOT NULL,
    identification_number character varying(255) NOT NULL,
    phone character varying(255) NOT NULL
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 270678)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

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


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 270676)
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
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 223 (class 1259 OID 270710)
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_roles (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_role integer NOT NULL
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 270708)
-- Name: users_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_roles_id_seq OWNER TO postgres;

--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 222
-- Name: users_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_roles_id_seq OWNED BY public.users_roles.id;


--
-- TOC entry 2767 (class 2604 OID 270681)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 270713)
-- Name: users_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles ALTER COLUMN id SET DEFAULT nextval('public.users_roles_id_seq'::regclass);


--
-- TOC entry 2957 (class 0 OID 278910)
-- Dependencies: 224
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (id, name) FROM stdin;
1	Diana
2	Blancox
3	Morena
4	Coca Cola
6	Alquería
7	Ego
5	Alpina
8	Margarita
9	Refisal
10	Arboleda
\.


--
-- TOC entry 2936 (class 0 OID 262348)
-- Dependencies: 203
-- Data for Name: content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content (id, value, id_measure_type_fk) FROM stdin;
14	500	1
15	1000	1
16	1	3
17	1.5	2
18	350	1
19	1	2
20	250	11
21	1100	4
22	200	4
23	105	1
\.


--
-- TOC entry 2937 (class 0 OID 262353)
-- Dependencies: 204
-- Data for Name: measure_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.measure_type (id, name) FROM stdin;
1	Gramos
2	Litros
3	Kilogramos
11	Libras
4	Mililitros
\.


--
-- TOC entry 2935 (class 0 OID 262322)
-- Dependencies: 202
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (codigo, codigo_mensaje, descripcion) FROM stdin;
viveres-susy.generico.error-validacion-campos-entrada	TDSG002	Error en validación de campos de entrada
viveres-susy.ventas.venta-no-existe	TDSV001	La venta a la que hace referencia no existe
viveres-susy.producto.producto-no-existe	TDSP003	El producto con el id %s no existe
viveres-susy.producto.contenido-no-existe	TDSP001	El tipo de contenido con el id %s no existe
viveres-susy.producto.producto-ya-existe	TDSP002	El producto con las siguientes especificaciones ya existe: %s 
viveres-susy.proveedor.proveedor-ya-existe	TDSS001	El proveedor con identificación %s,  ya existe.
viveres-susy.proveedor.proveedor-no-existe	TDSS001	El proveedor con id %s no existe
viveres-susy.proveedor.producto.error-cliente-producto	TDSP004	Error de cliente microservicio productos.
viveres-susy.proveedor.producto.error-servidor-producto	TDSP005	Error del servidor microservicio productos.
viveres-susy.pedidos.pedido-no-existe	TDSPD001	El pedido con id %s no existe.
viveres-susy.generico.error-interno-servidor	TDSG001	Error interno del servidor
viveres-susy.generico.error-procesamiento-tx	TDSG003	Error en el procesamiento interno de la transacción.
viveres-susy.producto.marca-ya-existe	TDSP004	La marca con el id %s ya existe
viveres-susy.producto.marca-no-existe	TDSP005	La marca con el id %s no existe
viveres-susy.producto.medida-ya-existe	TDSP006	La medida '%s' ya existe
viveres-susy.producto.medida-no-existe	TDSP007	La medida con el id %s no existe
viveres-susy.producto.contenido-ya-existe	TDSP008	El tipo de contenido ya existe.
\.


--
-- TOC entry 2950 (class 0 OID 262447)
-- Dependencies: 217
-- Data for Name: orden; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orden (id, amount, date, id_supplier_fk, user_name) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 262452)
-- Dependencies: 218
-- Data for Name: order_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_detail (id, amount, num_items, id_product_fk, id_order_fk) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 262358)
-- Dependencies: 205
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, current_num_items, description, minimum_stock, name, price, id_content_fk, id_brand_fk) FROM stdin;
38	5	Producto prueb x 200 Mililitros	4	Producto prueb	4500	22	2
33	1	Coca Cola X 1 Litro	4	Coca Cola	2000	19	4
36	3	Frijol Diana X 500 gramos	2	Frijol	2600	14	1
35	8	Gel Ego X 200 ml	8	Gel	1000	22	7
30	4	Arroz Diana X 500 gramos	5	Arroz	2500	14	1
37	3	Papas Margarita x 105g	2	Papas	2200	23	8
32	11	Coca Cola X 1.5 Litros	3	Coca Cola	3600	17	4
34	4	Leche Alquería X 1100 Mililitros	5	Leche	3200	21	6
31	35	Arroz Diana X 1 kilogramo	6	Arroz	3100	16	1
\.


--
-- TOC entry 2940 (class 0 OID 262380)
-- Dependencies: 207
-- Data for Name: product_supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_supplier (id, id_product_fk, id_supplier_fk) FROM stdin;
147	34	39
\.


--
-- TOC entry 2954 (class 0 OID 270700)
-- Dependencies: 221
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	ROLE_ADMIN
2	ROLE_USER
\.


--
-- TOC entry 2944 (class 0 OID 262405)
-- Dependencies: 211
-- Data for Name: sale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale (id, amount, date, user_name, "time") FROM stdin;
31	5000	2022-05-16	pedro.chavez	16:45:41
32	8000	2022-05-16	pedro.chavez	16:47:04
33	9400	2022-05-16	pedro.chavez	17:16:02
34	6800	2022-05-17	pedro.chavez	10:30:44
35	17100	2022-05-19	pedro.chavez	19:27:32
36	11100	2022-05-20	pedro.chavez	07:36:56
37	1000	2022-05-20	pedro.chavez	07:37:11
\.


--
-- TOC entry 2945 (class 0 OID 262410)
-- Dependencies: 212
-- Data for Name: sale_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_detail (id, num_items, id_product_fk, id_sale_fk, price_unit) FROM stdin;
67	2	30	31	2500
68	1	35	32	1000
69	1	33	32	2000
70	2	30	32	2500
71	2	30	33	2500
72	2	37	33	2200
73	1	32	34	3600
74	1	34	34	3200
75	1	33	35	2000
76	1	36	35	2600
77	1	34	35	3200
78	3	31	35	3100
79	1	38	36	4500
80	2	33	36	2000
81	1	36	36	2600
82	1	35	37	1000
\.


--
-- TOC entry 2941 (class 0 OID 262385)
-- Dependencies: 208
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (id, business_name, identification_number, phone) FROM stdin;
38	Primer Proveedor	3054684550	3106998580
42	Quinto proveedro	9999999999	3215689745
39	Proveedores SAS	2222222222	32069866357
40	Tercer Proveedor INC	5566666666	2263846848
41	Papas Margarita SAS	6666666666	32288062658
\.


--
-- TOC entry 2953 (class 0 OID 270678)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, enabled, name, last_name, email, attempts) FROM stdin;
1	pedro.chavez	$2a$10$ve87FhPUFTk3E1jH9hXJZurIzv1ktNWMQknRxHsYtoqy4Miwc17fq	t	Pedro Luis	Chavez Castro	pedro.chavezcastro@outlook.com	0
2	daniela.aragon	$2a$10$GYM.vbjmsKdjiDG.FCZwQ.m17/cSWvMgMGQpS11QYEZgUWZU3p1qG	t	Daniela	Aragón	daniela.aragon@outlook.com	0
3	camila.aragon	$2a$10$6ZCyBOxkW9QZjH4SclB2neg7Co6MG7FTxXnhxF..wvfVmDp9p4UxS	t	Camila	Aragón	camila.aragon@outlook.com	0
\.


--
-- TOC entry 2956 (class 0 OID 270710)
-- Dependencies: 223
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_roles (id, id_user, id_role) FROM stdin;
1	1	1
2	1	2
4	2	2
5	3	2
\.


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 225
-- Name: seq_brand_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_brand_id', 10, true);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 227
-- Name: seq_content_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_content_id', 23, true);


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 226
-- Name: seq_measure_type_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_measure_type_id', 11, true);


--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 215
-- Name: seq_order_detail_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_order_detail_id', 4, true);


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 216
-- Name: seq_order_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_order_id', 4, true);


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 206
-- Name: seq_product_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_product_id', 38, true);


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 209
-- Name: seq_product_supplier_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_product_supplier_id', 150, true);


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 213
-- Name: seq_sale_detail_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_sale_detail_id', 82, true);


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 214
-- Name: seq_sale_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_sale_id', 37, true);


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 210
-- Name: seq_supplier_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_supplier_id', 42, true);


--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 222
-- Name: users_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_roles_id_seq', 5, true);


--
-- TOC entry 2800 (class 2606 OID 278917)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 262352)
-- Name: content content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 262357)
-- Name: measure_type measure_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measure_type
    ADD CONSTRAINT measure_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 262329)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (codigo);


--
-- TOC entry 2788 (class 2606 OID 262451)
-- Name: orden orden_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 262456)
-- Name: order_detail order_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 262365)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 262384)
-- Name: product_supplier product_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_supplier
    ADD CONSTRAINT product_supplier_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 270707)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 262414)
-- Name: sale_detail sale_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_detail
    ADD CONSTRAINT sale_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 262409)
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 262392)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 262367)
-- Name: measure_type uk_oqrqlhwc55ilokkus6dfk7tt3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measure_type
    ADD CONSTRAINT uk_oqrqlhwc55ilokkus6dfk7tt3 UNIQUE (name);


--
-- TOC entry 2792 (class 2606 OID 270688)
-- Name: users username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT username_unique UNIQUE (username) INCLUDE (username);


--
-- TOC entry 2794 (class 2606 OID 270686)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 270715)
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 262457)
-- Name: order_detail fk2r43hwu082340ltukdoqxi91i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT fk2r43hwu082340ltukdoqxi91i FOREIGN KEY (id_order_fk) REFERENCES public.orden(id);


--
-- TOC entry 2807 (class 2606 OID 270716)
-- Name: users_roles fk3avenccqsoqwrfur1hb8mpbrw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk3avenccqsoqwrfur1hb8mpbrw FOREIGN KEY (id_role) REFERENCES public.roles(id);


--
-- TOC entry 2801 (class 2606 OID 262370)
-- Name: content fk4a6yx946096rcwfxv0fxh7ch6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT fk4a6yx946096rcwfxv0fxh7ch6 FOREIGN KEY (id_measure_type_fk) REFERENCES public.measure_type(id);


--
-- TOC entry 2808 (class 2606 OID 270721)
-- Name: users_roles fk6ywr92flw5416dup8uc2egb83; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk6ywr92flw5416dup8uc2egb83 FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- TOC entry 2804 (class 2606 OID 262397)
-- Name: product_supplier fk844qr9ed96jo4uhqrwlon4tws; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_supplier
    ADD CONSTRAINT fk844qr9ed96jo4uhqrwlon4tws FOREIGN KEY (id_supplier_fk) REFERENCES public.supplier(id);


--
-- TOC entry 2805 (class 2606 OID 262419)
-- Name: sale_detail fk8uvujee3lp2lmy1kipxk0yt9m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_detail
    ADD CONSTRAINT fk8uvujee3lp2lmy1kipxk0yt9m FOREIGN KEY (id_sale_fk) REFERENCES public.sale(id);


--
-- TOC entry 2802 (class 2606 OID 262375)
-- Name: product fknys92h7nlaorfhorsnets9w5r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fknys92h7nlaorfhorsnets9w5r FOREIGN KEY (id_content_fk) REFERENCES public.content(id);


--
-- TOC entry 2803 (class 2606 OID 278918)
-- Name: product id_brand_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT id_brand_fk FOREIGN KEY (id_brand_fk) REFERENCES public.brand(id) NOT VALID;


-- Completed on 2022-05-28 15:33:07

--
-- PostgreSQL database dump complete
--

