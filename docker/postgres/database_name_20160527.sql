--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.10.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.10.1)

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
-- Name: enderecos; Type: TABLE; Schema: public; Owner: om30
--

CREATE TABLE public.enderecos (
    id bigint NOT NULL,
    pacientes_id bigint NOT NULL,
    endereco character varying(177) NOT NULL,
    numero character varying(20) NOT NULL,
    complemento character varying(177) NOT NULL,
    bairro character varying(177) NOT NULL,
    cep character varying(9) NOT NULL,
    cidade character varying(37) NOT NULL,
    estado character varying(19) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.enderecos OWNER TO om30;

--
-- Name: enderecos_id_seq; Type: SEQUENCE; Schema: public; Owner: om30
--

CREATE SEQUENCE public.enderecos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enderecos_id_seq OWNER TO om30;

--
-- Name: enderecos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: om30
--

ALTER SEQUENCE public.enderecos_id_seq OWNED BY public.enderecos.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: om30
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO om30;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: om30
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO om30;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: om30
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: om30
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO om30;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: om30
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO om30;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: om30
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: pacientes; Type: TABLE; Schema: public; Owner: om30
--

CREATE TABLE public.pacientes (
    id bigint NOT NULL,
    nome character varying(177) NOT NULL,
    nome_mae character varying(177) NOT NULL,
    data_nascimento date NOT NULL,
    cpf character varying(14) NOT NULL,
    cns character varying(15) NOT NULL,
    foto character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.pacientes OWNER TO om30;

--
-- Name: pacientes_id_seq; Type: SEQUENCE; Schema: public; Owner: om30
--

CREATE SEQUENCE public.pacientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pacientes_id_seq OWNER TO om30;

--
-- Name: pacientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: om30
--

ALTER SEQUENCE public.pacientes_id_seq OWNED BY public.pacientes.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: om30
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO om30;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: om30
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO om30;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: om30
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO om30;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: om30
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: om30
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


ALTER TABLE public.users OWNER TO om30;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: om30
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO om30;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: om30
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: enderecos id; Type: DEFAULT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.enderecos ALTER COLUMN id SET DEFAULT nextval('public.enderecos_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: pacientes id; Type: DEFAULT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.pacientes ALTER COLUMN id SET DEFAULT nextval('public.pacientes_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: enderecos; Type: TABLE DATA; Schema: public; Owner: om30
--

COPY public.enderecos (id, pacientes_id, endereco, numero, complemento, bairro, cep, cidade, estado, created_at, updated_at) FROM stdin;
1	1	Av. Vinícius Quintana	91766	Sala 202	do Leste	87848-068	Thomas do Sul	RS	2023-04-02 16:48:59	2023-04-02 16:48:59
2	2	Largo Colaço	117	Fundos	d'Oeste	46880-980	Vila Pietra	PI	2023-04-02 16:48:59	2023-04-02 16:48:59
3	3	Largo Ferminiano	1926	Apto. 101	do Sul	57099-301	Roberta do Sul	PR	2023-04-02 16:48:59	2023-04-02 16:48:59
4	4	R. Marília	24	Sala 202	do Sul	30584-800	Vila Violeta	SC	2023-04-02 16:48:59	2023-04-02 16:48:59
5	5	Largo Maya	6506	Sala 202	do Norte	29573-831	Porto Paulina	AL	2023-04-02 16:48:59	2023-04-02 16:48:59
6	6	Avenida Romero	2560	Fundos	do Norte	13382-331	Madeira do Leste	MT	2023-04-02 16:48:59	2023-04-02 16:48:59
7	7	Travessa Mascarenhas	4709	Fundos	do Leste	58531-033	Porto Thalita do Sul	TO	2023-04-02 16:48:59	2023-04-02 16:48:59
8	8	R. Alves	312	Apto. 101	do Sul	65390-061	Santa Yuri	AM	2023-04-02 16:48:59	2023-04-02 16:48:59
9	9	Travessa Jean Beltrão	14	Sala 202	do Norte	90433-936	Aranda do Sul	AC	2023-04-02 16:48:59	2023-04-02 16:48:59
10	10	R. Agustina	913	Sala 202	do Sul	12562-238	João do Leste	TO	2023-04-02 16:48:59	2023-04-02 16:48:59
11	11	R. Saito	8	Fundos	do Norte	82953-022	Silvana do Leste	MA	2023-04-02 16:48:59	2023-04-02 16:48:59
12	12	Av. Angélica Rosa	77651	Sala 202	do Sul	65214-707	Vila Mirela	AL	2023-04-02 16:48:59	2023-04-02 16:48:59
13	13	Av. Yasmin Lutero	21	Apto. 101	do Sul	12989-117	Porto Marta d'Oeste	MA	2023-04-02 16:48:59	2023-04-02 16:48:59
14	14	Largo Gustavo	7092	Apto. 101	do Norte	71779-827	São Ziraldo do Norte	GO	2023-04-02 16:48:59	2023-04-02 16:48:59
15	15	R. Fabrício Vale	995	Fundos	do Leste	38302-693	Renan do Leste	AP	2023-04-02 16:48:59	2023-04-02 16:48:59
16	16	Largo Ana Souza	823	Fundos	do Leste	04337-355	César do Leste	PA	2023-04-02 16:48:59	2023-04-02 16:48:59
17	17	Rua Madeira	329	Apto. 101	do Sul	42925-200	Alan do Norte	AL	2023-04-02 16:48:59	2023-04-02 16:48:59
18	18	Travessa Tiago	96	Sala 202	do Sul	37705-309	Marcos do Sul	MG	2023-04-02 16:48:59	2023-04-02 16:48:59
19	19	R. Sophie Prado	20322	Fundos	d'Oeste	46016-981	Porto Eunice do Leste	AP	2023-04-02 16:48:59	2023-04-02 16:48:59
20	20	Av. Malena Gonçalves	76801	Fundos	d'Oeste	17971-706	Carvalho do Leste	MA	2023-04-02 16:48:59	2023-04-02 16:48:59
21	21	R. Wellington Souza	6478	Sala 202	d'Oeste	96549-341	Santa Cristiano do Sul	MA	2023-04-02 16:48:59	2023-04-02 16:48:59
22	22	Avenida Dias	6	Fundos	do Leste	63164-261	Porto Simão do Sul	GO	2023-04-02 16:48:59	2023-04-02 16:48:59
23	23	R. Quintana	935	Apto. 101	d'Oeste	30784-158	Vila Gabriel d'Oeste	SE	2023-04-02 16:48:59	2023-04-02 16:48:59
24	24	Travessa Sergio	236	Fundos	d'Oeste	93743-100	São Olga	RS	2023-04-02 16:48:59	2023-04-02 16:48:59
25	25	Rua da Cruz	12054	Sala 202	do Norte	99599-968	Santa Ian	TO	2023-04-02 16:48:59	2023-04-02 16:48:59
26	26	Largo Teles	6	Apto. 101	d'Oeste	57472-708	Noel do Leste	SE	2023-04-02 16:48:59	2023-04-02 16:48:59
27	27	Av. Adriel Lovato	34624	Sala 202	do Norte	92764-431	Marés do Sul	SC	2023-04-02 16:48:59	2023-04-02 16:48:59
28	28	Rua Mariana	72955	Apto. 101	d'Oeste	64668-822	Velasques do Leste	RN	2023-04-02 16:48:59	2023-04-02 16:48:59
29	29	R. Danielle Uchoa	961	Fundos	d'Oeste	36176-369	Fátima do Norte	AP	2023-04-02 16:48:59	2023-04-02 16:48:59
30	30	Avenida Pâmela Dias	8	Fundos	do Norte	57594-249	Torres do Sul	MT	2023-04-02 16:48:59	2023-04-02 16:48:59
31	31	Rua Arthur	13	Fundos	do Sul	29477-628	Vila Mel	ES	2023-04-02 16:48:59	2023-04-02 16:48:59
32	32	Avenida Barreto	4	Fundos	do Leste	00401-198	Vila Elizabeth	ES	2023-04-02 16:48:59	2023-04-02 16:48:59
33	33	Largo Lúcia Jimenes	3196	Fundos	do Norte	84883-526	Kamila do Leste	MG	2023-04-02 16:48:59	2023-04-02 16:48:59
34	34	Travessa Thiago	82136	Apto. 101	do Norte	64816-544	Porto Cezar d'Oeste	SC	2023-04-02 16:48:59	2023-04-02 16:48:59
35	35	R. Neves	93632	Fundos	do Norte	42589-271	Santa Everton do Sul	RN	2023-04-02 16:48:59	2023-04-02 16:48:59
36	36	Avenida Dener Alves	4329	Sala 202	do Leste	19253-575	Porto Cauan	PA	2023-04-02 16:48:59	2023-04-02 16:48:59
37	37	Rua Camacho	21534	Fundos	do Leste	44488-686	Santos do Norte	ES	2023-04-02 16:48:59	2023-04-02 16:48:59
38	38	Largo Yohanna	63377	Sala 202	do Leste	71073-823	São Breno	MA	2023-04-02 16:48:59	2023-04-02 16:48:59
39	39	R. Pena	6067	Fundos	do Norte	44754-781	Porto Lavínia do Norte	PR	2023-04-02 16:48:59	2023-04-02 16:48:59
40	40	Avenida Rocha	5	Apto. 101	do Norte	28410-563	Cynthia d'Oeste	RR	2023-04-02 16:48:59	2023-04-02 16:48:59
41	41	Av. Simão	747	Apto. 101	do Leste	97034-659	Santacruz do Sul	ES	2023-04-02 16:48:59	2023-04-02 16:48:59
42	42	Rua Alana	52	Apto. 101	do Sul	32813-853	Vila Késia	PE	2023-04-02 16:48:59	2023-04-02 16:48:59
43	43	R. Christian	131	Sala 202	d'Oeste	17456-589	Porto Fábio	MS	2023-04-02 16:48:59	2023-04-02 16:48:59
44	44	R. Ivan	11	Fundos	do Norte	32346-311	Oliveira do Leste	SE	2023-04-02 16:48:59	2023-04-02 16:48:59
45	45	R. William	25	Apto. 101	d'Oeste	10016-626	São Cecília	RR	2023-04-02 16:48:59	2023-04-02 16:48:59
46	46	Av. Maria	423	Apto. 101	do Sul	57774-386	Santa Renan d'Oeste	MS	2023-04-02 16:48:59	2023-04-02 16:48:59
47	47	Av. Everton Paes	54310	Apto. 101	do Norte	75860-766	São Bia	CE	2023-04-02 16:48:59	2023-04-02 16:48:59
51	51	Av. Daniel da Rosa	861	Fundos	d'Oeste	37067-889	Santa Maximiano do Norte	SC	2023-04-02 16:48:59	2023-04-02 16:48:59
52	52	Av. Marisa Deverso	1481	Apto. 101	do Norte	64107-564	Reinaldo do Sul	MS	2023-04-02 16:48:59	2023-04-02 16:48:59
53	53	Avenida Vieira	96370	Sala 202	d'Oeste	64642-389	Valentina do Norte	RJ	2023-04-02 16:48:59	2023-04-02 16:48:59
54	54	Travessa Flávia Balestero	9468	Apto. 101	do Leste	43597-753	Carvalho d'Oeste	BA	2023-04-02 16:48:59	2023-04-02 16:48:59
55	55	R. Pena	9391	Apto. 101	do Sul	67957-098	Tessália d'Oeste	RR	2023-04-02 16:48:59	2023-04-02 16:48:59
56	56	Rua Martinho	19293	Apto. 101	do Leste	81760-945	São Natan	SE	2023-04-02 16:48:59	2023-04-02 16:48:59
57	57	Avenida Cauan	287	Sala 202	do Sul	63944-494	São Dener d'Oeste	GO	2023-04-02 16:48:59	2023-04-02 16:48:59
58	58	Avenida Kauan da Silva	5531	Apto. 101	do Norte	85516-793	Adriano do Norte	MS	2023-04-02 16:48:59	2023-04-02 16:48:59
59	59	Largo Hugo	37577	Sala 202	do Norte	55551-199	Mel d'Oeste	ES	2023-04-02 16:48:59	2023-04-02 16:48:59
60	60	Travessa Vitória	9	Apto. 101	d'Oeste	06160-498	Prado d'Oeste	MT	2023-04-02 16:48:59	2023-04-02 16:48:59
61	61	Travessa Augusto Cortês	53	Apto. 101	do Norte	73794-888	Thalissa do Sul	AL	2023-04-02 16:48:59	2023-04-02 16:48:59
62	62	Rua Cíntia de Arruda	1	Apto. 101	do Norte	32972-309	Galindo do Sul	MS	2023-04-02 16:48:59	2023-04-02 16:48:59
63	63	Rua Verdugo	19	Apto. 101	d'Oeste	62948-643	Franco do Norte	GO	2023-04-02 16:48:59	2023-04-02 16:48:59
64	64	R. Christopher Pereira	43	Fundos	do Sul	55539-163	Porto Pablo do Sul	PA	2023-04-02 16:48:59	2023-04-02 16:48:59
65	65	R. Luis	1	Sala 202	d'Oeste	98330-938	Fonseca do Norte	AC	2023-04-02 16:48:59	2023-04-02 16:48:59
66	66	Travessa Ítalo Serna	55674	Apto. 101	do Leste	22926-697	Porto Sebastião	PR	2023-04-02 16:48:59	2023-04-02 16:48:59
67	67	R. Allan	39	Fundos	do Norte	20653-448	Felipe do Sul	RJ	2023-04-02 16:48:59	2023-04-02 16:48:59
68	68	Rua Bella	4302	Apto. 101	d'Oeste	67554-964	São Thaís d'Oeste	TO	2023-04-02 16:48:59	2023-04-02 16:48:59
69	69	Travessa Yohanna Santiago	7706	Sala 202	d'Oeste	78758-748	Mônica do Sul	AL	2023-04-02 16:48:59	2023-04-02 16:48:59
70	70	Av. Noelí	6872	Apto. 101	d'Oeste	88672-399	Valentin do Leste	MT	2023-04-02 16:48:59	2023-04-02 16:48:59
71	71	Av. Tainara Toledo	66	Sala 202	do Sul	48100-213	São Malu do Norte	SC	2023-04-02 16:48:59	2023-04-02 16:48:59
72	72	Avenida Souza	1	Fundos	do Leste	96423-630	Galhardo do Leste	MT	2023-04-02 16:48:59	2023-04-02 16:48:59
73	73	Travessa Cordeiro	981	Sala 202	d'Oeste	62093-799	Breno do Leste	PB	2023-04-02 16:48:59	2023-04-02 16:48:59
74	74	Av. Angélica da Rosa	81	Apto. 101	do Leste	88007-940	Ferminiano do Sul	SP	2023-04-02 16:48:59	2023-04-02 16:48:59
75	75	Travessa Richard	7	Apto. 101	do Leste	91750-608	de Aguiar do Sul	MT	2023-04-02 16:48:59	2023-04-02 16:48:59
76	76	Rua Solano	53	Fundos	do Norte	74575-645	Porto Pietra	SC	2023-04-02 16:48:59	2023-04-02 16:48:59
77	77	R. Denise Maia	684	Sala 202	do Leste	97754-341	São Aparecida	SP	2023-04-02 16:48:59	2023-04-02 16:48:59
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: om30
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: om30
--

COPY public.migrations (id, migration, batch) FROM stdin;
19	2014_10_12_000000_create_users_table	1
20	2014_10_12_100000_create_password_reset_tokens_table	1
21	2019_08_19_000000_create_failed_jobs_table	1
22	2019_12_14_000001_create_personal_access_tokens_table	1
23	2023_03_31_125634_pacientes__tabela	1
24	2023_03_31_125819_enderecos__tabela	1
\.


--
-- Data for Name: pacientes; Type: TABLE DATA; Schema: public; Owner: om30
--

COPY public.pacientes (id, nome, nome_mae, data_nascimento, cpf, cns, foto, created_at, updated_at) FROM stdin;
2	Dr. José de Freitas Jr.	Dr. Denis Cortês Rivera	2009-04-11	707.229.926-29	i5YqjIap5M92wre	pacientes_fotos/GfFsZhjxSv49qmixl8TMxcij2Q4NgKIcX5bo1lnjgtMmoEdfg3P8en8dTc8deIXufteJRMjVtkAnNMfoMJJjpUU6y5e9P6XYMPGE0rCZOOWb4K3zJ5pjZMBxuyuhgv2cFAJPQHD4pCnWXEi54O0wgzqwfE822zXKzVfZtmmAVZObrXpQD.png	2023-04-02 16:48:59	2023-04-02 16:48:59
3	Mila Colaço D'ávila	Sr. Michael de Freitas	1981-11-10	888.211.057-50	jBMD2lgjfj0NAOT	pacientes_fotos/RKyVnPnzm78hXo2FDqFEDoKURzN9JJGXGkVoOhYiQg20YtoexkqKfFoYGGTOjqd3WOclSlnV4wIJqzU9tDtVOoR8yN9KZSutzLvSdV4SuJVVWw0ESA5jiVRtoopT8rAHa0uFdb3SpfvKwwgnytgIHyZgbXaNbzhiaxNyUXsznI5yNYyMU.png	2023-04-02 16:48:59	2023-04-02 16:48:59
4	Sra. Karine Leon	Suelen Anita Montenegro	1989-09-07	745.800.872-59	tBUnMn3G2Rydgbd	pacientes_fotos/u2t8eGbc3Cjxjwf0KMEh94YbKR2TThGIMnKMoysepYZ3Xbh8PLvFaYeYPuDRC4yKqRFSIkRFuBQmjVfoyDhdyXJlDdjmGZ47IV2f2Ibe2pCMm4yPoI9bhYx22rDXzgJx55T8eG1IOBYhSa1OHAfrDGFQHa3Sq0EJ3Sl5kDd7CUpsKeRcK.png	2023-04-02 16:48:59	2023-04-02 16:48:59
5	Ronaldo Ramos Jr.	Ariana Godói Chaves Sobrinho	1989-08-01	565.151.863-04	w0prYQ0IZYqxjQU	pacientes_fotos/j12a8NtuEI4DKzOne2WS421hmOAysJ8LLBcRdhYyDrcKevIJO2mvS1ZlkDRu0dWiVVrlw2hlPaT2uTbZbrCJc7l8AB7zEBxFMM8Bt0pcqU4pmypP4GpMTC3wUXPTEMhEcWXiAAjHnT73eNpxekPRQHbeWdY6KmEsyPCQEpDKXsqHb80Dg.png	2023-04-02 16:48:59	2023-04-02 16:48:59
6	Dr. Thiago Rivera Jr.	Dr. Allan das Neves Neto	1979-02-13	093.037.108-94	CsNzgpY1FxJqyJi	pacientes_fotos/NiRlo8z9HoI1KGnqUv4Q0vpffZRjEyQ7uw5ONyGjTwVTbPKiJLdYRKsyY71p0JLx10LBGu30e4NQQnQpXjwY3WvfFgBduM7G5l8LdWK5DMhp9DF7YJazoxm70mqCadStr56w1ksmw2f94Pi1QqZ6kPvh0cfZWdBsMd1IXiQKUjQfmPnwR.png	2023-04-02 16:48:59	2023-04-02 16:48:59
7	Dr. Marília Fonseca Sandoval	Sra. Gabrielly Ariane Gil	2021-08-24	352.482.900-74	TSmGsXd1LFP6JMD	pacientes_fotos/wJ15SoeK2VuFZMTqpNzkvccBfuexXmuflFR5WYDI43qtVrPPV4Whjxlaw4i6rmtPhr15q64lGkfSGYAsAk1boSxbNxrfX5kaDTbBpmpB9Wsu1tpYCpV4rRvWjGc5wFOJGJdmP0uha1fWJeQSNRGK0M2mB6T8SsNgwvz68hb5giWMXJ6QT.png	2023-04-02 16:48:59	2023-04-02 16:48:59
8	Sr. Estêvão Vieira Gonçalves Filho	Eduarda Daniele Fernandes Filho	1975-06-21	966.875.699-10	wGysexwGy7XkJ3V	pacientes_fotos/Za5mh9HhL9XYCSTRDQ5JwTbag7QDm5vHR95V6LZ4sPdy10aN70pbXI0fk0InaiIwDgCVO6pUy6G6iTbZ8h9gdyQIrFDxusVN3bLNZA1nLno6wIbkCWAs2i30yEvYy7R63sz0F2PsvPK79VKHyhCPL97uyLrFfVUrrwkXn3PTM6ompo9NW.png	2023-04-02 16:48:59	2023-04-02 16:48:59
9	Reinaldo Emiliano Gomes Jr.	Srta. Sheila Gisela Romero Filho	1980-10-20	701.358.840-71	9IFPN9kr2z4iA1d	pacientes_fotos/P2vxXh83XGajE5McJ2MGCd8v9Kea5Tsrp2YksvbaRAoJ2G2iqRnVv2V4ZjU1q1ugpwqsVhslyUPVIyPJSUZFISC0S9zkubUkhDxSLH8R2ibYa7T1PDMMc8hoB4hZwqpAaJxCE9yI9Z9hHfFpAeZyVxonXw4ysHrjtEs6FX8OmLrm1SSWh.png	2023-04-02 16:48:59	2023-04-02 16:48:59
10	Sra. Hortência Rebeca Gusmão Jr.	Giovana Serna Jr.	1987-04-06	202.564.693-34	Rr5AvRyJCLVRXZJ	pacientes_fotos/p0maGMiVM36ABOTbzO0kxMUvl1z0BPWV11P7WH1QuBgl58J6l9aYtTJgity7Msyw3xuiiQRalOIY6g027Gf72F2QtE4fI6CQBxDQy2KxVlW79ftTibTlD6jaAw1QtUEoNplnRr3NkQidukhh0y06KvtK8v7WNjMoWBWoMCxzKjFn5AXap.png	2023-04-02 16:48:59	2023-04-02 16:48:59
11	Dr. Alessandro de Oliveira Jr.	Sr. Gian Giovane Ortiz Sobrinho	2001-08-31	208.310.407-26	5pJV2VsD4dxS8oE	pacientes_fotos/l1Wi0ylrC4TnYqAfP5yqBhqVsvBUcP9b7ez35zrCopuwT5FhnC83Yt0BI71NpSE6CXP3Ngm2xI4suYxPx4XjPSW7iBOvBh1R2tcyUyNjeRsODKzWrgunCDZkAV6vWnBiHkGCRXxI9hyLeqkWlRVgKGn7a347oWlCwrPSl9hJOvdNHPYLr.png	2023-04-02 16:48:59	2023-04-02 16:48:59
12	Diogo Santiago	Srta. Miriam Montenegro Roque	1973-01-17	408.979.402-10	F3NZBpyL3MTqBvc	pacientes_fotos/nfybiAS6HOOaWLxlqwecFtdVXYzyIW9BQegjC2TXjDpu79ON3zpWKNyt7Q4BJq8ykeEp9xBTacQZyQk4c9qg5vrYQAVG8tIeNy7keOeTVvmUBfLchmnNp0Sfjr7X6dZJUmjAfDikYWzlN0mx2fvVlSz2xSWeGgR075dWZ8s30IKK5Sa4D.png	2023-04-02 16:48:59	2023-04-02 16:48:59
13	Renato Ivan Romero	Reinaldo Martinho Jimenes Jr.	2006-11-14	244.502.342-43	UJsk7qbFpCr5jOM	pacientes_fotos/696GgsucfPt7OPPNcdOHdvRDuhSCuBCeQnH5U6jwxtF7LXyoFNXdsp4xPFqgs9yk44eKx5yzW095zz9dtvR7OYpIbtX1YmngEk5HgzyMwBB4epR90Om9ypkA8KTE39F4m9iZkb6RuVZaLzN3QzO3rgljVUqOODrEEEGIwyFgb6Bw65nhO.png	2023-04-02 16:48:59	2023-04-02 16:48:59
14	Dr. Patrícia Galhardo D'ávila Filho	Manuela Lira Brito	1996-12-11	001.904.259-03	zEOjMi00ALLPMJF	pacientes_fotos/Fp0x931emlbfCSballQXb0O6dX8BOSr2rodPe0QpKdd7grIBuyQVFhMLCVRphGIaK3xfpak7Msbxmr5zPgINrniA9uJg1dnPKbuhmpkm6Cuq08i6ZQqSURMjq1kzI1BPKChe1aG0aEdu6J8m5E8J3nIkTQ6d85LlVifKZnHVLZw969AbI.png	2023-04-02 16:48:59	2023-04-02 16:48:59
15	Heloise Rezende	Otávio Deverso Filho	1981-08-19	154.472.009-20	aDRxiBI6LkhvMtY	pacientes_fotos/EQPcWhUYPLNpsj3YH2qgkt7egZ4xhZUZoAdcuH6ou9nbxMQzsJzwuzKwApdRSZKjRyioyZbwPVUHzqRmKofPFPwhJdn5wB93bODNwny7pbRoNyQg3fLKcoMtkqcqYLU2WRkFl9lPRaT0oYjkmkF4P3YIAE8WgX8TfcOmXfb7d8pc5abZJ.png	2023-04-02 16:48:59	2023-04-02 16:48:59
16	Dr. Ornela Verdara Sobrinho	Samara Garcia	2018-05-03	743.123.220-90	eB0qX582cYQCdvE	pacientes_fotos/li1nLJtDJ3jYZ1Nnz9Uhju6vnrjYQFHf9Xd1GprOkcKBtw6Cy7pZ7EL1DcmXdz79ek1qbdxuM3hxkUzGFahKfcDQWexuq77M8mTMmUZZawkHdR8k4r4PIeqxOOmMZm7B9zEf3vIeVhKjfxGxAkMO8gBSfYhjPjT9EeTMWCZ2sBy5NAO5t.png	2023-04-02 16:48:59	2023-04-02 16:48:59
17	Carol Julieta Ortiz Sobrinho	Sr. Manuel Gomes	2005-07-29	598.582.112-95	CaEjNqYnyAVgHBM	pacientes_fotos/Kdgxm8nQgrEXdAVHOVBwbKrxWH1wtpyAiHZvg51Opc9M10F17NaBMq9anvFJ0VXG4zWM2sqYLHNgog3qVatekktXUXjoPWfLxomkN9AETlf2ezcw9eGJUn3a6b9ihsGjBobOkgf0pJ7JcNBeKWsLdWDHXBFHOVeK7gVL2TUnBcY6lLepS.png	2023-04-02 16:48:59	2023-04-02 16:48:59
18	Simone Giovana Bezerra	Lilian Luara Alcantara	1979-08-14	261.632.953-07	s9FoLsC8qwIHjCH	pacientes_fotos/qQsDJnoj9eCvKb1ZPPISUmrZxFP86YzpdvhLcbuCLZRyhtwnRd8Di7rvmmBTMfuSmzey2JjZ7G6Cx0C9HVzWEpsNORQ5S2qkFzqjZZ0uq1QAH6cr0LAeManQbzhG86ItNeoT6OuQyZcTMlutKnQdKsqX8xqqHXTZ0hB4nUr9BYyBfCRa4.png	2023-04-02 16:48:59	2023-04-02 16:48:59
19	Matheus Rios Queirós Sobrinho	Sr. Simon Dener Corona	2015-11-10	168.502.359-23	txiYnbhkNgKjENJ	pacientes_fotos/rxw2FUTpsdAoLCLmQbvsTZI2kb8d6tCwdTeXxDy1WMcedezeqGWq8nqPUsckl0Ch5rqkqnHoH7jruf7P77opRwcNFycaZAHgMTPIbgxqJsT7hh5GHBxTGPxPmB49lRSMC3OA4DEQbkZdMFMHYGR5ugYJCgQlrupilaHHmQ8uLDY5m0z7k.png	2023-04-02 16:48:59	2023-04-02 16:48:59
20	Dr. Louise Rivera Jr.	Cléber André Flores	2011-10-27	308.196.235-80	MBHibxw1pjryKJ2	pacientes_fotos/OoGVuGWLI0xF5umxkDY3X3ZXm4N7COBh9b4zVybVVFidSRdjTddSGWmTICTB4bl6XwrczHHcZCLNZZoNINh7iIYkPMQ1iiYQqfpy6OXbT6GlA61xDR8yHz7bzMM0MXy6n08k0fZwT6id8vpNU7qrsDemOzBUtVssvOAMai7pC2eB0ZFfj.png	2023-04-02 16:48:59	2023-04-02 16:48:59
21	Karine Ohana Padilha	Sra. Mariah Laura Mascarenhas Filho	1974-01-30	786.425.067-09	mX6KCjsTMuCg6tQ	pacientes_fotos/Rr5Gu179CnKx3rFviNfZzKbzdCA6lvfc8DtrruvAi60eKL6IkJapUG2lMVO2CkytEKqLjWIT6od7S2kOTDSIJSnI0btksMYASmAa9dCcjy2iEqWDNFc7dcuQQLY2T8TeWCi8vM8hkyLhi4DSFocjpSkoworRPggULdyRY7gGbJUeSX8OK.png	2023-04-02 16:48:59	2023-04-02 16:48:59
22	Sr. Noel Grego	Nicolas Antônio Cruz	1994-08-26	952.361.372-33	8U1kYZ8Q8f99Hqo	pacientes_fotos/cWvnqZFaivkxS7nH54UMhJhAnv2CdJbtGNEDk9M09nKziF556pe8pCxbQ1l66Y0NjIWLmYVgfIxh8oM9kA5sVBIsoNxdGAv1jhwxUCua8oDc0yX7UaPgQCZJFwOqGNjHDE5OOtlVTNtdbhFnDbaACFzuxBLmALSHsxLfxrCjMSNYzFM3c.png	2023-04-02 16:48:59	2023-04-02 16:48:59
23	Naomi Pena Filho	Dr. Larissa Ferreira Tamoio	1977-02-21	203.429.601-05	HBd28zBAPAs0uVa	pacientes_fotos/cdE18MZQzEvdnMuu3Qy6HdT3OLACElhhgD5p46SHZo1T4WQrwNpuqPIkVjmDsWx1FwhHpqGqCIZXeFdBoOP120yrDsPHgWy2SAWt2y3YNK2NsBVpHiB8938EoBO345hUtsuH8d3j6pfliy2bIzVprPWovbxyEikbOKraYTPlfObZro5BA.png	2023-04-02 16:48:59	2023-04-02 16:48:59
1	Sra. Karen Maia	Elisa Abgail Espinoza	2001-09-26	846.452.450-15	N1IoWBnoosWfdzl	pacientes_fotos/5qJ6Ag8kgYy809L7gY7HGLuvqWXR71cihUigi5Cd.png	2023-04-02 16:48:59	2023-04-03 23:31:50
24	Joyce Matos Filho	Dr. Benício Samuel da Silva Jr.	1971-12-25	288.121.510-60	fVUc1GXXgU0FcUF	pacientes_fotos/CFO3ShjyczN8MSHlOQFZYS67G31ZtLOrPwy8IzqHhj8PnqcLMYvlP6Nm4BFjQzjLrag4RsZQgnOsx5daza9zDfwn7BA5Xxl0KzERaBWqgA82mgzUJYQHGUo7DlZizrRTQxtZKQn9aT3JSLwi4oW7Gcxrq14DjDeapMLLzFejrMtohzNyH.png	2023-04-02 16:48:59	2023-04-02 16:48:59
25	Srta. Suzana Aragão	Lúcia Galhardo Toledo Jr.	2013-10-31	296.654.181-49	v18KLlGvjvzeIal	pacientes_fotos/7ppZ2ewwiYPcHi3G39qEO1Ww6MhbjCBXI3RGruFKGmonGiHQlKfdWRcP5ileDplaivTC2YzT2fPj1PKt137RnpEfsLsCDnBDaAyYLnCTmdcfiAwCnBpRklzPSeHrSw95l6Sa8xkf6HqumrwvuNqBNnkQy7FvaxNMjj6TXFYIbhgGG6DOW.png	2023-04-02 16:48:59	2023-04-02 16:48:59
26	Denis Davi das Neves	Lorena Estrada Rico Jr.	2014-08-29	015.483.065-84	pd2ivlzENry4Nrw	pacientes_fotos/E3jJbuLYFpaie5E99B4bKZiSngwjFtZzb4Wf0kpGV027zuBx5HsxcyNsP5oWsDFVgskIn81Hkx4BvBL4KNivEXIwJiYhD0ntjLCL90Vxf8KPk6rxwwHuewHaCkxRsnyzYtEvuQEabanejvteVebOPBkR6I18oNjJ7nGoLhRR1kqVlY5tu.png	2023-04-02 16:48:59	2023-04-02 16:48:59
27	Josué Wagner Rezende Filho	Samara Ávila Neto	1999-06-22	112.823.008-90	lCNulmL2uubjPmW	pacientes_fotos/EZvSZI2Gd0slXQyqMNolhNoptM7nKC6Hzf2dKPcmlUxD3pvE6w67oC9HOgMSAFkSlwr4W6967ikTRSWtdWntJhbyC1pcTi6NPLKJigJMAzNRvg2rfV5B6XEmgzyc7fm2moYOjp05Sk8othJiFeOhjtZA5lCSE5mkIaJxGdsWsnhfjbrKd.png	2023-04-02 16:48:59	2023-04-02 16:48:59
28	Sr. Willian Benez	Gean Camacho Ávila Sobrinho	2011-04-17	119.199.611-51	RbuAky64oTuB53Q	pacientes_fotos/ASDSKH4RCxKK8VyMZMckTIwRyROSzGfuBPFHncmL9qsnPPVLZzvV5K8M2CWJ5qynJpvIMcCJ8R020j2wA3GDYHztwbVVfJaO5lIr1U9h4JABlA22FNaIuRKW0rTtc3DaisSe6Stybcx614iR6qnyDnj70OBdoF3zfgxzLJQRDlGTN2irG.png	2023-04-02 16:48:59	2023-04-02 16:48:59
29	Caroline Padrão	Sr. Ícaro Correia Roque Filho	1972-07-04	407.895.591-61	0kUhg5aCa4qC5qn	pacientes_fotos/8St847FABZ1reDwGZ2tJ9a83Vkal9k4IrvRvPS3TQNlOeejmdEy7zFg7etbY38lvxc5yR6TZEIrvVfd8ECdosQjVES9KToJaw4XyyMEsTufMUTo2TETWjqyPNJX4vnHl5ykbt6odZ9PQMOlXZnDJpCoeNp4lDIyRxXaKBA8eVv4Lx6Asx.png	2023-04-02 16:48:59	2023-04-02 16:48:59
30	Fátima de Aguiar Jr.	Sr. Leo Reis Filho	1988-10-11	784.744.610-30	WkHDy04SJB06qUt	pacientes_fotos/D8qcgyOd4aRONvfyAi8Zi7EEMxR391cXmU6b7D8AtS0T3996z7pwszqJkzF9nDg9oVm60nIAOtwuXTrMxuzsmVuu9XMjAJr2rlblBfxsMQw3hDJ4aLsUqY90301C44d12CqFXaGBfjEKVA7QGJ9kF1sEXrU29vsRMWTmCepzlwfbMxtEk.png	2023-04-02 16:48:59	2023-04-02 16:48:59
31	Diogo Lourenço Jr.	Diogo Fidalgo	2018-09-19	778.311.813-50	xkQf1KytV3xk84Y	pacientes_fotos/p27KhLBG65eER2Mo4mvtZjiCvZ5uuTFxUchuU9QO5iESd7z7poSWBs4ERvCuUGDAijowvfognOxIvymkZ9ApwQwnc8fvMBumGB51AkjHrsF1wGw2xQYgPOiGI6LCfvFBVifWN3a9p8bWAX7FRiFTJwQCsJto8L49Ht8lKTVJqFivsPvpz.png	2023-04-02 16:48:59	2023-04-02 16:48:59
32	Sr. Denis Abreu Neto	Stella Esteves Valência	2011-03-16	947.846.074-98	fkWd5yPsly1hOkm	pacientes_fotos/8X0G6gav3gqY1ATIcV0gSiQUNduQEjWc5639CAxdH9gEgPo8nNVLEV6rAPSFXEmhU6pRHzi4nv9tjenUS5A7FIBbUY9c6NfzNl4m0r0f8iXqtoB0MWWZPjwrd4mNuult1bwZL9g01Qxi8XYecjXLpLXVI75jQpI2vll0qgAjlgA404vwi.png	2023-04-02 16:48:59	2023-04-02 16:48:59
33	Srta. Laiane Mari Vasques	Ketlin Teles	2003-01-03	940.357.026-17	NwyrLgoG9ogUj6v	pacientes_fotos/djId2lR9fCuHu6puPL7pL2Gvgrk3h0l42TB49LomS0Y7SgKV2AsOkXShlnSaqxMKCnUnjc7uUJo2N0wyWNFvGt20HCdYQJQHmURn1novsnyVJPgpbgh7QvxXbNG4FZED9N31RXoBvrNSDom71qzZC6yIUKJyWdEpHlnB5Y7ZlwdJjTYRb.png	2023-04-02 16:48:59	2023-04-02 16:48:59
34	Joaquin de Arruda Rico Filho	William Guilherme Saito	1977-01-26	607.730.129-90	wrflFLxWlFjwkAO	pacientes_fotos/krBz7D3a4pBNswFnOsR86Pl0udHMEowEt7sD6kwbWFm8mFfZh5wanHrI6UcQpMrCq1u1AtciXjAmAQl0nBCY0MY8Q1oUBqa56n7k91bEW8Bky78R6DjSy1TysSYQigtTYRcnGiMvLSFHdd88ksAgVloyrQ1y9eSZ0P8pqnYuCAHtcfG5J.png	2023-04-02 16:48:59	2023-04-02 16:48:59
35	Gustavo Colaço Neto	Dr. Maitê Ariana Bezerra	2001-05-03	837.614.251-80	5XbALDwyQbiVuXx	pacientes_fotos/5dqTJIlYfZPQEzMgg59RCnWAYS16PhNQJN1QnAPc6iSnAQ9NnKtAzcxACQYSPXSLFVASTYYsAhQ0C0vjMQeQbIp6Fqm3r432pHL0MAkOFdmeDT4A83c6bkuTxbp0ugDXXwRlpjDl9lawsb9IbCDP1xVOnO1KmMwo8CF7GelessV2HC4ef.png	2023-04-02 16:48:59	2023-04-02 16:48:59
36	Dr. Larissa Faria	Everton Bittencourt Jr.	1984-03-26	811.857.938-79	9EyVIotHnCs66Vs	pacientes_fotos/lD2b3ReFIiKs3eIT48t7iq3iAGAHAEBJqb0LTouiJxRkav1KWieyYPXBfFMCCeM67D2sRVmEN6QuRISQwENxjpzAafbd61Gsr4A5mvthb61YR8vPna4aHrohyBILkmJdnqy1YdIw4FomS9VcLp2U7YmSEILgQXJfHlecKMSUB4o7WlXIc.png	2023-04-02 16:48:59	2023-04-02 16:48:59
37	Verônica Barreto	Sr. Simão Faria	1987-03-05	012.652.313-46	IeEA5Jag4Rjb5nA	pacientes_fotos/sNtA4xWRe1BGs8liA1FcHkJxSVzz9mNtykmlksKOQUOzUSmSgro2NUlm0rMNsa0kBSBrVn11ZoXsYM9hC7KOWGuP3SgSOshbjbuIrAizewPcorjBYY0Y33H0KkTR0VRDwiNkKGdDlLjeT0AK8av3FgYMJR0OWjnyVGbPVg23WI5GwZWRv.png	2023-04-02 16:48:59	2023-04-02 16:48:59
38	Danilo Valentin Beltrão	Dr. Raphael Franco	1982-08-24	283.959.673-30	ZphWNiKQ2lFptrk	pacientes_fotos/kciP5AvpUAYjsNorGvErnM3xsucMNsfkrmjRcyDx2P4RthOjzQeFhP8lVWez4hcsKto61Ddr66Wtt5KSjTajmMV3gVSzpaLjct3m1V9JBVMFpTNnjqsOhvtnBe42bOeITOvEDhzFmcs2wZaLxAHqIj6FIWF3RiycKs2bZSy0JE9tz9Zii.png	2023-04-02 16:48:59	2023-04-02 16:48:59
39	Kauan George Ferraz	Mauro Pontes Medina	1972-09-02	622.804.317-00	jzTBa33yKOtcQdz	pacientes_fotos/w7Sm1BagYphdwPT3wduY60LnWz98C2qLA1JUbUvHvA04l2wria1g3iqlwASj6NIDioMngHtRayZERjz5ANO5AaRbRXQc2eFix5xIVTPG0NhIbF5Gqlo2kodIsokh8tAKgefsgxmBAklSmx43GqGlcn5cB4X6tt4X7xkbeYgat8L0mnJdM.png	2023-04-02 16:48:59	2023-04-02 16:48:59
40	Luna Rocha Leon Sobrinho	Sr. César Delvalle	1998-06-26	277.715.325-60	QEFre4b9qZM5BQx	pacientes_fotos/AhFoRZmzH3SlJPnFzUbqOztb5JZpjObhkg7EfHPPc5O2Jo48JEpykWWrZ4sCl1h4hDMODNwN7GbLAVoE9wS2Nf6rsZngjLvGLCPCzXLTIhuDH8nLQOZcng7avQcs8Nh6px1TJyQutZ12nL436rkMhl1BbsjIxnYMTrEfmKyWLYh4txVgu.png	2023-04-02 16:48:59	2023-04-02 16:48:59
41	Sra. Laura Pacheco	Dr. Eunice Giovana Gomes Sobrinho	2005-11-30	681.094.569-52	Vt7mGwLBqMJpys9	pacientes_fotos/fnolzllLuYMVKeJgBrJJvUapiY4WtZEBGECiHbaHeJDv1Ll5rekEVq8uKi9sh5TGVe5O5GFdh4X3iUvjgKxS5hZ0kgmsgl54kBwX2kx3klKdrzwl4d5TRRS5ZaeKUkdEkHKJHH0S4FQqllzs4blVmc9rqpCdcFrX2WLuoObyu3cGb3ZkY.png	2023-04-02 16:48:59	2023-04-02 16:48:59
42	Dr. Hortência Rico	Dr. Elias Valdez	1972-01-02	222.990.847-20	mNS8MbTOF47IB39	pacientes_fotos/0pHnMPjcU9XMWBU7dbckkgxEWFcjueNdZtxf3t0awa1jKWkR9dEqJHHyBscxjyTpsvlbDxzd8HdEjngHsL16LgLVxNmeFhw2bN4a0jUl7xSk47Jjvsb1T3uZ615pz4UC9HynM6gdpks0bqqnqqadEc9ak5Pe0LqI9CUjetYcjCqSwffo1.png	2023-04-02 16:48:59	2023-04-02 16:48:59
43	Dr. Valentin Serrano Neto	Santiago Jefferson Toledo	2019-01-16	887.227.719-13	lKte9XAe13zMQPZ	pacientes_fotos/O7SViydZPbA92fuTxj7wIZelHLxNZyvAOTRMqgOlX0ITIDRqFUHxZa3cj84acbgZKvSlRsBRWoFyXAJwCc7aYAYnQC88NKpf9jwRsLmymUhk1brhD7Yh9HGrUH9IVE0urLbLYhzXB3FctYkAb5ofWSGA1NWWS20OVrnjPXST1DepWXNYH.png	2023-04-02 16:48:59	2023-04-02 16:48:59
44	Dr. Demian Teles Neto	Hugo Galindo Assunção	2016-12-06	229.794.604-00	eU0qfwhZi2srG8Z	pacientes_fotos/hz4yMpu86dkvmTb94kEl2g9w6rhXYZAmCtDaQtOJCF87bpcwmRpmSlE3VdmNvloWiA8voOuyBjxBYhk39ROE3Bf9giJCdKp7vCIjSTyNlETSFEuCPgJ5Llw6cufdXwcLigprnbKUWLiybPwxoc85s9DkahIRGf4xW9UTDS0hRDRtIS374.png	2023-04-02 16:48:59	2023-04-02 16:48:59
45	Srta. Pâmela Salazar Sobrinho	Sr. Juan Marin Ferreira	1980-10-28	316.441.484-63	9SrMA05VgpN6w9x	pacientes_fotos/OPnGBM1aWU8oAMVOa5nCGLGbyveZ6rCfSV2ILGuhVLUPat0a9PULNl3sLqEP1dRDVb4ISlAygITDLXbCYLUN2OKovfRxxmEFTdRmYO14xlfZePlqRYQB5pAMR44bh4O1gK0iYaVMHJGujjs86QxCSNetJ5oULfvSp3z3GODkM3TG768wH.png	2023-04-02 16:48:59	2023-04-02 16:48:59
46	Sra. Ellen de Oliveira Feliciano Neto	Dr. Ariana Taís Zaragoça	1989-07-23	477.282.765-06	Zo9vcg2ocjisglr	pacientes_fotos/8kayuBkZ2X0LX0bDbsMMWmfE9OPJWnC5xUNzN8HdHUy57275RgPDLESC9x2f0682UaMWmx09epNNAvhLvV2o2iDmxqLfpLm8D0RvzhoaR6cHS0AcU59cTbr2MHb2aeoSZ75iDmd3TbHyd2Meb0IiE2jdbMJVzQtLs3GdkUM3wa1882uJq.png	2023-04-02 16:48:59	2023-04-02 16:48:59
47	Sra. Louise Renata Faro Neto	Fábio Corona Pontes	2001-05-10	690.303.345-92	2nMi8Vy0ysj1OUI	pacientes_fotos/siOJU011nBwWgPTtWVzse7BgnPAUIGmkGnUxPAAXVWi6fuccWweaH8lDUcn3U11ppOq41J7BkL0gcEp9mMCnRtn8w1JbiI0TR7KHLsW7ptkoLNQOHNMoU5d6pYQEID4P3t6aHle57Xg19tcuUldRMh3lHzZvOpnHCmEVxTfmDxOURKIiZ.png	2023-04-02 16:48:59	2023-04-02 16:48:59
51	Dr. Reinaldo Everton Batista	Raphael Chaves Sobrinho	1987-07-08	620.527.972-03	jVx6dgoJ6Purkys	pacientes_fotos/FeQmQcyDIkrA1kvBqUArB2TunpEsLrKh9TeFrzZ8F7R6jrTpWBnxsRWt3xtJoTdVrvemDLQoib5gS5B88s3uXdIlZX7YYzH8J4AavLdhZMur8MQl43axaqJ39edZ7CzauRtdnMdDzZd3Qkixe2sePly5nV9Ts9kne4OYeNLEvdGgoYWFd.png	2023-04-02 16:48:59	2023-04-02 16:48:59
52	Dr. Anderson Joaquim Cortês Sobrinho	Sra. Alexa da Cruz Franco Jr.	1999-01-08	594.655.330-50	efdv69V36npDeFz	pacientes_fotos/em15693nO6n8bSL3HswXdwymahYCV94gGaQYxPlIDGCwXJ8tqQo3EpiCUpKjOgCfux3ZtJQQuEbe3GchtohzFc4vRZc7GnEkvU5Xy1veJJtCTKgDMTAh3EWOcf55I13CBOesxrT5h2SsKC2uBRPPscWPtOkokW3RQzqpLAaNlezFYOag5.png	2023-04-02 16:48:59	2023-04-02 16:48:59
53	Dr. Nicolas Adriel Ávila Sobrinho	Márcio Ferreira Jr.	1984-02-01	579.543.273-37	7DCMUmv8xs1wdhD	pacientes_fotos/VrBXkt71bbiwCqcLuLTwSnvrodWk54l3SSJMm27sIDBb6lvmhjs1Tx3KZG2jzHmM3aLRU2gnNlua2jeUlZcxKdDzkJqukO4a82g10cRCPgwDwPZEboY3NGYQLghnxmFbl1kOMWyqDXD4HcNY942T3BwX9Imc15JVK9broCNfahbyCwyOX.png	2023-04-02 16:48:59	2023-04-02 16:48:59
54	Mirela Rangel Neto	Srta. Tainara Meireles Neto	1994-04-13	815.130.360-33	faywEmgZhXSBhNQ	pacientes_fotos/XgHV8289OVbovswUA3NcsKGTJFnCAlskRW9MY03Bu5mAjU0Fr1rUTCL7dbI8nB14YInXG8yh9itHZQ7nU2ww8tOxQc4wCnS6c0O94mWHUvGB0WkTSdl2VTiDuA8mYPb6eayP5fxp05X1IZPwnd9cqMR4cLK9GgWceoeE9VtKhJUDmkCP9.png	2023-04-02 16:48:59	2023-04-02 16:48:59
55	Dr. Evandro Perez	Dr. Gabrielle Fátima Gil Filho	2002-03-15	457.832.850-30	CjOhCXeCdVaKOCX	pacientes_fotos/qYtq8384fEAQgHWhqWRxlOOiEjLrXJRlXhxMSQAqYBuFuDPy6okAAbngxCiyT5YDHR4Qk4IVQQY0j4i2Q7RKVpNCRwg98F4kjYddEaZ1IDYgEHSHtUw4WRirIGaeJ7a6hHiymAU3hYyuPByvwGSMpubaycoY9kYE4cJrblRM3jxQwMSZ8.png	2023-04-02 16:48:59	2023-04-02 16:48:59
56	Srta. Vanessa Pontes	Poliana Correia Salazar Filho	2017-11-25	745.384.507-66	ZJaAn9m7rn3J7jV	pacientes_fotos/5qp8TU3gNbasFdiui17CeAT0srwijB2jCyKcVtuBjPPQroc3cz3SbdPJhLDVZTFeW4lvjv4IY3jnLTqbikVY78DQsdJccDDFegznLB4IoWqBcm8W49bDxjYydRL8V4Tnjo6D3M8xfJSZYBPPWmJEqJ6FjqboXmaAnmICPqvC5h6bgT6C5.png	2023-04-02 16:48:59	2023-04-02 16:48:59
57	Cristina Ortega Paz	Dr. Anita Cervantes	2020-08-04	481.120.987-78	jqAfc6akZEZcp7o	pacientes_fotos/8YwCwO1hjLbqktjiovyFn4PY8e32KmO7XpXcJhu7IKJYTDAyv5zf0ckPacJCvZJzN7XofdWIGCLtt6uBKy6ALMeFUvmw5RvD7vPDaa2zQT9jfycGievapfEf7saVT99iewZbxHhZgP8CouwmnPyb3O0J9GX9fC3wxP8HuNZcbGYlrr37d.png	2023-04-02 16:48:59	2023-04-02 16:48:59
58	Luiz Cláudio Santana Filho	Dr. Regina Neves Vega	2017-12-06	654.143.613-47	wYR6U1XkQFwbNyX	pacientes_fotos/ugHlMgLY2Pz089i5XfydRPP6w2cEoRYLJocGzOy2xQhe4Ta6Vy2a251K1TTDVb0O3MPTzT5AVTpr7sy55duKgQXqTB8LCmNyV3EklC7iny30nPB2T61GIC6SwXqhQL6VU0noxotzDq6gG7ws3Vu4DzZASLeUofEpIGcgb5f7LcOxbkYyB.png	2023-04-02 16:48:59	2023-04-02 16:48:59
59	Willian Renan Maia Sobrinho	Dr. Beatriz Iasmin Medina	2005-03-27	846.091.394-56	6ok4pWPDJLRivBc	pacientes_fotos/WgiAPrn81arTNVRXgbit2lZMAKD3nErm94shII3FJtZ6R4nq0E33bAkRFiNTch7542r1kFlPoAy07UP7OC0m1y4NbRXuVqCLvtHTeXagUnEb0ng5UdqGmmsyMiuaUF1W6CtqecEmDdSUNOavOYcVJxbnxMJN9YdLhSBV909FHu3e2zL1o.png	2023-04-02 16:48:59	2023-04-02 16:48:59
60	Dr. Mônica Alícia Furtado Neto	Sra. Lorena Tatiane Lutero Neto	1996-04-23	834.450.840-17	lWAzMLRdKxiyy1h	pacientes_fotos/lMLQ6FXlwj3wGN4j9IhjOrGeGNempOvNOoHqt86HXcOkQBLWpLAMFwgMgjWkAgHC20wCDfaJes7VZZcoSEEimiRLOmABgjtuaqaEnEMhytwVcX1IKvzHuBNvFnpdf2XMJoqaCeWuRwWDbeCjpSu7Ckci6qmHB9tOvlRZgh8hWKUankpGI.png	2023-04-02 16:48:59	2023-04-02 16:48:59
61	Mateus Reis	Cauan das Neves Godói	2012-03-04	992.041.692-49	wcLwsUO6r5rZkzd	pacientes_fotos/EXN1rIPCUJPO6wsW5r2EE6WOkPVEMGF3vyAVb4M05Gx2pz6aAgNYPfHn6KvV445MaSLTq5R94uhx5xNL8cHOu6wurRiruUpgW8Hq0gB9cTJdlWxQBVK1l56XgCntRrAtg09yE9AoVqYhNvwi3S2hhhDtiqNL2AWBfqHjqhXalbBVSVywy.png	2023-04-02 16:48:59	2023-04-02 16:48:59
62	Dr. Flávio Cauan Marin	Leo Cléber Vale	1975-07-27	721.092.049-82	JKhkmqtF4LdsE1l	pacientes_fotos/z8MFNe8xkDBP2acHaWMvvpNGnef8ZmhfBmSiodlU33MCiZYD8pZhTE5pH63tj1BILQqFh1DbHLgphoShAgM0T6i7w29F2qxEihy1M4PObvBEq8q5D0VRN0mvLLSNRdInRGbR414VvdjoB2iOXGsBW8rMlitMASb3tvM59MzRhlm7ROTxI.png	2023-04-02 16:48:59	2023-04-02 16:48:59
63	Srta. Alessandra Mendes Pereira	Sra. Poliana Dominato Delgado	2015-09-02	231.495.831-44	tJXuqVPwVrhpzLI	pacientes_fotos/cVYiJQSyeYLM97Ww2aNfZn40XZcNEHzBACid92IRcxSFluNy4bbYWZK8ZlkqgIUvu4G7EFpih1m7LTNmrUD4aVL02XpdeNwf9Lp9cL7lUBKe8OuKrGVcO7XtpWHA3IHZqOkbyQtMEvgLI2eN88V37OA3BCN84Ob1jcLcCUIvh1IDGxCiB.png	2023-04-02 16:48:59	2023-04-02 16:48:59
64	Sra. Franciele Gonçalves	Francisco Maia Aragão	2007-11-23	109.614.633-92	Sk9uNObSE1ehwVg	pacientes_fotos/NhHNlVS7phB5ObqPqftqs4LbNuZWYY4LaqVsF2Yr29GHeyMVXHtLrWo4bAhmvK5hFuJnTMOhvoCG6GGBvMtdbyMmQtBUpfJbxoNZGf7twEf3gjBfBsp8y9E4EsneIxL5Fua3LW23dJIW3j6vSgKrPe0D1mYW4IzZl9WhZVPl5VFA53AfQ.png	2023-04-02 16:48:59	2023-04-02 16:48:59
65	Sr. Théo Santiago Faria	Sr. Wagner Valentin Medina	1987-05-27	087.895.029-06	2JLgnNoDGPsKhm8	pacientes_fotos/UodEiToINyWqk6HOYXYIiH2WU0kZNNbKpJwYaCiWd9lpOWrk95mJsuFw9ZsXYAUSIJOWfkVTQIXMjyzfylkPnbBE06EX8Xq9bowbENOxdFZEkhTPWSCr7BmmPe3ieEciijKQ1MWr1tF1B5eZ4muHNZCJJxTE6zV97m6QtJOipayG3CNfn.png	2023-04-02 16:48:59	2023-04-02 16:48:59
66	Lucio Daniel Camacho Jr.	Larissa Maldonado Flores	1978-01-30	546.993.166-89	sIM8P9bA6TLCadQ	pacientes_fotos/dTuVZX40mhd01E09EciRg8Hvf5tLigyoAvNY4cKzYhUsRKUyoOCu9deSqNOgJy1eZBXb4IHzyJnMUtgYRpFK3Zd383bba3kKQDu2TvryqI2hjrgzeLQ8KOLxR75xrR5HP3g3bt1j1jJD5wFdm4PzIdzRPhZCK1STRn2JadSr3hnHvwpRe.png	2023-04-02 16:48:59	2023-04-02 16:48:59
67	Eloah Sanches Sales	Srta. Roberta Lavínia Roque Filho	1975-05-01	488.461.660-00	vhYdYLIfAjQGhh6	pacientes_fotos/PN9j6YV0lDyRHmDZM9ojv5a54grBQpBzZj2pc1njjBZQlwpW1ECUzTYAWoTBBGbGrqcMdD11Z2yyXAey2gl1kuhXIee9WP2IAnNRe7j8ncPU4gXTUVsLU9cWGmejcN7HyXpSvZ5BxrEBt4woFSFFyMmkmOCBRMunBSATzcPY7ZKDFjE9p.png	2023-04-02 16:48:59	2023-04-02 16:48:59
68	Inácio Valentin Filho	Kléber D'ávila Sobrinho	1973-04-24	719.493.807-34	gyCa0Tea0yd6ydk	pacientes_fotos/VYRCaBJGSUB1Spr2yW1r6x8B4tRE59YSAxy7ElDaWRrXWTWVYIcrhnZfaUcD6mYfEHHoz8cUus5KmyeDNrdrl9qlMumOlVj56JPmyaoiucm56RIKfdcL173ya6lP3ZwRapMhcFvqap0OzDP22124qLqB4aqRyO1hLETRoFKpeE9Tde6Lv.png	2023-04-02 16:48:59	2023-04-02 16:48:59
69	Henrique Ramos Saraiva Sobrinho	Carolina Bárbara Faria Jr.	2013-12-04	417.129.433-91	J6vmdfoLyltoz3a	pacientes_fotos/7Lf4rkKwjSK2Ajpf7HLPjnSPuKTB3DDaqOb41Mnd28QeLepc66IueNjAiGZcHF1abzVKtwNWIozzQv7C2M3PclLomNuJhiiPQtMqpl0Lc83zzbcxbZhJwziFeSjm4snsx4VB3BCSG3qWTuwlLPhKns19HynxPRlJvZJOXPVcs2xobTftA.png	2023-04-02 16:48:59	2023-04-02 16:48:59
70	Sra. Júlia Matos	Dr. Sérgio Hernani Queirós	2010-07-05	554.386.434-58	WTqqCvQyp8YwWrY	pacientes_fotos/NXBssaZg00czGPtEk21mjaDzJ9cjKe42qvJS5Ysm1fZOdMbLweSzD6MrmHuaiEy0B4Ba19vKsxUlec5iPJbNGH1tKDfxr5XuXqjRByesA31KqkxhohoZ88EbQPjDqRglHtigRSRUOHNaexrVSXQT54bKnII2h2OIncDZ2XmxdgRBmAnzR.png	2023-04-02 16:48:59	2023-04-02 16:48:59
71	Dr. Fábio Ferminiano	Dr. Rogério Zaragoça	1974-11-07	107.323.471-14	Ym5LhStpfqSTP0a	pacientes_fotos/vo0OcfNWvxG1MPUdCM0YmOx9qlF28BJZwxsicsMW1dhl1MNX1ytrkFuH0pxpm4kQilSyCpq51MsIIywAj6UdGdb5jr7gl0dnWnauUbg6IVT9lzXsETnoKhWwESgGzbCgS2PtShPiZJyfnpNZLvQ0X0vYzlDRCc1tH7ubEiptaAW2dSy5C.png	2023-04-02 16:48:59	2023-04-02 16:48:59
72	Sr. Simão Aguiar Sobrinho	Heloise Rios	2014-09-09	450.297.146-42	65wBGwxVZr4TrfN	pacientes_fotos/ViBjwIik8ed2k5jTn8IpCmok9tHfCtI3f6AFC7loedxD2b3owZALedKoZ2VKKZgVWMHGshIDF7SCOeymlyyrVdCPJd8cIRZ7hTk24bK85hcFCXJwDP9rsfdrL5BnxGYHQjcjKHD3XBOSQ4aXvuJCcAEnKme5eO1hw0GxrwA6nUNyCakSP.png	2023-04-02 16:48:59	2023-04-02 16:48:59
73	Leonardo Quintana Caldeira	Yuri Jimenes Ferminiano Neto	2014-01-14	122.025.448-79	BsnkHYCfKtwSJ5X	pacientes_fotos/YxHr3XyCo4TBS6blErTWmemhTdvUpQ9VEULaUN9MyTrUjePS7Ire5beS9ggnAEbhQi4xWMtsLWUHRLW8SgJTibSGMjAag9bviQE7youiXGYNHBbKtvMZnCc1xgRaZgzdl30V2W5MPrrq6XdP2YprTyyX9JK4jNvqsaFf2627Y2lEuqYCB.png	2023-04-02 16:48:59	2023-04-02 16:48:59
74	Srta. Valentina Suelen Zambrano Filho	César Vega Filho	1978-12-04	435.211.729-37	gM4uKav7ovEqqht	pacientes_fotos/BLqajvCz8n379j6Wj8NQjghmJA4BhYN7UGLtsU31o5B94xWpCxx5gtcSEbJaO4UGZwRXQkuQwTHey9m1E6GHjIyyP8hvafjCUadYFLmGn4pc0455bJTKZd9xQbhJpO0tvK7pqJJQPrv5XsKxMcLaSpmgzCMhQp2fzTimFArVsevHjBuoI.png	2023-04-02 16:48:59	2023-04-02 16:48:59
75	Sra. Naomi Fontes Neto	Dr. Nelson Alcantara Estrada	2005-12-13	875.323.775-71	y1XoYj7WNVEOmSv	pacientes_fotos/LTDFjcSXyv8AeVtacK868SfuBZdiLjcaClX20E4Uu32ElV5f6MPdGbfYvBbhVIExd9aD5CD7mnAp47lVoVD3bLmtHoW1OFiCU3fIzF6Wib01Dax0cZEpm5pK6lt7JNS3zGJpn5uEFZIXTsXRSViQmJ9wtDfRAZpZZY50kPOoy2BTUs7jd.png	2023-04-02 16:48:59	2023-04-02 16:48:59
76	Sra. Priscila Mariana Salas	Regiane Isadora Lovato Jr.	1970-06-27	799.814.339-85	RrANt9qeWM76W7V	pacientes_fotos/wXoJElN93Dxi2v7KivUyIAOJFr2r61KjeLAh1Za5hxobaKkfVAq3ySHWFJykjdRFSTu05lXirpPlXLpFnwXr7r3qBnXyusVruZf8t2YbTkNWZw0WnbLO6i14CKXmk8p5OOVxxlwioO0xvNwDGyl6Lf5clx4VoV3XyArsS8Y92c8rCsPHh.png	2023-04-02 16:48:59	2023-04-02 16:48:59
77	Rafael Kevin Lutero	Liz Tamoio Espinoza Sobrinho	1984-10-28	237.119.831-54	sX26OBDJIPe9oDT	pacientes_fotos/8RSgbQFOzDEXMYGwBkc2jBbQpAPs28k1uFGuOSzNDiV3UGWVxtFEqdPEG8OwQ8IM5Qs7NSYpLSmYdNb7XGGX0cOuPf3hTDWMRMg5Kw178dABgqEXdHxpFovT1tEWOz8KJRMqDEg70TbQhXIn9Ghs6hHwf2D2ms7n1I8V7vY8Cf0L5Ck9I.png	2023-04-02 16:48:59	2023-04-02 16:48:59
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: om30
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: om30
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
2	App\\Models\\User	1	token	0ad00a3dc21a40c678fcb87c5ae097cfcb9afa1ca9c09f742879c2dc9b10af22	["*"]	2023-04-03 23:03:05	\N	2023-04-03 12:48:46	2023-04-03 23:03:05
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: om30
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
1	Om30 devs	om30@om30.com	\N	$2y$10$rzY/HhTrDSx73WSmAxMlOO9EJhZDA24DouKBwrCA6iBwsExChZJf.	\N	2023-04-02 17:36:00	2023-04-02 17:36:00
\.


--
-- Name: enderecos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: om30
--

SELECT pg_catalog.setval('public.enderecos_id_seq', 77, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: om30
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: om30
--

SELECT pg_catalog.setval('public.migrations_id_seq', 24, true);


--
-- Name: pacientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: om30
--

SELECT pg_catalog.setval('public.pacientes_id_seq', 77, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: om30
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: om30
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: enderecos enderecos_pkey; Type: CONSTRAINT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT enderecos_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: om30
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: enderecos enderecos_pacientes_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: om30
--

ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT enderecos_pacientes_id_foreign FOREIGN KEY (pacientes_id) REFERENCES public.pacientes(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

