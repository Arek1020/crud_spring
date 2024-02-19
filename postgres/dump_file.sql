--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Debian 13.4-4.pgdg110+1)
-- Dumped by pg_dump version 14.9 (Homebrew)

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
-- Name: shop; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA shop;


ALTER SCHEMA shop OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    date timestamp(6) without time zone,
    order_details json,
    payment_date timestamp(6) without time zone NOT NULL,
    price double precision NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_id_seq OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id bigint NOT NULL,
    description character varying(255) NOT NULL,
    image character varying(255),
    name character varying(255) NOT NULL,
    price double precision NOT NULL,
    quantity integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: users_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_seq OWNER TO postgres;

--
-- Name: cart; Type: TABLE; Schema: shop; Owner: postgres
--

CREATE TABLE shop.cart (
    id integer NOT NULL,
    date character varying NOT NULL,
    "user" integer NOT NULL,
    price integer NOT NULL,
    "orderDetails" character varying,
    products character varying,
    payment_date character varying
);


ALTER TABLE shop.cart OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE; Schema: shop; Owner: postgres
--

CREATE SEQUENCE shop.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shop.cart_id_seq OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: shop; Owner: postgres
--

ALTER SEQUENCE shop.cart_id_seq OWNED BY shop.cart.id;


--
-- Name: product; Type: TABLE; Schema: shop; Owner: postgres
--

CREATE TABLE shop.product (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    price integer NOT NULL,
    image character varying,
    quantity integer
);


ALTER TABLE shop.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: shop; Owner: postgres
--

CREATE SEQUENCE shop.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shop.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: shop; Owner: postgres
--

ALTER SEQUENCE shop.product_id_seq OWNED BY shop.product.id;


--
-- Name: session; Type: TABLE; Schema: shop; Owner: postgres
--

CREATE TABLE shop.session (
    sess json NOT NULL,
    expire timestamp without time zone NOT NULL,
    sid character varying NOT NULL
);


ALTER TABLE shop.session OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: shop; Owner: postgres
--

CREATE TABLE shop."user" (
    id bigint NOT NULL,
    "firstName" character varying,
    "lastName" character varying,
    email character varying,
    password character varying,
    "userName" character varying,
    first_name character varying
);


ALTER TABLE shop."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: shop; Owner: postgres
--

CREATE SEQUENCE shop.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shop.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: shop; Owner: postgres
--

ALTER SEQUENCE shop.user_id_seq OWNED BY shop."user".id;


--
-- Name: users; Type: TABLE; Schema: shop; Owner: postgres
--

CREATE TABLE shop.users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying
);


ALTER TABLE shop.users OWNER TO postgres;

--
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: cart id; Type: DEFAULT; Schema: shop; Owner: postgres
--

