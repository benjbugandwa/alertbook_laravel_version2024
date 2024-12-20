--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

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
-- Name: airesantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airesantes (
    pcode_airesante character varying(255) NOT NULL,
    airesante_name character varying(255) NOT NULL,
    pcode_zonesante character varying(255) NOT NULL
);


ALTER TABLE public.airesantes OWNER TO postgres;

--
-- Name: alertes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alertes (
    id bigint NOT NULL,
    code_alerte character varying(255) NOT NULL,
    date_alerte date NOT NULL,
    description_fais text,
    type_incident_code character varying(255) DEFAULT '-'::character varying,
    mouvement_population character varying(255) DEFAULT 'Non'::character varying NOT NULL,
    impact_alerte character varying(255),
    alerte_status character varying(255) DEFAULT 'En attente'::character varying NOT NULL,
    auteur_presume character varying(255),
    profil_victime character varying(255),
    gravite_alerte character varying(255) DEFAULT 'Moderée'::character varying NOT NULL,
    reported_by character varying(255) NOT NULL,
    source_information character varying(255) NOT NULL,
    distance_position_fardc character varying(255),
    force_occupant_zone character varying(255),
    accessibilite_zone character varying(255),
    cause_inaccessibilite_zone character varying(255),
    recommandations text,
    pcode_province character varying(255) NOT NULL,
    pcode_territoire character varying(255) NOT NULL,
    pcode_chefferie character varying(255),
    pcode_groupement character varying(255),
    pcode_zonesante character varying(255) NOT NULL,
    pcode_airesante character varying(255),
    pcode_village character varying(255) NOT NULL,
    axe_route character varying(255),
    longitude character varying(255),
    latitude character varying(255),
    created_by character varying(255) NOT NULL,
    approved_by character varying(255) NOT NULL,
    "Approved_date" date,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.alertes OWNER TO postgres;

--
-- Name: alertes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alertes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alertes_id_seq OWNER TO postgres;

--
-- Name: alertes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alertes_id_seq OWNED BY public.alertes.id;


--
-- Name: auteurpresumes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auteurpresumes (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.auteurpresumes OWNER TO postgres;

--
-- Name: auteurpresumes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auteurpresumes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auteurpresumes_id_seq OWNER TO postgres;

--
-- Name: auteurpresumes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auteurpresumes_id_seq OWNED BY public.auteurpresumes.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: chefferies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chefferies (
    pcode_chefferie character varying(255) NOT NULL,
    chefferie_name character varying(255) NOT NULL,
    pcode_territoire character varying(255) NOT NULL
);


ALTER TABLE public.chefferies OWNER TO postgres;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: groupements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groupements (
    pcode_groupement character varying(255) NOT NULL,
    groupement_name character varying(255) NOT NULL,
    pcode_chefferie character varying(255) NOT NULL
);


ALTER TABLE public.groupements OWNER TO postgres;

--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: mouvementpopulations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mouvementpopulations (
    id bigint NOT NULL,
    alerte_id bigint NOT NULL,
    date_mouvement date,
    type_mouvement character varying(255) NOT NULL,
    pcode_province_provenance character varying(255) NOT NULL,
    pcode_territoire_provenance character varying(255) NOT NULL,
    village_provenance character varying(255) NOT NULL,
    pcode_province_accueil character varying(255) NOT NULL,
    pcode_territoire_accueil character varying(255) NOT NULL,
    village_accueil character varying(255) NOT NULL,
    nbre_personnes bigint DEFAULT '0'::bigint NOT NULL,
    nbre_menages bigint DEFAULT '0'::bigint NOT NULL,
    site_spontane character varying(255) DEFAULT 'Non'::character varying NOT NULL,
    commentaires text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.mouvementpopulations OWNER TO postgres;

--
-- Name: mouvementpopulations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mouvementpopulations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mouvementpopulations_id_seq OWNER TO postgres;

--
-- Name: mouvementpopulations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mouvementpopulations_id_seq OWNED BY public.mouvementpopulations.id;


--
-- Name: organisations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organisations (
    code_organisation character varying(255) NOT NULL,
    denomination character varying(255) NOT NULL,
    type_organisation character varying(255) NOT NULL,
    secteur_activite character varying(255),
    telephone_contact character varying(255)
);


ALTER TABLE public.organisations OWNER TO postgres;

--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: profilvictimes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profilvictimes (
    profil_code character varying(255) NOT NULL,
    explication_violation character varying(255)
);


ALTER TABLE public.profilvictimes OWNER TO postgres;

--
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    pcode_province character varying(255) NOT NULL,
    province_name character varying(255) NOT NULL,
    country_code character varying(255) NOT NULL
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- Name: reponses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reponses (
    id bigint NOT NULL,
    alerte_id bigint NOT NULL,
    date_reponse date,
    type_reponse character varying(255) NOT NULL,
    code_organisation character varying(255) NOT NULL,
    modalite_reponse character varying(255) NOT NULL,
    secteur_couvert character varying(255) NOT NULL,
    nbre_personnes_assistees bigint DEFAULT '0'::bigint NOT NULL,
    nbre_menages_assistes bigint DEFAULT '0'::bigint NOT NULL,
    commentaires text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.reponses OWNER TO postgres;

--
-- Name: reponses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reponses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reponses_id_seq OWNER TO postgres;

--
-- Name: reponses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reponses_id_seq OWNED BY public.reponses.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: territoires; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.territoires (
    pcode_territoire character varying(255) NOT NULL,
    territoire_name character varying(255) NOT NULL,
    pcode_province character varying(255) NOT NULL
);


ALTER TABLE public.territoires OWNER TO postgres;

--
-- Name: typeincidents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typeincidents (
    id bigint NOT NULL,
    code_type_incident character varying(255) NOT NULL,
    designation_type_incident character varying(255) NOT NULL,
    description_incident text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.typeincidents OWNER TO postgres;

--
-- Name: typeincidents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.typeincidents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.typeincidents_id_seq OWNER TO postgres;

--
-- Name: typeincidents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.typeincidents_id_seq OWNED BY public.typeincidents.id;


--
-- Name: typeviolations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typeviolations (
    code_violation_sar character varying(255) NOT NULL,
    designation_violation character varying(255) NOT NULL,
    explication_violation character varying(255)
);


ALTER TABLE public.typeviolations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    code_organisation character varying(255),
    user_role character varying(255),
    phone_number character varying(255) NOT NULL,
    is_active character varying(255) DEFAULT 'Non'::character varying NOT NULL,
    province_code character varying(255) NOT NULL,
    desactivated_by character varying(255),
    desactivate_reason text NOT NULL,
    access_level character varying(255),
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: violationalertes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.violationalertes (
    id bigint NOT NULL,
    alerte_id bigint NOT NULL,
    date_violation date,
    type_violation character varying(255) NOT NULL,
    details_violation text NOT NULL,
    nombre_total_victimes integer NOT NULL,
    nombre_victimes_hommes integer NOT NULL,
    nombre_victimes_femmes integer NOT NULL,
    nombre_victimes_enfants integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.violationalertes OWNER TO postgres;

--
-- Name: violationalertes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.violationalertes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.violationalertes_id_seq OWNER TO postgres;

--
-- Name: violationalertes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.violationalertes_id_seq OWNED BY public.violationalertes.id;


--
-- Name: zonesantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zonesantes (
    pcode_zonesante character varying(255) NOT NULL,
    zonesante_name character varying(255) NOT NULL,
    pcode_territoire character varying(255) NOT NULL
);


ALTER TABLE public.zonesantes OWNER TO postgres;

--
-- Name: alertes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertes ALTER COLUMN id SET DEFAULT nextval('public.alertes_id_seq'::regclass);


--
-- Name: auteurpresumes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auteurpresumes ALTER COLUMN id SET DEFAULT nextval('public.auteurpresumes_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: mouvementpopulations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvementpopulations ALTER COLUMN id SET DEFAULT nextval('public.mouvementpopulations_id_seq'::regclass);


--
-- Name: reponses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reponses ALTER COLUMN id SET DEFAULT nextval('public.reponses_id_seq'::regclass);


--
-- Name: typeincidents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typeincidents ALTER COLUMN id SET DEFAULT nextval('public.typeincidents_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: violationalertes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.violationalertes ALTER COLUMN id SET DEFAULT nextval('public.violationalertes_id_seq'::regclass);


--
-- Data for Name: airesantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airesantes (pcode_airesante, airesante_name, pcode_zonesante) FROM stdin;
\.


--
-- Data for Name: alertes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alertes (id, code_alerte, date_alerte, description_fais, type_incident_code, mouvement_population, impact_alerte, alerte_status, auteur_presume, profil_victime, gravite_alerte, reported_by, source_information, distance_position_fardc, force_occupant_zone, accessibilite_zone, cause_inaccessibilite_zone, recommandations, pcode_province, pcode_territoire, pcode_chefferie, pcode_groupement, pcode_zonesante, pcode_airesante, pcode_village, axe_route, longitude, latitude, created_by, approved_by, "Approved_date", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: auteurpresumes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auteurpresumes (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: chefferies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chefferies (pcode_chefferie, chefferie_name, pcode_territoire) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: groupements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groupements (pcode_groupement, groupement_name, pcode_chefferie) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2024_12_19_120530_create_alertes_table	2
5	2024_12_19_120808_create_provinces_table	2
6	2024_12_19_120842_create_organisations_table	2
7	2024_12_19_121407_create_territoires_table	2
8	2024_12_19_121605_create_chefferies_table	2
9	2024_12_19_121953_create_groupements_table	2
10	2024_12_19_122140_create_zonesantes_table	2
11	2024_12_19_122204_create_airesantes_table	2
12	2024_12_19_122742_create_typeincidents_table	2
13	2024_12_19_124931_create_auteurpresumes_table	2
14	2024_12_19_124953_create_profilvictimes_table	2
15	2024_12_19_125140_create_typeviolations_table	2
16	2024_12_19_125203_create_violationalertes_table	2
17	2024_12_19_125238_create_mouvementpopulations_table	2
18	2024_12_19_125412_create_reponses_table	2
19	2024_12_19_154306_2024_12_125490_apply_foreignkeys	3
\.


--
-- Data for Name: mouvementpopulations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mouvementpopulations (id, alerte_id, date_mouvement, type_mouvement, pcode_province_provenance, pcode_territoire_provenance, village_provenance, pcode_province_accueil, pcode_territoire_accueil, village_accueil, nbre_personnes, nbre_menages, site_spontane, commentaires, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: organisations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organisations (code_organisation, denomination, type_organisation, secteur_activite, telephone_contact) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: profilvictimes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profilvictimes (profil_code, explication_violation) FROM stdin;
\.


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinces (pcode_province, province_name, country_code) FROM stdin;
\.


--
-- Data for Name: reponses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reponses (id, alerte_id, date_reponse, type_reponse, code_organisation, modalite_reponse, secteur_couvert, nbre_personnes_assistees, nbre_menages_assistes, commentaires, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
4YO6WQpBnr2GXZRxHiopobzuZHcGQYPiyDfz70S7	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiejVHSmJyTzRaOXM4NjM2TjlqbDhrbU9nRWJESVRWZmdmeUhvNE1UaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9iYXNpY2F1dGhhcHAudGVzdDo4MDgwL3Bhc3N3b3JkL3Jlc2V0Ijt9fQ==	1734605559
67s9mLpuPpDIKTeEiGj5iRl8asvadzuD9XzMcPqi	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOG04cXZGeUVpTTUxSXMwek9UbklaQkp3aEgycnp1VTF4T0VRek1URSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9hbGVydGJvb2tjbHVzdGVyLnRlc3Q6ODA4MCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1734606567
\.


--
-- Data for Name: territoires; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.territoires (pcode_territoire, territoire_name, pcode_province) FROM stdin;
\.


--
-- Data for Name: typeincidents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.typeincidents (id, code_type_incident, designation_type_incident, description_incident, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: typeviolations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.typeviolations (code_violation_sar, designation_violation, explication_violation) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, code_organisation, user_role, phone_number, is_active, province_code, desactivated_by, desactivate_reason, access_level, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: violationalertes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.violationalertes (id, alerte_id, date_violation, type_violation, details_violation, nombre_total_victimes, nombre_victimes_hommes, nombre_victimes_femmes, nombre_victimes_enfants, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: zonesantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zonesantes (pcode_zonesante, zonesante_name, pcode_territoire) FROM stdin;
\.


--
-- Name: alertes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alertes_id_seq', 1, false);


--
-- Name: auteurpresumes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auteurpresumes_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 19, true);


--
-- Name: mouvementpopulations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mouvementpopulations_id_seq', 1, false);


--
-- Name: reponses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reponses_id_seq', 1, false);


--
-- Name: typeincidents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.typeincidents_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: violationalertes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.violationalertes_id_seq', 1, false);


--
-- Name: airesantes airesantes_airesante_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airesantes
    ADD CONSTRAINT airesantes_airesante_name_unique UNIQUE (airesante_name);


--
-- Name: airesantes airesantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airesantes
    ADD CONSTRAINT airesantes_pkey PRIMARY KEY (pcode_airesante);


--
-- Name: alertes alertes_code_alerte_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertes
    ADD CONSTRAINT alertes_code_alerte_unique UNIQUE (code_alerte);


--
-- Name: alertes alertes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertes
    ADD CONSTRAINT alertes_pkey PRIMARY KEY (id);


--
-- Name: auteurpresumes auteurpresumes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auteurpresumes
    ADD CONSTRAINT auteurpresumes_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: chefferies chefferies_chefferie_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chefferies
    ADD CONSTRAINT chefferies_chefferie_name_unique UNIQUE (chefferie_name);


--
-- Name: chefferies chefferies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chefferies
    ADD CONSTRAINT chefferies_pkey PRIMARY KEY (pcode_chefferie);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: groupements groupements_groupement_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupements
    ADD CONSTRAINT groupements_groupement_name_unique UNIQUE (groupement_name);


--
-- Name: groupements groupements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupements
    ADD CONSTRAINT groupements_pkey PRIMARY KEY (pcode_groupement);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: mouvementpopulations mouvementpopulations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvementpopulations
    ADD CONSTRAINT mouvementpopulations_pkey PRIMARY KEY (id);


--
-- Name: organisations organisations_denomination_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organisations
    ADD CONSTRAINT organisations_denomination_unique UNIQUE (denomination);


--
-- Name: organisations organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organisations
    ADD CONSTRAINT organisations_pkey PRIMARY KEY (code_organisation);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: profilvictimes profilvictimes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profilvictimes
    ADD CONSTRAINT profilvictimes_pkey PRIMARY KEY (profil_code);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (pcode_province);


--
-- Name: provinces provinces_province_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_province_name_unique UNIQUE (province_name);


--
-- Name: reponses reponses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reponses
    ADD CONSTRAINT reponses_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: territoires territoires_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territoires
    ADD CONSTRAINT territoires_pkey PRIMARY KEY (pcode_territoire);


--
-- Name: territoires territoires_territoire_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territoires
    ADD CONSTRAINT territoires_territoire_name_unique UNIQUE (territoire_name);


--
-- Name: typeincidents typeincidents_code_type_incident_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typeincidents
    ADD CONSTRAINT typeincidents_code_type_incident_unique UNIQUE (code_type_incident);


--
-- Name: typeincidents typeincidents_designation_type_incident_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typeincidents
    ADD CONSTRAINT typeincidents_designation_type_incident_unique UNIQUE (designation_type_incident);


--
-- Name: typeincidents typeincidents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typeincidents
    ADD CONSTRAINT typeincidents_pkey PRIMARY KEY (id);


--
-- Name: typeviolations typeviolations_designation_violation_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typeviolations
    ADD CONSTRAINT typeviolations_designation_violation_unique UNIQUE (designation_violation);


--
-- Name: typeviolations typeviolations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typeviolations
    ADD CONSTRAINT typeviolations_pkey PRIMARY KEY (code_violation_sar);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: violationalertes violationalertes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.violationalertes
    ADD CONSTRAINT violationalertes_pkey PRIMARY KEY (id);


--
-- Name: zonesantes zonesantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zonesantes
    ADD CONSTRAINT zonesantes_pkey PRIMARY KEY (pcode_zonesante);


--
-- Name: zonesantes zonesantes_zonesante_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zonesantes
    ADD CONSTRAINT zonesantes_zonesante_name_unique UNIQUE (zonesante_name);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: airesantes airesantes_pcode_zonesante_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airesantes
    ADD CONSTRAINT airesantes_pcode_zonesante_foreign FOREIGN KEY (pcode_zonesante) REFERENCES public.zonesantes(pcode_zonesante) ON DELETE CASCADE;


--
-- Name: chefferies chefferies_pcode_territoire_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chefferies
    ADD CONSTRAINT chefferies_pcode_territoire_foreign FOREIGN KEY (pcode_territoire) REFERENCES public.territoires(pcode_territoire) ON DELETE CASCADE;


--
-- Name: groupements groupements_pcode_chefferie_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groupements
    ADD CONSTRAINT groupements_pcode_chefferie_foreign FOREIGN KEY (pcode_chefferie) REFERENCES public.chefferies(pcode_chefferie) ON DELETE CASCADE;


--
-- Name: mouvementpopulations mouvementpopulations_alerte_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mouvementpopulations
    ADD CONSTRAINT mouvementpopulations_alerte_id_foreign FOREIGN KEY (alerte_id) REFERENCES public.alertes(id) ON DELETE CASCADE;


--
-- Name: reponses reponses_alerte_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reponses
    ADD CONSTRAINT reponses_alerte_id_foreign FOREIGN KEY (alerte_id) REFERENCES public.alertes(id) ON DELETE CASCADE;


--
-- Name: territoires territoires_pcode_province_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territoires
    ADD CONSTRAINT territoires_pcode_province_foreign FOREIGN KEY (pcode_province) REFERENCES public.provinces(pcode_province) ON DELETE CASCADE;


--
-- Name: users users_code_organisation_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_code_organisation_foreign FOREIGN KEY (code_organisation) REFERENCES public.organisations(code_organisation) ON DELETE CASCADE;


--
-- Name: violationalertes violationalertes_alerte_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.violationalertes
    ADD CONSTRAINT violationalertes_alerte_id_foreign FOREIGN KEY (alerte_id) REFERENCES public.alertes(id) ON DELETE CASCADE;


--
-- Name: zonesantes zonesantes_pcode_territoire_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zonesantes
    ADD CONSTRAINT zonesantes_pcode_territoire_foreign FOREIGN KEY (pcode_territoire) REFERENCES public.territoires(pcode_territoire) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

