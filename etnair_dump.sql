--
-- PostgreSQL database dump
--

-- Dumped from database version 15.10 (Debian 15.10-0+deb12u1)
-- Dumped by pg_dump version 15.10 (Debian 15.10-0+deb12u1)

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
-- Name: logement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logement (
    "idLogement" integer NOT NULL,
    "idUser" integer,
    titre character varying(255),
    adresse character varying(255),
    "prixParNuit" numeric,
    description text,
    capacite integer
);


ALTER TABLE public.logement OWNER TO postgres;

--
-- Name: logement_idLogement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."logement_idLogement_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."logement_idLogement_seq" OWNER TO postgres;

--
-- Name: logement_idLogement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."logement_idLogement_seq" OWNED BY public.logement."idLogement";


--
-- Name: paiement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paiement (
    "idPaiement" integer NOT NULL,
    "idRes" integer,
    montant numeric,
    "datePaiement" timestamp without time zone,
    statut character varying(50)
);


ALTER TABLE public.paiement OWNER TO postgres;

--
-- Name: paiement_idPaiement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."paiement_idPaiement_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."paiement_idPaiement_seq" OWNER TO postgres;

--
-- Name: paiement_idPaiement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."paiement_idPaiement_seq" OWNED BY public.paiement."idPaiement";


--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    "idRes" integer NOT NULL,
    "idUser" integer,
    "idLogement" integer,
    "dateDebut" timestamp without time zone,
    "dateFin" timestamp without time zone,
    statut character varying(50)
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- Name: reservation_idRes_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."reservation_idRes_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."reservation_idRes_seq" OWNER TO postgres;

--
-- Name: reservation_idRes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."reservation_idRes_seq" OWNED BY public.reservation."idRes";


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    "idUser" integer NOT NULL,
    nom character varying(255),
    prenom character varying(255),
    mail character varying(255),
    numero integer,
    password character varying(255),
    role character varying(50)
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_idUser_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."user_idUser_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."user_idUser_seq" OWNER TO postgres;

--
-- Name: user_idUser_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."user_idUser_seq" OWNED BY public."user"."idUser";


--
-- Name: logement idLogement; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logement ALTER COLUMN "idLogement" SET DEFAULT nextval('public."logement_idLogement_seq"'::regclass);


--
-- Name: paiement idPaiement; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement ALTER COLUMN "idPaiement" SET DEFAULT nextval('public."paiement_idPaiement_seq"'::regclass);


--
-- Name: reservation idRes; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation ALTER COLUMN "idRes" SET DEFAULT nextval('public."reservation_idRes_seq"'::regclass);


--
-- Name: user idUser; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN "idUser" SET DEFAULT nextval('public."user_idUser_seq"'::regclass);


--
-- Data for Name: logement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logement ("idLogement", "idUser", titre, adresse, "prixParNuit", description, capacite) FROM stdin;
\.


--
-- Data for Name: paiement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paiement ("idPaiement", "idRes", montant, "datePaiement", statut) FROM stdin;
\.


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation ("idRes", "idUser", "idLogement", "dateDebut", "dateFin", statut) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" ("idUser", nom, prenom, mail, numero, password, role) FROM stdin;
1       Hunault alex    alex.leclerc@example.com        1122334455      sophiepassword  user
2       DaSilva david   david@example.com       1234567897      alexpassword    admin
3       KASSA   stark   stark@example.com       1122334457      sophiepassword  admin
\.


--
-- Name: logement_idLogement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."logement_idLogement_seq"', 1, false);


--
-- Name: paiement_idPaiement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."paiement_idPaiement_seq"', 1, false);


--
-- Name: reservation_idRes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reservation_idRes_seq"', 1, false);


--
-- Name: user_idUser_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."user_idUser_seq"', 3, true);


--
-- Name: logement logement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logement
    ADD CONSTRAINT logement_pkey PRIMARY KEY ("idLogement");


--
-- Name: paiement paiement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement
    ADD CONSTRAINT paiement_pkey PRIMARY KEY ("idPaiement");


--
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY ("idRes");


--
-- Name: user user_mail_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_mail_key UNIQUE (mail);


--
-- Name: user user_numero_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_numero_key UNIQUE (numero);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("idUser");


--
-- Name: reservation fk_logement_reservation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_logement_reservation FOREIGN KEY ("idLogement") REFERENCES public.logement("idLogement");


--
-- Name: paiement fk_reservation_paiement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement
    ADD CONSTRAINT fk_reservation_paiement FOREIGN KEY ("idRes") REFERENCES public.reservation("idRes");


--
-- Name: logement fk_user_logement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logement
    ADD CONSTRAINT fk_user_logement FOREIGN KEY ("idUser") REFERENCES public."user"("idUser");


--
-- Name: reservation fk_user_reservation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_user_reservation FOREIGN KEY ("idUser") REFERENCES public."user"("idUser");


--
-- PostgreSQL database dump complete
--