--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_to_earth_in_lightyears integer,
    isophotal_diameter_in_lightyears integer,
    isophotal_diameter_in_parsecs numeric(5,2),
    is_visible_to_unaided_eye boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
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


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
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


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
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


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: universe_relations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_relations (
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    universe_relations_id integer NOT NULL,
    description text NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.universe_relations OWNER TO freecodecamp;

--
-- Name: universe_relations_universe_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_relations_universe_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_relations_universe_relations_id_seq OWNER TO freecodecamp;

--
-- Name: universe_relations_universe_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_relations_universe_relations_id_seq OWNED BY public.universe_relations.universe_relations_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: universe_relations universe_relations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_relations ALTER COLUMN universe_relations_id SET DEFAULT nextval('public.universe_relations_universe_relations_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way', 0, 100, 30.80, true);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 200000, 7, 2.20, true);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 163000, 14, 4.30, true);
INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 2500000, 220, 67.50, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 3200000, 60, 18.50, true);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 13000000, 60, 18.50, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Phobos', 'Mars', 22, true, 6, 1.08);
INSERT INTO public.moon VALUES (4, 'Deimos', 'Mars', 12, true, 6, 0.15);
INSERT INTO public.moon VALUES (5, 'Io', 'Jupiter', 3642, true, 7, 893.20);
INSERT INTO public.moon VALUES (6, 'Europa', 'Jupiter', 3122, true, 7, 480.00);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Jupiter', 5268, true, 7, 1481.90);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Jupiter', 4821, true, 7, 1076.00);
INSERT INTO public.moon VALUES (9, 'Mimas', 'Saturn', 396, true, 8, 0.38);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Saturn', 504, true, 8, 1.08);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Saturn', 1050, true, 8, 6.17);
INSERT INTO public.moon VALUES (12, 'Dione', 'Saturn', 1122, true, 8, 10.52);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Saturn', 1530, true, 8, 23.06);
INSERT INTO public.moon VALUES (14, 'Titan', 'Saturn', 5152, true, 8, 1345.50);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Uranus', 472, false, 9, 0.66);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Uranus', 1158, false, 9, 13.53);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Uranus', 1170, false, 9, 12.17);
INSERT INTO public.moon VALUES (18, 'Titania', 'Uranus', 1578, false, 9, 35.27);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Uranus', 1523, false, 9, 30.14);
INSERT INTO public.moon VALUES (20, 'Triton', 'Neptune', 2707, false, 10, 214.70);
INSERT INTO public.moon VALUES (21, 'Nereid', 'Neptune', 340, false, 10, 0.31);
INSERT INTO public.moon VALUES (22, 'Charon', 'Pluto', 1212, false, 11, 16.60);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Mercury', 'Terrestrial', 4879, true, 6, 0.33);
INSERT INTO public.planet VALUES (4, 'Venus', 'Terrestrial', 12104, true, 6, 4.87);
INSERT INTO public.planet VALUES (5, 'Earth', 'Terrestrial', 12742, true, 6, 5.97);
INSERT INTO public.planet VALUES (6, 'Mars', 'Terrestrial', 6779, true, 6, 0.64);
INSERT INTO public.planet VALUES (7, 'Jupiter', 'Gas Giant', 142984, true, 6, 1900.00);
INSERT INTO public.planet VALUES (8, 'Saturn', 'Gas Giant', 120536, true, 6, 568.00);
INSERT INTO public.planet VALUES (9, 'Uranus', 'Ice Giant', 51118, true, 6, 86.80);
INSERT INTO public.planet VALUES (10, 'Neptune', 'Ice Giant', 49528, true, 6, 102.00);
INSERT INTO public.planet VALUES (11, 'Pluto', 'Dwarf Planet', 1430, false, 6, 0.01);
INSERT INTO public.planet VALUES (12, 'Ceres', 'Dwarf Planet', 945, false, 6, 0.01);
INSERT INTO public.planet VALUES (13, 'Eris', 'Dwarf Planet', 2326, false, 6, 0.02);
INSERT INTO public.planet VALUES (14, 'Haumea', 'Dwarf Planet', 1632, false, 6, 0.04);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Andromeda XXVIII-1', 2537000, 5800, 1.80, true, 1);
INSERT INTO public.star VALUES (4, 'Andromeda XXXI-10', 2537000, 6100, 2.30, true, 1);
INSERT INTO public.star VALUES (5, 'Andromeda I-23', 2537000, 5500, 1.50, true, 1);
INSERT INTO public.star VALUES (6, 'Sun', 0, 5778, 1.00, true, 2);
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', 4, 5790, 1.10, true, 2);
INSERT INTO public.star VALUES (8, 'Sirius A', 9, 9940, 2.06, true, 2);
INSERT INTO public.star VALUES (9, 'Triangulum Alpha', 3000000, 6000, 1.50, false, 3);
INSERT INTO public.star VALUES (10, 'Triangulum Beta', 3000000, 5500, 2.00, false, 3);
INSERT INTO public.star VALUES (11, 'Triangulum Gamma', 3000000, 6200, 1.80, false, 3);
INSERT INTO public.star VALUES (16, 'LMC-001', 160000, 5500, 1.20, false, 5);
INSERT INTO public.star VALUES (17, 'LMC-002', 160000, 6200, 1.50, false, 5);
INSERT INTO public.star VALUES (18, 'LMC-003', 160000, 4800, 1.10, false, 5);
INSERT INTO public.star VALUES (19, 'SMC-001', 200000, 5600, 1.30, false, 6);
INSERT INTO public.star VALUES (20, 'SMC-002', 200000, 6000, 1.60, false, 6);
INSERT INTO public.star VALUES (21, 'SMC-003', 200000, 4900, 1.00, false, 6);
INSERT INTO public.star VALUES (13, 'Alpha Centauri C', 13000000, 5790, 1.10, true, 4);
INSERT INTO public.star VALUES (14, 'Alpha Centauri B', 13000000, 5260, 0.91, true, 4);
INSERT INTO public.star VALUES (15, 'Proxima Centauri', 13000000, 3040, 0.12, true, 4);


--
-- Data for Name: universe_relations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_relations VALUES (2, 6, 7, 6, 1, 'moon', 'Europa');
INSERT INTO public.universe_relations VALUES (2, 6, 10, NULL, 2, 'planet', 'Neptune');
INSERT INTO public.universe_relations VALUES (1, 5, NULL, NULL, 3, 'star', 'Andromeda I-23');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 21, true);


--
-- Name: universe_relations_universe_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_relations_universe_relations_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: universe_relations universe_relations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_relations
    ADD CONSTRAINT universe_relations_name_key UNIQUE (name);


--
-- Name: universe_relations universe_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_relations
    ADD CONSTRAINT universe_relations_pkey PRIMARY KEY (universe_relations_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

