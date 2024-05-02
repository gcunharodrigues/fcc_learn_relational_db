--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-05-02 10:26:01

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
-- TOC entry 216 (class 1259 OID 16731)
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_to_earth_in_lightyears integer,
    isophotal_diameter_in_lightyears integer,
    isophotal_diameter_in_parsecs numeric(5,2),
    is_visible_to_unaided_eye boolean
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16730)
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 215
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- TOC entry 222 (class 1259 OID 16771)
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100),
    moon_location character varying(100),
    moon_diameter_in_km integer,
    is_visible_to_unaided_eye boolean,
    planet_id integer NOT NULL,
    moon_mass_10e20_kg numeric(10,2)
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16770)
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO postgres;

--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 221
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- TOC entry 220 (class 1259 OID 16752)
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100),
    planet_type character varying(100),
    planet_diameter_in_km integer,
    is_visible_to_unaided_eye boolean,
    star_id integer NOT NULL,
    planet_mass_in_10e24_kg numeric(10,2)
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16751)
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO postgres;

--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 219
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- TOC entry 218 (class 1259 OID 16738)
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100),
    distance_to_earth_in_lightyears integer,
    star_temperature integer,
    mass_in_solar_mass numeric(5,2),
    is_visible_to_unaided_eye boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16737)
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.star_star_id_seq OWNER TO postgres;

--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 217
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- TOC entry 4649 (class 2604 OID 16734)
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- TOC entry 4652 (class 2604 OID 16774)
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- TOC entry 4651 (class 2604 OID 16755)
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- TOC entry 4650 (class 2604 OID 16741)
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- TOC entry 4814 (class 0 OID 16731)
-- Dependencies: 216
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.galaxy (galaxy_id, name, distance_to_earth_in_lightyears, isophotal_diameter_in_lightyears, isophotal_diameter_in_parsecs, is_visible_to_unaided_eye) FROM stdin;
2	Milky Way	0	100	30.80	t
6	Small Magellanic Cloud	200000	7	2.20	t
5	Large Magellanic Cloud	163000	14	4.30	t
1	Andromeda Galaxy	2500000	220	67.50	t
3	Triangulum Galaxy	3200000	60	18.50	t
4	Centaurus A	13000000	60	18.50	f
\.


--
-- TOC entry 4820 (class 0 OID 16771)
-- Dependencies: 222
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moon (moon_id, name, moon_location, moon_diameter_in_km, is_visible_to_unaided_eye, planet_id, moon_mass_10e20_kg) FROM stdin;
3	Phobos	Mars	22	t	6	1.08
4	Deimos	Mars	12	t	6	0.15
5	Io	Jupiter	3642	t	7	893.20
6	Europa	Jupiter	3122	t	7	480.00
7	Ganymede	Jupiter	5268	t	7	1481.90
8	Callisto	Jupiter	4821	t	7	1076.00
9	Mimas	Saturn	396	t	8	0.38
10	Enceladus	Saturn	504	t	8	1.08
11	Tethys	Saturn	1050	t	8	6.17
12	Dione	Saturn	1122	t	8	10.52
13	Rhea	Saturn	1530	t	8	23.06
14	Titan	Saturn	5152	t	8	1345.50
15	Miranda	Uranus	472	f	9	0.66
16	Ariel	Uranus	1158	f	9	13.53
17	Umbriel	Uranus	1170	f	9	12.17
18	Titania	Uranus	1578	f	9	35.27
19	Oberon	Uranus	1523	f	9	30.14
20	Triton	Neptune	2707	f	10	214.70
21	Nereid	Neptune	340	f	10	0.31
22	Charon	Pluto	1212	f	11	16.60
\.


--
-- TOC entry 4818 (class 0 OID 16752)
-- Dependencies: 220
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planet (planet_id, name, planet_type, planet_diameter_in_km, is_visible_to_unaided_eye, star_id, planet_mass_in_10e24_kg) FROM stdin;
3	Mercury	Terrestrial	4879	t	6	0.33
4	Venus	Terrestrial	12104	t	6	4.87
5	Earth	Terrestrial	12742	t	6	5.97
6	Mars	Terrestrial	6779	t	6	0.64
7	Jupiter	Gas Giant	142984	t	6	1900.00
8	Saturn	Gas Giant	120536	t	6	568.00
9	Uranus	Ice Giant	51118	t	6	86.80
10	Neptune	Ice Giant	49528	t	6	102.00
11	Pluto	Dwarf Planet	1430	f	6	0.01
12	Ceres	Dwarf Planet	945	f	6	0.01
13	Eris	Dwarf Planet	2326	f	6	0.02
14	Haumea	Dwarf Planet	1632	f	6	0.04
\.


--
-- TOC entry 4816 (class 0 OID 16738)
-- Dependencies: 218
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.star (star_id, name, distance_to_earth_in_lightyears, star_temperature, mass_in_solar_mass, is_visible_to_unaided_eye, galaxy_id) FROM stdin;
3	Andromeda XXVIII-1	2537000	5800	1.80	t	1
4	Andromeda XXXI-10	2537000	6100	2.30	t	1
5	Andromeda I-23	2537000	5500	1.50	t	1
6	Sun	0	5778	1.00	t	2
7	Alpha Centauri A	4	5790	1.10	t	2
8	Sirius A	9	9940	2.06	t	2
9	Triangulum Alpha	3000000	6000	1.50	f	3
10	Triangulum Beta	3000000	5500	2.00	f	3
11	Triangulum Gamma	3000000	6200	1.80	f	3
16	LMC-001	160000	5500	1.20	f	5
17	LMC-002	160000	6200	1.50	f	5
18	LMC-003	160000	4800	1.10	f	5
19	SMC-001	200000	5600	1.30	f	6
20	SMC-002	200000	6000	1.60	f	6
21	SMC-003	200000	4900	1.00	f	6
13	Alpha Centauri C	13000000	5790	1.10	t	4
14	Alpha Centauri B	13000000	5260	0.91	t	4
15	Proxima Centauri	13000000	3040	0.12	t	4
\.


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 215
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 221
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 219
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 217
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 21, true);


--
-- TOC entry 4654 (class 2606 OID 16736)
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- TOC entry 4664 (class 2606 OID 16784)
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- TOC entry 4666 (class 2606 OID 16776)
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- TOC entry 4660 (class 2606 OID 16782)
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- TOC entry 4662 (class 2606 OID 16757)
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- TOC entry 4656 (class 2606 OID 16780)
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- TOC entry 4658 (class 2606 OID 16743)
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- TOC entry 4669 (class 2606 OID 16785)
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- TOC entry 4668 (class 2606 OID 16765)
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- TOC entry 4667 (class 2606 OID 16746)
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


-- Completed on 2024-05-02 10:26:01

--
-- PostgreSQL database dump complete
--