ALTER TABLE ONLY shop.cart ALTER COLUMN id SET DEFAULT nextval('shop.cart_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: shop; Owner: postgres
--

ALTER TABLE ONLY shop.product ALTER COLUMN id SET DEFAULT nextval('shop.product_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: shop; Owner: postgres
--

ALTER TABLE ONLY shop."user" ALTER COLUMN id SET DEFAULT nextval('shop.user_id_seq'::regclass);


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, created_at, date, order_details, payment_date, price, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, description, image, name, price, quantity) FROM stdin;
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: shop; Owner: postgres
--

COPY shop.cart (id, date, "user", price, "orderDetails", products, payment_date) FROM stdin;
10	2023-06-11 13:08	10	250	{"products":[{"id":13,"usersAmount":1,"period":1},{"id":13,"usersAmount":1,"period":2},{"id":13,"usersAmount":1,"period":2},{"id":19,"usersAmount":3,"period":5},{"id":15,"usersAmount":1,"period":5}]}	\N	2023-06-11 13:08
14	2023-06-11 14:24	10	400	{"products":[{"id":15,"usersAmount":1,"period":4},{"id":15,"usersAmount":1,"period":4}]}	\N	2023-06-11 14:24
15	2023-06-11 14:26	10	0	{"products":[{"id":16,"usersAmount":1,"period":3}]}	\N	2023-06-11 14:26
16	2023-06-11 14:30	10	250	{"products":[{"id":13,"usersAmount":3,"period":4}]}	\N	2023-06-11 14:30
17	2023-06-17 09:17	10	500	{"products":[{"id":18,"usersAmount":3,"period":4},{"id":11,"usersAmount":3,"period":3}]}	\N	2023-06-17 09:17
18	2023-06-17 09:47	10	300	{"products":[{"id":10,"usersAmount":1,"period":6},{"id":16,"usersAmount":5,"period":1}]}	\N	2023-06-17 09:47
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: shop; Owner: postgres
--

COPY shop.product (id, name, description, price, image, quantity) FROM stdin;
10	Adobe Photoshop	Profesjonalne oprogramowanie do obróbki grafiki, które umożliwia retuszowanie zdjęć, tworzenie grafiki wektorowej i wiele innych zaawansowanych funkcji.	300	/photoshop.jpg	5
9	Microsoft Office	Pakiet biurowy Microsoft Office, który zawiera narzędzia do edycji dokumentów tekstowych, arkuszy kalkulacyjnych, prezentacji i innych.	200	/msOffice.jpg	10
11	Autodesk AutoCAD	Program do projektowania CAD (Computer-Aided Design), wykorzystywany w branży architektonicznej, inżynierii i konstrukcji.	2500	/autocad.jpg	2
12	Oracle Database	Potężny system zarządzania bazą danych, który oferuje niezawodność, skalowalność i zaawansowane funkcje do zarządzania danymi.	4000	/oracleDb.png	3
13	VMware Workstation	Oprogramowanie do wirtualizacji, które umożliwia uruchamianie wielu systemów operacyjnych na jednym komputerze i testowanie różnych konfiguracji.	250	/vmwareWork.jpg	8
14	IntelliJ IDEA	Inteligentne środowisko programistyczne dla języków programowania Java, Kotlin i innych. Oferuje wiele narzędzi wspomagających programowanie.	180	/intelij.png	6
15	Adobe Premiere Pro	Profesjonalne oprogramowanie do montażu wideo, które oferuje wiele zaawansowanych narzędzi edycji, efektów specjalnych i integrację z innymi aplikacjami Adobe.	400	/adobePremiere.png	4
16	Google Chrome	Popularna przeglądarka internetowa, która oferuje szybkość, bezpieczeństwo, różne rozszerzenia i łatwą synchronizację między urządzeniami.	0	/chrome.png	20
17	Adobe Illustrator	Program do tworzenia grafiki wektorowej, który umożliwia projektowanie logotypów, ilustracji, grafiki interaktywnej i innych.	300	/ilustrator.png	7
18	Microsoft Visual Studio	Zintegrowane środowisko programistyczne (IDE) firmy Microsoft, które wspiera wiele języków programowania i oferuje narzędzia dla programistów.	500	/vStudio.png	3
19	Salesforce CRM	Chmurowe oprogramowanie do zarządzania relacjami z klientami (CRM), które pomaga firmom w zarządzaniu kontaktami, sprzedażą i obsługą klienta.	900	/salesforceCrm.jpg	2
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: shop; Owner: postgres
--

COPY shop.session (sess, expire, sid) FROM stdin;
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 18:37:31	vwVh6D-9iZ2aBIVJ4fQmRgaawX2TeonG
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 18:37:31	fB9LA79NEU41Y-uWUqgRWzei8ZQ9ufmb
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 18:37:31	0WS8m9MjDwqMQ_KCImguHOWruzPqo7V8
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 18:37:52	nqv-7bWcUvFEuEsmNAbms8gfIGMxW74x
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 18:37:56	eXe3O4ko7aphJIMou6kPAoniHLI614QV
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 18:37:56	EKAMJM00GZxGeW-p9R49xb1wS08_3BFM
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 18:37:56	5dTPPCPco5JyvzPDHWTVdmvX-M6LRRmP
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 18:38:04	4McHvkIdinO-wYEaa1mkaIbzQJ1iOBjv
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 18:38:04	A9CiSz5aIW37di2HkwRypWfwI91J4_KH
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 18:38:07	qQJqGc_mDDA-nWTp0oqRUa36Lz0YVc2b
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 18:38:07	UdvHE7SsVx9mIZggPgLimvo7-jjuYm03
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 18:38:07	zmFWU0AtvxvjWanIshHxxQ7hMGz8PYYA
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 19:01:18	MW473kFh_M6LslQQdnterqIOV_CiUHQr
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 19:01:18	lTQQjjZm72r9VQ4crRmn4Nn5RF2OOieb
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 19:01:18	uXq5kb6ZiNjlPklaHMb5m4AMiKryjXVp
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 19:01:23	2pjj2PPzJQtquomapCWnBPcWiKTc7WTl
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 19:01:23	NKz3VcGGA84AzMu3qnT6hPIed9avluYH
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 19:01:23	8MdBcr2oHbbiFYAPBjQpwph48cxbvD74
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 19:03:45	DuYbcAJVZFtuI28qGOMEfj-B9CoRl574
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 19:03:45	Ij4rvKPjLS7CgCPEUVoyNguJe8Kfvh2A
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 19:03:45	XNQm5GSPnA9SJB1AaNzaAhN8HQuVHo6f
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 19:03:46	q3T0RkYTeg1Xb1gUkPSGlDzxqjBXfsd-
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 19:03:46	rebehmP6h8wL2x8ZN9cXVH3W_WEc29Ml
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 19:03:46	rtCA3fVLqcl805kXb01gPC4e7NN4fMir
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:19	suVi0wI4q8npz5peCuN4Lyv5sn3U8NSF
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:19	S2oj8J34tEMZXpLIzIArIbk23XwwIbBl
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:19	x81-EpqRKXaLrc6AqjzsUU4PTXjLCZ-3
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:01:02	zjAXtASbWfZY4XOlE3hhipuyL7W-V7v4
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:26	C71xNtmws-XNkDwHlJIzX9aOxD1M-Ol_
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:26	eQQPt9kgkr0SWS3rY9KZnyhhNSBfIXos
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:26	x8LsxiR-HvU3xVpHEbC-hL2C0-XeKY6E
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:31	pvVhsVy1XnHrTYkRavb8tPGgjjyHKYiJ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:31	by2vU891bRg40pO5qczNhbAlz7bvIwPy
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:44	WuWRuyvPvkvL7D1j2gVV1xKyEmzH9XfN
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:44	1FxFHKVbPaL0Yn86ezTU4n9ITv-6j8qU
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:45	abwczxJFISvbv93sd1zgmdoMoIk-dHsy
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:45	bAQy4dL026G-_KIydp1n5CIvPWpTYJfR
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:46	94w2YuA7mH8vHNXRRsbOHs_ZySRw08zE
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:46	L0GqQU-s654HAY2pIrnwca7TM7TPOVqs
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:46	8WoXdjWXeD0-GLrTlFUuz9tbonnREIE5
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:47	G9bcSj2S5F31kTtow_hQE2Y2OXxQ5hHe
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:48	JzcLeSRFlKp8CX6iiNQHR0XembxuUk6S
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:52	jwTYiW4BYaJGD6vh5vs-pfmvY0rBjJXU
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:53	CvHDuK3QpqK7jUh_Y-WGQzSerDM7DuWf
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:54	Rb5qHswz8xV7_bWtz4Q0BDhvoqcYkMqv
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:55	5OjWJVs-k7WpdMMotTz_DFNpmNGbfeeX
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:55	ojDfOIv-_tcpEWBr-p2bdA3lfM-uvK-d
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:56	NjmgX7sdGZ7mkrqx33z9_R6nOhoF4hXE
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:57	FuZbC3Cc-RNCqTtvi63__CRjL1dgRuBI
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:57	8UpqobYGopBzwOmRMNwgWm_w4WxtoMJK
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:58	_uF6dlIBGnAT8KhiOy34HH1OnFShn_Vz
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:58	hA7o2ULPzzsxI7niduU6CaIHlzz4FD3o
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:59	48msk30ZSF3JL0wnsTm6FmZjVQ3Vdbok
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:59	ydZRxXEyJHNncVN_BNQFZv8OCjlETAbI
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:00	IarsLTPXNHq-9dnQFFP0yliDdBpKbzXt
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:00	XPABHHc0cLBmdJtdTSKQ1AetOzwr6yh1
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:01	eeDE4EnaqoCZWPMSh1q2XpGrqF7PFbTw
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:01	gxf-AtP-v1yNJoppiYEJNRLewwKZ_t0V
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:01	cVVdXwuxi-sBbAhe6VOoYqn2kSCd0mEm
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:02	BcSlIMP9g-43SlcMuMDyqLy2lOW8fRHl
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:03	BjFtzxHN0gFD4RgyM0hl5U4-7w07RDRU
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:12	66Gsk-XWRr7rTv68ubc90-LxGABML5zZ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:12	sVieF3lrWJU7mBSLhH08owvAAry75Zb2
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:13	skyWo37DGNlE8WDvPurFfE0aQ-rVeuos
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:13	NBOMe2pT_Zs7H9SeXqyILlrsurHr0YpV
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:14	3j83ZR2nsuJpj41rue9_Tqd_Cejp5QrR
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:14	Xcy2YaqDeNaAszhdMMufWXqgyTwA3t0C
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:15	rx8u2nQsEG0NfX31lhtXtyXqzlZzHpnv
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:15	bV6_P9EUqbyIh7eJl5ETwU030w_f0Gzk
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:45	yLRxu2bXINOPYJeuyzDdAQY_rI44Vci4
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:45	m_6axWOlj2PUB36OngNSy04jQrAIYYc1
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:45	cXneJJBX4Lts6pQbkek2G2DWMlSXAztP
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:45	eHR4BzXqGeUgBjsFMRCamQj4J2KkHqHJ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:46	8gt2HHqrMJn0CSHNK4TW96rWiGnqOBjI
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:46	ubOaUb7jOSdHEDFA21-GXE4TPk-jrWm4
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:46	pyOVSmuYFsGtTfaRIZCdjS21l4IP__a3
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:46	r_fu7BgjBFFISod0qGPH32ONNh1_GFrT
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:46	TPUCOc55u7rTLRYkd2RAg9BWo2J4SPJA
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:46	s7-N5_JOP0bD5eMOvHWKY_jBn6ZdwdeG
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:47	MJtiA_zQGFDpCDA1XDVDf79CPLB679JV
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:47	cSKotfCS4s2tD00O3fYsN9mX6UzOnjSO
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:48	RatM3m4a-UwAvfks2WpbQhv48tiJpJ0l
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:48	AGgBoWd4DdO5HNPvNvE8dx2gYkHcbu2x
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:52	KHdB1rq_cmQyRHpPmQOLdpFX1TJc0gTf
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:52	RzIjf59stbx6vBXOg2vkEAJEbRqbmPh2
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:53	FJmuSnYx6Ep1Y3nT8l2IfleFUQsJk3Ze
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:53	Q2gjAX64X_4xWlLTxNldJ2keaTlObD36
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:54	vXT2g1vvTCQTCCY3PComFMCOxfBsFabj
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:54	lWOQSzx3xlg7nocdXdKsWNbDOA5fY7Nc
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:54	UcUvBp4tPLebz-rppSWs-VK6LDRCvuP2
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:55	ovljU-fIzLFnLvgOVAjxz8SLWdZklU4W
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:55	fWOD9OdMW3vNWf7hiCMKos_9IzJunW9C
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:55	fGedY2NreSNTGeXggv6JrlojNC-3YwMq
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:55	Ad7C-SDfidzwpEFaFNwPQkp-8iba1Uty
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:55	B90OAKQ38s3yjgOAu4OjcDpIebztjA8m
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:55	SvvL86K9hNoF1s7UGnoBQ_xChvpZFY50
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:56	DO5b_TQB-DeJogvkW3aSgA7a9DaNtjxQ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:56	Q7H-BWr1cb66qkijqpciwUcZ5SUnHrr9
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:57	7xEUriWHiJOaGete-ypkt8XVDOy8zY9i
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:57	lQ6Vdu1R35Ce6kOmlF1rtOIaZvF-WSRs
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:57	2Rxwt0-70_zJ_WhA6PFK-D77RgwHEZol
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:57	TdITLvCIavLL3AqzTt_SAN_MDRPlTGFw
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:58	sK_LwhAgbdmZuUeKnZDnHio80tgAc19-
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:58	nEhnCsJZ-uy5vZJo_YPM8bArFgoP_VDr
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:58	omifErKJLcbzuj2wSeNof_JJMF3d6brt
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:59	9BXDEKLYteEdyLUjFaXS3V2o7eWKY3Io
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:59	zHrw1upwGpheSkInnqk9_uKDavwTEDIU
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:59	lpnwPzOvgbSF6i2Q87XaJqk0YETDel8w
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:00	DPaTupQxYlSOVQyRx6OkUmr5WasuI_f6
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:00	5lpidxmgEbBgj9tNeRIKFlSLvx1KqlJa
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:01	hql4XSTIo7VsLmUU5bLplTgQT85_ys9s
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:02	z6LDMxrc5QWUrrCgfNESx3Pzcsqh6-lT
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:02	9FMb-ovL2TVPdbD7FACrZ2G52-xV069E
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:02	o2U7-gl9VzAPz3ZXO-NqJFdMYEyykzQt
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:03	agfHEZRxUTjLx9ugtCt6D9c1OeDnoL-c
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:12	gf7vo7OXJej62ukRBJks2Dd86u2x79bz
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:12	5GO1HBFN3WsYs9AN0M4nGFvuVqjTREI_
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:13	YWtWdvdD6g7J4kZnNG3J0s0i_FZuYnmO
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:13	t4hp81BVCkpdzMUwIeJCdAPlEWvjMXSj
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:14	NTdMEkGbe9rTPb3b3SeEZ7gW-1xsLjtC
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:14	93EomqeLaVuS9giW162LpTPH1hEo8R78
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:15	ufZ36IiEFMyoP1NtPgMyiWrufu9LepZR
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:15	epAJ60RgdBNNUcTpOpGuzK7f6CO6hNlP
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:06	Bb7i1FEtS4xKIs4SRGkXnWKbjdI0woh9
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:11	yaa5vzZ-0JRm60FwEko88pVtFzdubvGr
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:14	drq-k6fe4IYRcGqhuRPoingqLM9PjZ1N
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:11:01	cYBQ4BUy14PGXB5WT9_o0rCQhGCyN32p
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:11:01	cbYo6ARGxN20Fdl-Tx8mEU2N4nk2e8iL
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:33	-QL5eW-uj4rdAFkBVgVdbIkt_3VwXcxa
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:43	KCd6w7Fe6aXJX0hcBC4qaCxBtJtP9ruy
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:51	hSbSCoJi5t3dJBQlnFOwmNhlw6n4ZQkV
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:51	tMYITHQqIfJIbu8GT0XJS2HuDNGZe1ac
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:52	0dzauSrPATwLnqNh0UDzeChEN4vAaQfj
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:56	PSZfAJs1sx6l2z4qHjfgq1cIbclTXwZp
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 11:00:53	xXAJhPe5Gdy5s1DFUPiJUtMSAqfWkQLH
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:06	j0KphmPt-mezuRdmxWhOx2Igo44nQOxR
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:11	dfUAOfLYzPRY0-QVoWFnh0zDRUo8--b0
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:14	B7WgUrbLBdKMrkIo3h0q7NEPVAdNIfYZ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:11:12	fd8YlnAYaWIcupXgPToFmBOxcneAQ9tX
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:11:17	QbryvisbrKayQzCQfFufmb5bn4IjaizH
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:11:17	f-gPDMG8U_0O_S1gqtWFzXY6yMXUEMIi
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:11:17	FYed2JkZR5s9roQgM4hLmfoaFM9wJQeF
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:11:23	EWaUy7N7phX9x8jz-0i4BRb4QnWQLWkh
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:11:23	Yr1uV5QyZCiVs4rrvY5oalNeVktVmo1_
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:51	DCPCDxOETjqoMwNU30j0kz05J-1MGBrX
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:52	NtrqCEXyLmHkS3-CNqnEXE_GVRRq7pvN
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:56	ScXh9TGW9f_4AGJUkBy21KQw--0QZbrl
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:57	D5Qa5Y26MU3QL_yV6NvSoVqhZFKAOoGS
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:06	2IgLEeYyCy0Y7qb_Ja1SzDy0505gS9eM
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:11	ioFJFAnbJwk4Tt4rAd0VDkPur9TitpzT
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:14	xsVOp5PCqYCv_InohIDljoUqj9nFMD21
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:11:52	8JgDn-SKmYQTesORv7DFVwEJohnmfX89
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:56	cq89mAlpKVfD_Bz8TFklByeE9p6qI6O_
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:57	FlBTCppxYofTq8C9QFCeA1Oxigie7yMb
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:34	Gb62xVz2PLMvV9ZsG9UWwZ2CYNkNGBlL
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 08:55:43	Xz-EtqFEYpkKNkRGqgGj8Xk1coWDElKD
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:16	ahM-O-22fna4-5jYQB0jD8ieex1vRqt1
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:44:30	gfko-FzJScNfbxCBoFrVIuGnlTjC9T2z
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:44:34	8a3KuQd2xTgiEEnKyijwiIOvg0WNESfg
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:34	Ves1EjRNFccuTZXQlwsZcWCoQa1VaKCo
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 08:55:43	06wAa3aNRSbFD7O8HJ5t7PY9ZdT7i3pI
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:28	ePGN3hrawXbuadtXy2qyIoIVBivz3jlA
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:28	AnN4n4vEArHyv4NZElHNfi-IPqmnr-Pc
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:34	-f9rYbNn6gpklPWSbEl_E89JRQ2K4-SE
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:34	uchRdZhgOPqTqAqa39l0IWF6zqO2GLtm
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:35	g4jaGOpUC73AANZLMiL47IY6bljdDHJ3
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:35	3EXsfNAHp9iK1Q9IQeJ0P5Oigsd7dXz-
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:39	4Ll6jaEAS8hzQvwbZ32TwI00BKHWcsRS
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:39	iFrSIy1gzw6QWlti7DynNceThYy1AeTT
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:39	DWJJEJp9WV7TcImux-mmzX2Gdbs8_J25
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:45:07	XdgT9FfCdSX-1zd9gCLywisLKf9m-cLJ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:34	XSQeMXt_ILD5kAXW57AGFoIIAO560vpb
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 08:55:43	vaA4IVFi_zkla3OJmSUgUxieNSTim7pJ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:28	a150Qr-UWquQSIRBHXbGcWQVDcyxq8yj
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:30	Q-gHfq9fZacHwOI2FYz5T_NWBkamCO2u
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:30	z1eJ93Kdco5e-vLSDrIT9Glmolo2ORAv
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:12:34	hX-dOn0JnDMvJA_qeJAsGXAndkma9Q5y
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:45:24	gk1ywgu4wwDDveMJ4ZYZAQHZCojBZt9Y
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:45:24	dq1a8pBiWEYRkTfvQQTjdO2kvFm1Ngi6
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:45:24	BmI8wpjqnH6GhatNA55vwYpTgay1XQUr
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:00:57	NKA95-yyCCH1YkJDYWAl6F5hF2LcojKe
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:01:01	U93nZOodMRULWnAlEjm4K2065Vp0MrkP
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:01:01	z_IREkmz0ynIjqf8vHygsrFaiAHXRX9k
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 08:56:44	AjnPofl2LyDSZDh5z1XdjAvIy1S-GeYl
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 08:56:46	p_LtYIsNMM2dZu9QD6di089GG1IQpUZK
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:17:42	6Iexeb7u7GJ3G-RtuDVsAsRM1pW6tlQg
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:17:42	89BeqdRSLjNg9HZxXNBLnI8lrQ_sbYGm
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:17:42	goby6p4OzzxC3EquIhZkc9R7zXOIa1g2
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:45:57	Gt3egZj1c5Ie5CWU2-zgkHK9CkvLN-y-
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:46:01	1-YoOA73YnsPRqWk3UHGICKuvJnd9QOz
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:46:01	suRZVKsr1O5f9ww2REQEsXp0UbMf0xqe
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:46:01	eqxmyWKp2QZ8mWYNADq9S9JMos0UeFdG
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:46:02	bMvPxdxMez1FGV3m-clMRUzvV8TDUdOa
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 21:01:01	DHW-J5yl7Sjbq8NdkOjn8TThUL341V-k
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 08:56:57	CzdV3HV-Afn_sUrmxfCN6TXWaRaJf3sX
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 08:57:01	vw6iNT7HYyodNh21zAY2-Cnj5yaecwIU
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 08:57:01	vyGiDdYRx9zfEI1TiTOJVFKvrkbZz_3k
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:18:17	pWI-UnOZBEbvr-HSO9aqxNmFFGg5ZfF6
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:46:02	YmcBDS_P1Sqeavgqj3wBdrIAzbnJ11uX
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:46:05	fzPFRndIihh8U9xFV8YiU10o5tFXemgv
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:46:06	P0hoSMcgsklxkdL7S150RKhNe7DEAGNx
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:46:06	8aONdG-vEu2moRq3qCc0hEePvRLy6yOU
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 08:57:01	AY6XF2lcURGTgygXeeqmwv8mQq98y7ie
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 08:57:05	P3J_0_rp8tQ96ehiRwFcMorlyQO2k2eL
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 08:57:05	HbDCwYP45wMV7M8hOGtRcRwSjDcYgJdj
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:18:17	XGC3pZ0Z0MmJa9I4opT-8ZNpOD8Ofi2S
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:41:10	ax51-QC8PspGumw2OQhMKDbnzsbxiuJu
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:10	zrUcIHllA6zuIX2uHNKgX4VxmJoiE1T0
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:10	8l1NYn2g8KUT2fAb2xJ-00zlk88paliA
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:10	fOZHXykZOox69zMc-DR1UZWmZMHHY6IT
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:02:21	rCgZaAYNuH0n99L1CRLM6RRIQzV2zTCj
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:18:17	sP6mQvnn6QjcN1SN68TPldbwZ2h6fioN
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:41	YZ0_KKbPqHqeopQ5gsFBtatshSlNi2xa
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:45	PQOps_5YhxZhP_tPsxk_uTDqew2rpiMA
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:45	N95WacQaVh__8ZwKDzs81G-gGEQeYTjh
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:49	7Re9tahDW86kBgm6rjhWrXd0ZhwdpLnb
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:02:21	4pwdLlD56Fm0ahuBa81oirpF3Bx43iT2
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:24:52	CZxT0VpHgvHnYW1u9MbWf0qhrQ8MXEif
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:24:52	OLxUMlxS86D15IU2WrcMZNVWVN0DUtib
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:24:57	BGW4EGeGjmRwtD-OOVhv5K2ZKxby_zIO
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:24:57	4WMZ8G28tOyPuNgGlFIb-G1IHjJmJPnO
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:45	WAMJdkc-p5phwWJ3Akhbme_EIZRqZUM2
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:47	NXhRInAMsC907dRAFZY4kV39a_Fz3XgJ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:47	amfM1_dtV3adoq83FASGo90PKcitw3LB
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:49	otdOKeMGSAOR1mjbv7rCRHPjUF54XW81
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:04:55	oUnUP0wMgm8fw6nD9_QzEvWotyHhAI7j
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:24:52	m5v84DWIKE24VxDZU6ne4CeiNEctgk3O
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:24:57	2essWdBgE1YiJ1Rqi_f48vhL_UBrOTKe
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:49	xFbAovdeWEVQ7jmqmZfDISVeP22jmc9t
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:50	XUpQadWkj8yoh6aEoMOQnHAK31NhrvCg
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:47:50	gwCHl-8BP5pmC-uJnudGjd79lO3-lqX7
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:04:55	9joNHFMOw15_tgXAiN6CuqP2RzdA03yx
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:26:07	S4H_RhioKiCgTrumEUqEtbVGBqXJPDLd
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:26:07	8CVY3qr5WYdY6dY_y4HlCjM6Srx804gf
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:26:09	e1DToqiBKJP1gpWrAMGSfQhFWuJAovwd
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:26:09	e8vUuomVlFeBAFiE1ZO1ghbXJinB7pkU
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:26:09	d0tl0Mk-3nr3-3ypVad1VxMlbHCDMe4a
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:48:31	Ganmd0es21nsI-PwKJ9QCu0rOFrYTrqW
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:48:38	UaBMj4g2LSRG3s5JquWGLhZd_p5yCGSK
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:05:15	CKGSGg2KbqpuViMmaslygTxNh0P18_hO
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:39:14	ObNnoQ8jTST5P9s3pLwrLzOGdbWqJiv6
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:39:14	DDaeqhVopwgNVaiiOiUIG34fpiKKOgxL
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:48:57	pehyUJvI8tEahm6Ls2TaQD9yAGImm4Uq
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:49:02	Pe9x5hXL5kAoS-so2xi9yGhzUD3OgGHj
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:49:02	WABo_ca30At_UhOt64bD2XeuDjTKeT1t
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:49:04	PvVfVu1RiM-zL2D7KslGO4xGPah1On4O
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:05:15	qw1aCVfeRndP2uh56DtvgZY5_g8kNfac
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:39:14	-YMzX0r4LGT1As8JimYAX1kzqK90u8bN
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:49:02	5Btwq-NcbTU99SzUJT4R7LWkiLzAgDVN
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:49:04	fOoRbFOux6CI9gFvxPUWytUwUmVo1Jhy
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:05:15	EWejk6aImyQveJDSRfqPOvZG8slPnAjs
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:41:10	_jubId3xqXVg_D1cK9QF3yAUjc3TEmt0
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:41:19	3uEij98UND7BWnGo4ZQ2U609UNAL-9EZ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:07	Qz_862Kh5FD9qCzgn52KSmsQ-1Er12uN
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:07	7pAfCGHZ6eNKqC8dmtYyQ4P1FKK-JrYZ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:08	0EFp_Eko5JjXA9eOHK9vKznR9KjhbRin
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:08	xigJA58xL5LeWhcW_u9XiOY7MwxNxpoN
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:09	owkMTNMv05ohuIhE0Kgb5O2PO3Bi8Xku
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:09	EXS8VmgFG0CjKoczFfPHHtskYMrqukKz
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:10	C9bLCjmLCxSgFNl6hcpOA6zWU21FLHUX
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:10	nUIGNx6fni5qSAbSAbuYwnmDH2iG4g_g
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:10	GBscM7gzVIxwxYURCOHt75aiO-S74I53
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:11	CXo7xppGR2Vvk0qOJc8SfajLlAtPPDll
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:11	rdU00FvBNnlEODO2y8YwfsFHs62D8Oxb
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:12	Ji24EDMy-zQ50BODvDZopZjMLLHYqoWV
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:12	XHRSO7QSH5aihQ0BEmrwNU0-8tHGX2lc
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:53:13	7xaPWxomC5Em0mNBTCDHzZW-IMTQOJI0
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:05:34	w1XbQJqTHN6ckUbxQ8x9S7zpycRiWo_M
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:41:10	0bjm-9aTuSDANWUuheQqEJE5lrT-tGar
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:41:10	f8lU5XdTdT_oO90BMcqtQLcOE5w5zoLF
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:41:19	CLYqjaTsfkyRBhTz9EE9RAmv_g6jNL0q
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:41:19	JuXRpxDhV5-yFW3k6_TA97i-DXw4xn5d
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 10:58:53	mfFSqn8vtXOuz-U74sVYnrmuxL6731GR
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:05:34	aCzjqBGHUzmQWCEiTsMo3UySIEFXifQI
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:05:35	_Ga2qQF6BkSS_oOwXxc89P08mlNhM-Ab
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:05:35	LsxEHfVCJJo2k6v--boMEB3zyi-oUh6_
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:42:00	lpfBSvtOHlUlFE7N9T08sgA8iKdsu71f
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 10:59:04	D96sSiqlefOtP8TMeqz2Glmjs_IjoSyE
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:09:07	RNGZCvkeAkbiVaR4-fv0xvWk-I8eA1qs
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:09:09	Yoa40fHo8VXhQEF1fFdfIiRyAg-dauk7
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:09:09	WBRLTc4orbzugM8RXMaf09Nx1YAJn2L7
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:42:18	w1DpAgqaDlAWGGt0WT7M054cDwJwh75p
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:42:18	nHQW19qfInuI5ftfrS6FskHLdh3nOWn8
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 10:59:15	H9Mczmlfhz3ma7PDzlfXlpd1tzwnt4d_
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:09:22	BNrbnqVM3jhMpxMLXqgeuz6-aCs_HpiZ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:09:26	LNHhzLWbg15m2X2pHBemgBLj4iluUmvh
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:09:26	1c8eCXmVyp2xMN_85OcmDCarqGweH4ya
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:09:27	v_F8XudbmcO2_okSBxe-dztRJIBLdmNf
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 09:43:18	R99fw_k1YUPN9f6tEevtGcnp6E3aAGME
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 11:00:29	bcCWRG2ymxvflC0P-NxNJdx_7_qp57zU
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-18 11:00:35	aPrkRGcIt98fpnHhoVillN9FjHcM1Opt
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:58	_CDBaBEX36GLkVV18cIjvKCJ3ryOHrxQ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:59	3Hd95rDpa8bDZ4pH2kkOftdQSpevEfg1
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:59	gmsLywI5BMTlPiIlhGuPAO-czcSxPqWZ
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:59	m2vzesVngQEoS-85AJCDxP-tFThorNHb
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:58:59	FQYXuzoEzgN8dqlKBIds6P7KgpxVOlv6
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:00	nlQdQkuosuIgI0JVnJxBkwpDCj9CtItE
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:00	f5E_0LLry-rGekaQkJVs0dUQFVUdelqP
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:01	xG4Bi6-v70b0Cu1HGijicPQ_DpqSuxRx
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:01	U1_qCqEHR6QB0UrEMV3b4qNCHRjne2v5
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:02	pdGFSbXxEE1-wA0--JJeaKN1oB7rkhS7
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:02	whtJRYBKN2c7R75Gi5djQQBIlv65DIoO
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:03	uw4-Z2AHGJTZVASlX0A9dZpFcP9HQObA
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:12	zvlq2em2prhSUBHGpPyfsoDuQZe-EOjz
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:12	7LSPND1mgW-5PmlglToutjwVcs9ng8cj
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:13	iqrY3cfVIYV9INAjhHqwZuU4eK-Vqpar
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:13	Oa2FwD1XfGqsPx3B52b1kEGqh6cHkdnR
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:14	XWj5_wPNTf8WDGjbyzMqY5SCBtW898OB
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:14	ofcQUb3fZXnueEUwj6yXR6tbGXM6o3o-
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:15	DpdlqM2fMkpZggSlBBs6XdnbYZhtp5me
{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":"","path":"/"},"sid":"UfOLvYjD6DhRfvpvKhZSPOxVLfgRz2Mz"}	2023-06-17 20:59:15	z14J6EKstMBOqq-AFulrwIoDLfVule5D
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: shop; Owner: postgres
--

COPY shop."user" (id, "firstName", "lastName", email, password, "userName", first_name) FROM stdin;
10	Arek	Banaś	aerkqpwo@gmail.com	$2b$10$U7Uv7L5WBKN8DzXN2WXmCuhWkfLL8UR/5KwqCyuMmdJV.Ge/lm8Le	aerkqpwo@gmail.com	\N
11	Arek	Dev	arecki@spoko.pl	$2b$10$C.yTUiPJ9x2per1t/0IIs.VHg4ETbe1nSirZf2xIG24kClYK1zs1C	arecki@spoasfasfko.pl	\N
12	asfd	asdf	arekbanas9@gmail.com	$2b$10$ZKVYV/B3b.yLLakQVu/IRu.OYZHm4zVb4ZaEuBt/94o1xojZV6DIK	aerkqpwo@gmail.com	\N
13	Arek	Banaś	arkadiuszbana@gmail.com	$2b$10$rV2fBdqk5eCzO4hSxjy3KucoTwZHRb2HCcwvs.f1PBAacsAwtxC4q	aerkqpwo@gmail.com	\N
18	\N	\N	\N	\N	\N	\N
19	\N	\N	\N	\N	\N	\N
20	\N	\N	\N	\N	\N	\N
21	\N	\N	\N	\N	\N	\N
22	\N	\N	\N	\N	\N	\N
23	\N	\N	\N	\N	\N	\N
24	\N	\N	aerkqpwo@gmail.com	\N	\N	\N
25	\N	\N	aerkqpwo@gmail.com	\N	\N	\N
26	\N	\N	aerkqpwo@gmail.com	\N	\N	\N
27	\N	\N	aerkqpwo@gmail.com	\N	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: shop; Owner: postgres
--

COPY shop.users (id, first_name, last_name, email) FROM stdin;
1	Arek	Banaś	aerkqpwo@gmail.com
202	aaaa	bbbbcccc	arekbanas9@gmail.com
254	ccc	dddlmkmk	arekbanas9@gmail.com
255	Adi	Adi123	elo@elo.pl
\.


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- Name: users_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_seq', 301, true);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: shop; Owner: postgres
--

SELECT pg_catalog.setval('shop.cart_id_seq', 18, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: shop; Owner: postgres
--

SELECT pg_catalog.setval('shop.product_id_seq', 19, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: shop; Owner: postgres
--

SELECT pg_catalog.setval('shop.user_id_seq', 27, true);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product PK_bebc9158e480b949565b4dc7a82; Type: CONSTRAINT; Schema: shop; Owner: postgres
--

ALTER TABLE ONLY shop.product
    ADD CONSTRAINT "PK_bebc9158e480b949565b4dc7a82" PRIMARY KEY (id);


--
-- Name: cart PK_c524ec48751b9b5bcfbf6e59be7; Type: CONSTRAINT; Schema: shop; Owner: postgres
--

ALTER TABLE ONLY shop.cart
    ADD CONSTRAINT "PK_c524ec48751b9b5bcfbf6e59be7" PRIMARY KEY (id);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: shop; Owner: postgres
--

ALTER TABLE ONLY shop."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: shop; Owner: postgres
--

ALTER TABLE ONLY shop.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: shop; Owner: postgres
--

ALTER TABLE ONLY shop.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

